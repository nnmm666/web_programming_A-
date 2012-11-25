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
	String favorites = request.getParameter("favorites");
	String memo  = request.getParameter("memo");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs   = null;
	StringBuffer sb =null;	

	String dbUrl = "jdbc:mysql://localhost:3306/web_programming";
	String dbUser = "web";
	String dbPassword = "123";
	String sql = "INSERT INTO users (name, id, password, email, country, gender,favorites,meno) values(?, ?, ?, ?, ?, ?,?,?) ";
	String sql2 = "SELECT * FROM user";
	
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, name);
			pstmt.setString(2 ,id);
			pstmt.setString(3 ,pwd);
			pstmt.setString(4 ,email);
			pstmt.setString(5 ,country);
			pstmt.setString(6 ,gender);
			pstmt.setString(7,"123");
			pstmt.setString(8,memo);
			int result = pstmt.executeUpdate();
		
		
			
			
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
<head>
<link href="./stylesheets/css/index.css" rel="stylesheet" type="text/css">
</head>
<body>


</body>
</html>