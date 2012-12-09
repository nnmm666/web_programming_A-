<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<% 
 	String errorMsg = null;
 	String actionUrl;
 	
 	Connection conn = null;
 	PreparedStatement stmt = null;
 	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/web2012?useUnicode=true& useUnicode=true&characterEncoding=euc_kr";
	String dbUser = "web";
	String dbPassword = "asdf";

 	int id = 0;
 	String email = "";
 	String name = "";
 	String password = "";
 	String photo ="";

 	try {
		id = Integer.parseInt(request.getParameter("id"));
	}catch(Exception e){}
	
	if(id >0) {
		actionUrl = "update.jsp"; 
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
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id="content">
				<div id="content_border">
					<div id="logintitle">
						<span><b>지금 Let's-talk에 가입하세요</b>
						</span><br>
						<h4>당신의 생각을 향상시켜드립니다.</h4>
					</div>
					<div class="container">
						<form class="form-horizontal" action="<%=actionUrl%>" enctype ="multipart/form-data"
							method="POST" >
							<fieldset>
								<legend class="legend">Sign Up</legend>
								<%
										if(id>0){
											out.println("<input type='hidden' name='id' value='"+id+"'>");
										}
									%>
								<% if(id<= 0){ %>
								<div id="user_content">
									<div class="control-group">
										<label class="control-label" for="email">E-mail</label>
										<div class="controls">
											<input class="inputbox" type="email" placeholder="아이디 혹은 이메일"
												name="email" value="<%=email %>">
										</div>
									</div>
									<% } %>

									<div class="control-group">
										<label class="control-label" for="name">Name</label>
										<div class="controls">
											<input class="inputbox" type="text" placeholder="이름"
												name="name" value="<%=name %>">
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="password">Password</label>
										<div class="controls">
											<input class="inputbox" type="password" name="password">
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="password_confirm">Password
											Confirmation</label>
										<div class="controls">
											<input class="inputbox" type="password"
												name="password_confirm">
										</div>
									</div>

			
									<div class="control-group">
										<label class="control-label" for="picture">Profile
											Photo</label>
										<div class="controls">
											<% if(id> 0){ %>
										  <img src="./upload/user/<%=photo %>" width='80px' height='80px'>
										  <% } %>
											<input class="file" id="fileInput" name="file" type="file" >
										</div>
									</div>
								</div>
							</fieldset>

							<div class="form-actions">
								<a href="index.jsp" class="btn">취소하기</a>
								<% if(id<= 0) {%>
								<input type="submit" class="btn btn-primary" value="가입">
								<%}else{ %>
								<input type="submit" class="btn btn-primary" value="수정">
								<a href="#" class="btn btn-primary" data-action="delete"
									data-id="<%=id %> ">탈퇴 </a>
								<%} %>
							</div>
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
<script>
	$("a[data-action = 'delete']").click(function(){
		if(confirm("정말로 삭제 하시겠습니까?")){
			location = 'delete.jsp?id=' + $(this).attr('data-id');
			}
		return false;
	});
</script>
</html>
