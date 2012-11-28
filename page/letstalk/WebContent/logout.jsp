<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% session.invalidate(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
</head>
<body>

로그아웃 되었습니다.
</body>
</html>
<script language="javascript">
	alert("Success Logout");
	document.location.href = "index.jsp" ;
</script>
