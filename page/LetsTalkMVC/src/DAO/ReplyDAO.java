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
			stmt = conn.prepareStatement("SELECT * FROM reply WHERE opinion_id=?");
			stmt.setInt(1, opinion_id);
			rs = stmt.executeQuery();
			while(rs.next()) {
				list.add(new Reply(rs.getInt("id"), rs.getInt("opinion_id"), rs.getString("content"), rs.getString("writer"),
						rs.getString("date")));
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
}
