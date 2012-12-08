<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	buffer="8kb"%>

<script src='./javascript/jquery-1.8.2.min.js'></script>
<div id="header">
	<div id="logo">
		<a href="pageServlet">Let's Talk!!</a>
	</div>

	<% if(session.getAttribute("nickname") == null){%>
	<div id="login">
		<form method="post" action="pageServlet">
			<ul>
				<li><span>E-mail</span> <input type="text" name="inputemail"></li>
				<li><span>Password</span> <input type="password" name="inputpwd"></li>
				<li><input type="submit" id="login_button" value="로그인"></li>
				<li><a href="signup.jsp"> 회원가입</a></li>
			</ul>
		</form>
	</div>
	<%} else{ %>
	<div id="loginsuccess">
		<form method="post" action="logout.jsp">
			안녕하세요. <b><%=session.getAttribute("nickname") %></b> 님 반갑습니다.
			<a href="signup.jsp?id=<%=session.getAttribute("nickname") %>">개인정보수정</a>
			<input type="submit" id="logout_button" value="로그아웃">
		</form>
	</div>
	<%} %>
	<div id="border"></div>
</div>
<script type="text/javascript">
	$("#logout_button").click(function() {
		location = logout.jsp;
	});
</script>