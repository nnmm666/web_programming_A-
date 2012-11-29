<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
<%
	String errorMsg=null;
	int result;
	
	Connection conn = null;
	PreparedStatement stmt =null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2012";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	request.setCharacterEncoding("utf-8");
	
	int id =0;
	
	try{
		id=Integer.parseInt(request.getParameter("id"));
	}catch (Exception e){}
	
	try{
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("DELETE FROM users WHERE id=?");
		stmt.setInt(1,id);
		
		result = stmt.executeUpdate();
		if(result != 1){
			errorMsg = "삭제에 실패했습니다.";
		}
	}catch(SQLException e){
		errorMsg ="SQL에러 :" +e.getMessage();
	}finally {
		if(rs != null) try{rs.close();} catch(SQLException e){}
		if(stmt != null) try{stmt.close();} catch(SQLException e){}
		if(conn != null) try{conn.close();} catch(SQLException e){}
	}
%>
<html lang="kr">
<head>
	<meta charset="utf-8">
	<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
	<link href="stylesheets/loginPage.css" rel="stylesheet" type="text/css">
	<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
	<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
				<jsp:include page="share/header.jsp" />
		</div>

		<div class="container">
			<% if(errorMsg !=null){ %>
			<div class ="alert alert-error">
				<h3>Error:</h3>
				<%=errorMsg %>
			</div>
			<% }else{ %>
			<div class ="alert alert-success">
			사용자 정보를 삭제하였습니다.
			<% response.sendRedirect("logout.jsp");%>
			</div>
			<%} %>
		<div class="form-action">
			<a href="index.jsp" class="btn"> 목록으로 </a>
		</div>
		</div>
	</div>
</body>
</html>