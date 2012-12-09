package DAO;

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


import bean.Reply;

public class ReplyDAO {
	public static DataSource getDataSource() throws NamingException {
		Context initCtx = null;
		Context envCtx = null;

		// Obtain our environment naming context
		initCtx = new InitialContext();
		envCtx = (Context) initCtx.lookup("java:comp/env");

		// Look up our data source
		return (DataSource) envCtx.lookup("jdbc/WebDB");
	}
	
	public static List<Reply> getReplies(int opinion_id) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
				
		List<Reply> list = new ArrayList<Reply>();
		
		DataSource ds = getDataSource();
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement("SELECT *, substr(date, 1, 16) as convDate FROM reply WHERE opinion_id=?");
			stmt.setInt(1, opinion_id);
			rs = stmt.executeQuery();
			while(rs.next()) {
				list.add(new Reply(rs.getInt("id"), rs.getInt("opinion_id"), rs.getString("content"), rs.getString("writer"),
						rs.getString("convDate")));
			}
			
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(stmt != null) try {stmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return list;
	}
	
	public static Reply findById(int id) throws NamingException, SQLException {
		Reply reply = null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM reply WHERE id = ?");
			stmt.setInt(1, id);
			
			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				reply = new Reply(rs.getInt("id"), rs.getInt("opinion_id"), rs.getString("content"), rs.getString("writer"),
						rs.getString("date"));
			}
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return reply;
	}
	public static boolean sendreply(Reply rp) throws SQLException, NamingException{

		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try{
			conn = ds.getConnection();
			
			stmt = conn.prepareStatement("INSERT INTO reply(opinion_id, content, writer) VALUES (?, ?, ?);");
			stmt.setInt(1, rp.getOpinion_id());
			stmt.setString(2, rp.getContent());
			stmt.setString(3, rp.getWriter());

			result = stmt.executeUpdate();
		}finally {
			if(rs!=null) try{rs.close();} catch(SQLException e){}
			if(stmt!=null) try{stmt.close();} catch(SQLException e){}
			if(conn!=null) try{conn.close();} catch(SQLException e){}
		}
		return (result==1);
	}
	public static boolean remove(int id) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		int result;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();
			
			stmt = conn.prepareStatement("DELETE FROM reply where id=?");
			stmt.setInt(1,id);
			
			result = stmt.executeUpdate();	
				
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return (result == 1);
	}
}
