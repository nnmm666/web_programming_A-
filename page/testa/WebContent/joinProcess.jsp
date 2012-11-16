<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*, java.io.*, java.util.*, java.lang.*"%>
<!DOCTYPE html>
<%
	String name = request.getParameter("name");
	String id   = request.getParameter("id");
	String pwd  = request.getParameter("pwd");
	String email = request.getParameter("email");
	String country = request.getParameter("country");
	String gender = request.getParameter("gender");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs   = null;
	StringBuffer sb =null;	

	String dbUrl = "jdbc:mysql://localhost:3306/park";
	String dbUser = "park";
	String dbPassword = "123456";
	String sql = "INSERT INTO user(name, id, password, email, country, gender) values(?, ?, ?, ?, ?, ?) ";
	String sql2 = "SELECT * FROM user";
	
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, name);
			pstmt.setString(2 ,id);
			pstmt.setString(3 ,pwd);
			pstmt.setString(4 ,email);
			pstmt.setInt(5 ,10);
			pstmt.setInt(6 ,1);
			int result = pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			rs.close();
			
			
	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		finally{
		if(conn != null)try{conn.close();}catch(SQLException e){}
		if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
		if(rs != null)try{rs.close();}catch(SQLException e){}
		}

	%>

<title>입력 확인 페이지</title>
<head></head>
<body>


</body>
</html>