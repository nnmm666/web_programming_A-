import java.sql.*;

import javax.naming.*;
import javax.sql.*;

import org.apache.tomcat.jni.User;


public class UserDao {
	public static DataSource getDataSource() throws NamingException{
		Context initCtx= null;
		Context envCtx=  null;
		
		initCtx = new InitialContext();
		envCtx = (Context) initCtx.lookup("java:comp/env");
		
		return (DataSource) envCtx.lookup("jdbc/park");
	}

	public static User FindById(int id ) throws NamingException, SQLException {
			User user = null;
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			DataSource ds = getDataSource();
			
			try {
				
				conn = ds.getConnection();
				pstmt = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
				pstmt = setInt(1,id);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					user =  new User(rs.getInt("id"),
							rs.getString("userid"),
							rs.getString("name"),
							rs.getString("passoword"),
							rs.getString("email"),
							rs.getString("country"),
							rs.getString("gender"),
							rs.getString("hobby"));
				}	
				} finally {
						if(rs != null)try{rs.close();}catch(SQLException e){}
						if(conn != null)try{conn.close();}catch(SQLException e){}
						if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
				}
				return user;
			}
			
	}

public static boolean create(User user) throws SQLException, NamingException {
		int result;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		try { 
			conn = ds.getConnection();
		pstmt = conn.prepareStatement("INSERT INTP users(userid , name , pwd , email, gender ,favorites) "+"VALUES(?,?,?,?,?,?)");
			
			pstmt.setString (1, user.getId());
			pstmt.setString (2, user.getName());
			pstmt.setString (3, user.getUserid());
			pstmt.setString (4, user.getPassoword());
			pstmt.setString (5, user.getEmail());
			pstmt.setString (6, user.getcountry());
			pstmt.setString (7, user.getgender() ) ;
			pstmt.setString (8, user.gethobby());
			
			result = pstmt.executeUpdate();
			
			} 
			finally {
				if(rs != null)try{rs.close();}catch(SQLException e){}
				if(conn != null)try{conn.close();}catch(SQLException e){}
				if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
					}	
				return (result==1);
			}
public static boolean update(User user) throws SQLException , NamingException {
	
		int result;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		try {
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement("UPDATE users" + "SET userid ? ,name =? ,email = ? ,country =? ,gender = ? ,hobby=?" + "WHERE id = ?");
			
			pstmt.setString (1, user.getId());
			pstmt.setString (2, user.getName());
			pstmt.setString (3, user.getUserid());
			pstmt.setString (4, user.getPassoword());
			pstmt.setString (5, user.getEmail());
			pstmt.setString (6, user.getcountry());
			pstmt.setString (7, user.getgender() ) ;
			pstmt.setString (8, user.gethobby());
			
			result = pstmt.executeUpdate();		
		} 
		finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(conn != null)try{conn.close();}catch(SQLException e){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
				}	
			return (result==1);
		}
				
		public static boolean remove(int id) throws NamingException,SQLException {
				int result ;
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				DataSource ds = getDataSource();
				
				try {
					conn = ds.getConnection();
						
					pstmt = conn.prepareStatement("DELETE FROM users WHERE id = ?");
					pstmt.setInt(1,id);
					
					result = pstmt.executeUpdate();
				}
					finally {
						if(rs != null)try{rs.close();}catch(SQLException e){}
						if(conn != null)try{conn.close();}catch(SQLException e){}
						if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
							}	
						return (result==1);
					}
					
				}

