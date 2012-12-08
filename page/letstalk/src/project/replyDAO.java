package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class replyDAO {
	public static DataSource getDataSource() throws NamingException{
		Context initCtx = null;
		Context envCtx = null;

		initCtx = new InitialContext();
		envCtx = (Context) initCtx.lookup("java:comp/env");

		return (DataSource) envCtx.lookup("jdbc/WebDB");
	}
	
	public static boolean sendreply(reply rp) throws SQLException, NamingException{

		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try{
			conn = ds.getConnection();
			
			stmt = conn.prepareStatement("INSERT INTO reply(opinion_id,writer, content) VALUES (?, ?, ?);");
			stmt.setString(1, rp.getOpinion_id());
			stmt.setString(2, rp.getWriter());
			stmt.setString(3, rp.getContent());

			result = stmt.executeUpdate();
		}finally {
			if(rs!=null) try{rs.close();} catch(SQLException e){}
			if(stmt!=null) try{stmt.close();} catch(SQLException e){}
			if(conn!=null) try{conn.close();} catch(SQLException e){}
		}
		return (result==1);
	}
}
