
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@page import = "java.sql.*" %>

<%
int size = 10 * 1024 * 1024;
String sql = "insert into topic(keyword_id,content,writer,photo) values(?,?,?,?)";

String fileName = "";
String origFileName = "";
int keyword_id=0;
String photo =  "";
String content = "";
String writer = "" ;
ServletContext context = getServletContext();
String uploadPath = context.getRealPath("upload/topic");
MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());  


	keyword_id = Integer.parseInt(multi.getParameter("keyword_id"));
	photo=multi.getParameter("photo");
	content = multi.getParameter("content");
	writer=(String)session.getAttribute("userName");

	Enumeration files = multi.getFileNames();
	String file = (String)files.nextElement();
	fileName = multi.getFilesystemName(file);

	String dbUrl = "jdbc:mysql://localhost:3306/web2012";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

    
	try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,keyword_id);
	pstmt.setString(2,content);
	pstmt.setString(3,writer);
	pstmt.setString(4,fileName);
	int i = pstmt.executeUpdate();
    }catch(Exception e){ e.printStackTrace();}
    finally{if(conn!=null)conn.close(); 
    		if(pstmt!=null)pstmt.close();}
  %>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
<script type="text/javascript">
	$(function(){
			alert('글 작성이 완료 되었습니다.');
			location = 'index.jsp';
	});</script>
</body>
</html>

