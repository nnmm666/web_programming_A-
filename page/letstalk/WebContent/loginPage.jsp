<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
 <% 
 	String errorMsg = null;
 	String actionUrl;
 	
 	Connection conn = null;
 	PreparedStatement stmt = null;
 	ResultSet rs = null;

 	String dbUrl = "jdbc:mysql://localhost:3306/logindb";
 	String dbUser = "root";
 	String dbPassword = "tiger";

 	String email = "";
 	String name = "";
 	String password = "";
 	String photo ="";
 	
 	int id =0;

 	try {
		id = Integer.parseInt(request.getParameter("id"));
	}catch(Exception e){}
	
	if(id >0) {
		actionUrl = "update.jsp"; //회원가입 수정 페이지 만들기
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
			
			stmt =conn.prepareStatement("SELECT * FROM users WHERE id=?");
			stmt.setInt(1,id);
			
			rs = stmt.executeQuery();
			
			if(rs.next()){
				email = rs.getString("email");
				name = rs.getString("name");
				password = rs.getString("password");
				photo = rs.getString("photo");
			}
		}catch(SQLException e){
			errorMsg = "SQL에러" + e.getMessage();
		}finally {
			if(rs !=null) try{rs.close();} catch(SQLException e){}
			if(stmt !=null) try{stmt.close();} catch(SQLException e){}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
	}else {
	actionUrl = "loginRegister.jsp";
}
 %>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8">
	<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
	<link href="stylesheets/loginPage.css" rel="stylesheet" type="text/css">
	<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
	<script src='./javascript/jquery-1.8.2.min.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
					<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id="content">
				<div id = "content_border">
					<div id="logintitle">
						<span><b>지금 Let's-talk에 가입하세요</b></span><br>
						<h4>당신의 생각을 향상시켜드립니다.</h4>
					</div>
					<div class="container">
						<div>
							<form class="form-horizontal" action="<%=actionUrl%>" method="POST">
								<fieldset>
									<legend class="legend">Sign Up</legend>
									<%
										if(id>0){
											out.println("<input type='hidden' name='id' value='"+id+"'>");
										}
									%>
									<div id="user_content">
										<div class ="control-group">
											<label class="control-label" for="email">E-mail</label>
											<div class="controls">
												<input class ="inputbox" type="email" placeholder="아이디 혹은 이메일" name="email" value="<%=email %>">
											</div>
										</div>
										
										<div class ="control-group">
											<label class="control-label" for="name">Name</label>
											<div class="controls">
												<input class ="inputbox" type="text" placeholder="이름" name="name" value="<%=name %>">
											</div>
										</div>
		
								
		
										<% if(id<= 0){ %>
										<div class ="control-group">
											<label class="control-label" for="password">Password</label>
											<div class="controls">
												<input class ="inputbox" type="password" name="password" >
											</div>
										</div>
										
										<div class ="control-group">
											<label class="control-label" for="password_confirm">Password Confirmation</label>
											<div class="controls">
												<input class ="inputbox" type="password" name="password_confirm" >
											</div>
										</div>
										<% } %>
		
										<div class="control-group">
								     		<label class="control-label" for="picture">Profile Photo</label>
								          <div class="controls">
								             <input class="input-file" id="fileInput" type="file">
								          </div>
								      	</div>
									</div>
										<div class="form-actions">
											<a href="index.jsp" class="btn">취소하기</a>
											<% if(id<= 0) {%>
												<input type="submit" class="btn btn-primary" value="가입">
												<%}else{ %>
												<input type="submit" class="btn btn-primary" value="수정">
												<%} %>
										</div>
									
								</fieldset>
							</form>
					</div>
				</div>
			</div>
		</div>

		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
	</div>
</body>
</html>