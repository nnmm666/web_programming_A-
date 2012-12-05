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

import bean.Opinion;
import bean.Reply;

public class OpinionDAO {
	public static DataSource getDataSource() throws NamingException {
		Context initCtx = null;
		Context envCtx = null;

		// Obtain our environment naming context
		initCtx = new InitialContext();
		envCtx = (Context) initCtx.lookup("java:comp/env");

		// Look up our data source
		return (DataSource) envCtx.lookup("jdbc/WebDB");
	}
	
	public static List<Opinion> getOpinions(int topic_id) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
				
		List<Opinion> list = new ArrayList<Opinion>();
		
		DataSource ds = getDataSource();
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM opinion WHERE topic_id=?");
			stmt.setInt(1, topic_id);
			rs = stmt.executeQuery();
			while(rs.next()) {
				List<Reply> replies = ReplyDAO.getReplies(rs.getInt("id"));
				
				list.add(new Opinion(rs.getInt("id"), rs.getInt("topic_id"), rs.getString("content"), rs.getString("writer"),
						rs.getString("position"), rs.getInt("pros"), rs.getInt("cons"), rs.getString("date"), replies));
			}
			
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(stmt != null) try {stmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return list;
	}
	
	public static Opinion findById(int id) throws NamingException, SQLException {
		Opinion opinion = null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM opinion WHERE id = ?");
			stmt.setInt(1, id);
			
			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				List<Reply> replies = ReplyDAO.getReplies(id);
				
				opinion = new Opinion(rs.getInt("id"), rs.getInt("topic_id"), rs.getString("content"), rs.getString("writer"),
						rs.getString("position"), rs.getInt("pros"), rs.getInt("cons"), rs.getString("date"), replies);
			}
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return opinion;
	}
}