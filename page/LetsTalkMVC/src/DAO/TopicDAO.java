package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import bean.PageResult;
import bean.Topic;

public class TopicDAO {
	public static DataSource getDataSource() throws NamingException {
		Context initCtx = null;
		Context envCtx = null;

		// Obtain our environment naming context
		initCtx = new InitialContext();
		envCtx = (Context) initCtx.lookup("java:comp/env");

		// Look up our data source
		return (DataSource) envCtx.lookup("jdbc/WebDB");
	}
	
	public static PageResult<Topic> getTopicPage(int page, int keyword_id) throws SQLException, NamingException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;		

		if (page <= 0) {
			page = 1;
		}
		
		DataSource ds = getDataSource();
		PageResult<Topic> result = new PageResult<Topic>(3, page);
		
		int startPos = (page - 1) * 3;
		
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement("SELECT COUNT(*)" +
					" FROM keyword JOIN topic ON keyword.id = topic.keyword_id WHERE keyword_id=?");
			stmt.setInt(1, keyword_id);
	 		rs = stmt.executeQuery();
			rs.next();
			result.setNumItems(rs.getInt(1));
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
				 		
			stmt = conn.prepareStatement("SELECT *, substr(topic.date, 1, 10) as date" +
					" FROM keyword JOIN topic ON keyword.id = topic.keyword_id WHERE keyword_id=? ORDER BY pros LIMIT ?, 3");
			stmt.setInt(1, keyword_id);
			stmt.setInt(2, startPos);
			
			rs = stmt.executeQuery();
			while(rs.next()) {
				result.getList().add(new Topic(rs.getInt("id"), rs.getInt("keyword_id"),
						rs.getString("content"), rs.getString("writer"), rs.getInt("pros"),
						rs.getInt("cons"), rs.getString("date"), rs.getString("photo")));
			}
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return result;		
	}
	
	public static Topic findById(int id) throws NamingException, SQLException {
		Topic topic = null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM topic WHERE id = ?");
			stmt.setInt(1, id);
			
			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				topic = new Topic(rs.getInt("id"), rs.getInt("keyword_id"), rs.getString("content"), rs.getString("writer"),
						rs.getInt("pros"), rs.getInt("cons"), rs.getString("date"), rs.getString("photo"));
			}
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return topic;
	}
}