<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
    <jsp:useBean id="info" scope="request" class="project.Write">
    <jsp:setProperty name="info" property="*"/>
<%
	int keyword_id=info.getKeyword_id();
	String content = new String(info.getContent().getBytes("8859_1"),"UTF-8");
	String writer=(String)session.getAttribute("userName");
	String photo=info.getPhoto();

	request.setCharacterEncoding("utf-8");
	String dbUrl = "jdbc:mysql://localhost:3306/web2012";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "insert into topic(keyword_id,content,writer,photo) values(?,?,?,?)";
	try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,keyword_id);
	pstmt.setString(2,content);
	pstmt.setString(3,writer);
	pstmt.setString(4,photo);
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
</jsp:useBean>
