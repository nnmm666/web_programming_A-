<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	buffer="8kb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src='./javascript/jquery-1.8.2.min.js'></script>
<div id="header">
	<div id="logo">
		<a href="pageServlet">Let's Talk!!</a>
	</div>

	<c:choose>
		<c:when test="${sessionScope.user.nickname == null }">
			<div id="login">
				<form action="multiServlet" enctype="multipart/form-data" method="POST">
					<ul>
						<li><span>E-mail</span> <input type="text" name="inputemail"></li>
						<li><span>Password</span> <input type="password" name="inputpwd"></li>
						<li><input type="submit" id="login_button" value="로그인"></li>
						<li><a href="signup.jsp"> 회원가입</a></li>
					</ul>
					<input type="hidden" name="op" value="login">
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<div id="loginsuccess">
				<form method="post" action="logout.jsp">
					안녕하세요. <b>${sessionScope.user.nickname }</b> 님 반갑습니다.
					<a href="signup.jsp?id=${sessionScope.user.user_id }">개인정보수정</a>
					<input type="submit" id="logout_button" value="로그아웃">
				</form>
			</div>
		</c:otherwise>
	</c:choose>
	<div id="border"></div>
</div>
<script type="text/javascript">
	$("#logout_button").click(function() {
		location = logout.jsp;
	});
</script>