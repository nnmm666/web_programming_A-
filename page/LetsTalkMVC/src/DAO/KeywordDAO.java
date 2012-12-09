package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import bean.Keyword;

public class KeywordDAO {
	public static DataSource getDataSource() throws NamingException {
		Context initCtx = null;
		Context envCtx = null;

		// Obtain our environment naming context
		initCtx = new InitialContext();
		envCtx = (Context) initCtx.lookup("java:comp/env");

		// Look up our data source
		return (DataSource) envCtx.lookup("jdbc/WebDB");
	}

	public static List<Keyword> getKeywords() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
				
		List<Keyword> list = new ArrayList<Keyword>();
		
		DataSource ds = getDataSource();
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM keyword");
			rs = stmt.executeQuery();
			while(rs.next()) {
				list.add(new Keyword(rs.getInt("id"), rs.getString("keyword"), 
						rs.getInt("weight"), rs.getString("type"), rs.getString("date")));
			}
			
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(stmt != null) try {stmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return list;
	}
	
	
	public static Keyword findById(int id) throws NamingException, SQLException {
		Keyword keyword = null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM keyword WHERE id = ?");
			stmt.setInt(1, id);
			
			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				keyword = new Keyword(rs.getInt("id"), rs.getString("keyword"),
						rs.getInt("weight"), rs.getString("type"), rs.getString("date"));
			}	
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return keyword;
	}
	
	public static boolean sendkeyword(Keyword key) throws SQLException, NamingException{

		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try{
			conn = ds.getConnection();
			
			stmt = conn.prepareStatement("INSERT INTO keyword (keyword,weight,type)"
					+ " VALUES(?,?,?)");
			stmt.setString(1, key.getKeyword());
			stmt.setInt(2, 500);
			stmt.setString(3, "reg");

			result = stmt.executeUpdate();
		}finally {
			if(rs!=null) try{rs.close();} catch(SQLException e){}
			if(stmt!=null) try{stmt.close();} catch(SQLException e){}
			if(conn!=null) try{conn.close();} catch(SQLException e){}
		}
		return (result==1);
	}
	
	public static List<String> getKeyword() throws SQLException, NamingException {
		List<String> list = new ArrayList<String>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		String keywords="";
	
		try {
			conn = ds.getConnection();
			
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select keyword from keyword");
			
			while(rs.next()) {
				keywords = rs.getString("keyword");
				list.add(keywords);
			}
			
			stmt.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		return list;
	}
}
