import java.sql.*;

import javax.naming.*;
import javax.sql.*;

public class UserDao {
	public static DataSource getDataSource() throws NamingException{
		Context initCtx= null;
		Context envCtx=  null;

		initCtx = new InitialContext();
		envCtx = (Context) initCtx.lookup("java:comp/env");

		return (DataSource) envCtx.lookup("jdbc/park");
	}

	public static Users FindById(int id ) throws NamingException, SQLException {
		Users user = null;

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {

			conn = ds.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
			stmt.setInt(1,id);

			rs = stmt.executeQuery();

			if(rs.next()){
				user =  new Users(
						rs.getInt("id"),
						rs.getString("userid"),
						rs.getString("name"),
						rs.getString("passoword"),
						rs.getString("email"),
						rs.getString("country"),
						rs.getString("gender"),
						rs.getString("hobby")		
			);

			}	
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(conn != null)try{conn.close();}catch(SQLException e){}
			if(stmt != null)try{stmt.close();}catch(SQLException e){}
		}
		return user;
	}


	public static boolean create(Users user) throws SQLException, NamingException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();
		try { 
			conn = ds.getConnection();
			stmt = conn.prepareStatement("INSERT INTP users(id, name , userid , pwd , email, country, gender ,hobby) "+"VALUES(?,?,?,?,?,?,?,?)");

			stmt.setInt (1, user.getId());
			stmt.setString (2, user.getName());
			stmt.setString (3, user.getUserid());
			stmt.setString (4, user.getPassoword());
			stmt.setString (5, user.getEmail());
			stmt.setString (6, user.getCountry());
			stmt.setString (7, user.getGender() ) ;
			stmt.setString (8, user.getHobby());

			result = stmt.executeUpdate();

		} 
		finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(conn != null)try{conn.close();}catch(SQLException e){}
			if(stmt != null)try{stmt.close();}catch(SQLException e){}
		}	
		return (result==1);
	}
	public static boolean update(Users user) throws SQLException , NamingException {

		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();
		try {
			conn = ds.getConnection();

			stmt = conn.prepareStatement("UPDATE users" + "SET userid ? ,name =? ,email = ? ,country =? ,gender = ? ,hobby=?" + "WHERE id = ?");

			stmt.setString (1, user.getUserid());
			stmt.setString (2, user.getName());
			stmt.setString (3, user.getEmail());
			stmt.setString (4, user.getCountry());
			stmt.setString (5, user.getGender()) ;
			stmt.setString (6, user.getHobby());
			stmt.setInt (7, user.getId());

			result = stmt.executeUpdate();		
		} 
		finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(conn != null)try{conn.close();}catch(SQLException e){}
			if(stmt != null)try{stmt.close();}catch(SQLException e){}
		}	
		return (result==1);
	}

	public static boolean remove(int id) throws NamingException,SQLException {
		int result ;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {
			conn = ds.getConnection();

			stmt = conn.prepareStatement("DELETE FROM users WHERE id = ?");
			stmt.setInt(1,id);

			result = stmt.executeUpdate();
		}
		finally {
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(conn != null)try{conn.close();}catch(SQLException e){}
			if(stmt != null)try{stmt.close();}catch(SQLException e){}
		}	
		return (result==1);
	}

}

