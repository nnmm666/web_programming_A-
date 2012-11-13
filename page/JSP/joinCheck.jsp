<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="join" class="user"/>
    <jsp:setProperty property="join" name="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 입력 정보 확인 페이지</title>
</head>
<body>
<center>
		<ul>

			<li>name</li>
			<li><jsp:getProperty property="join" name="name"/></li>
		
			<li>ID</li>
			<li><jsp:getProperty property="join" name="id"/></li>
			
			<li>E-mail</li>
			<li><jsp:getProperty property="join" name="email"/></li>
		
			<li>country</li>
			<li><jsp:getProperty property="join" name="country"/></li>
		
			
		
		</ul>
	
</center>

</body>
</html>