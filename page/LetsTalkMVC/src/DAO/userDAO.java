package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import bean.User;

public class userDAO {
	public static DataSource getDataSource() throws NamingException {
		Context initCtx = null;
		Context envCtx = null;

		// Obtain our environment naming context
		initCtx = new InitialContext();
		envCtx = (Context) initCtx.lookup("java:comp/env");

		// Look up our data source
		return (DataSource) envCtx.lookup("jdbc/WebDB");
	}
	
	public static User findById(int id) throws NamingException, SQLException {
		User user = null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
			stmt.setInt(1, id);
			
			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				user = new User(rs.getInt("id"), rs.getString("email"), rs.getString("nickname"),
						rs.getString("name"), rs.getString("password"), rs.getString("photo"));
			}	
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return user;
	}

	public static User findById(String email) throws NamingException, SQLException {
		User user = null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
			stmt.setString(1, email);
			
			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				user = new User(rs.getInt("id"), rs.getString("email"), rs.getString("nickname"),
						rs.getString("name"), rs.getString("password"), rs.getString("photo"));
			}	
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return user;
	}
	
	public static boolean insert(String email, String nickname, String name, String password, String photo) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		int result;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement("INSERT INTO users VALUES (null, ?, ?, ?, password(?), ?)");
			stmt.setString(1, email);
			stmt.setString(2, nickname);
			stmt.setString(3, name);
			stmt.setString(4, password);
			stmt.setString(5, photo);
			
			result = stmt.executeUpdate();	
				
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return (result == 1);
	}
}
