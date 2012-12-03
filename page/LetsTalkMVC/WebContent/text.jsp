<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
import="java.io.*" import="java.sql.*" import="java.util.*" import="bean.Keyword;" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	테스트 jsp 입니다<br>
<%
	List<Keyword> list = (List<Keyword>)request.getAttribute("keywords");
	if(list == null)
		out.println("리스트가 null임");
%>
</body>
</html>