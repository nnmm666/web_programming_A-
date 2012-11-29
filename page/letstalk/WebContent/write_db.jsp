<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <jsp:useBean id="info" scope="request" class="project.LetsTalk">
<<<<<<< HEAD
    <jsp:setproperty name="info" property="*"/>
<%
	int keyword=info.getKeywordID();
	String content=info.getContent();
	String writer=(String)session.getAttribute("userName");
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2012";
	String dbUser = "root";
	String dbPassword = "32Armyband";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "insert into topic(keyword_id,content,writer,photo) value(?,?,?,?)";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt()
	int i = pstmt.executeUpdate();
	
%>
=======
    <%
 		
    	Connection conn = null;
    	PreparedStatement pstmt = null;

    	String dbUrl = "jdbc:mysql://localhost:3306/web2012";
    	String dbUser = "web";
    	String dbPassword = "asdf";
    	
    	try{
    	Class.forName("com.mysql.jdbc.Driver");
    	conn = DriverManager.getConnection(url,user,pw);
    	pstmt = conn.prepareStatement("insert into contents(keyword_id,content,writer,photo,) value(?,?,?,?)");
    	pstmt.setString(1,text);
    	pstmt.setString(2,email);
    	
    	int i = pstmt.executeUpdate();
    	out.println(i);
    	}catch(Exception e){ e.printStackTrace();}
    	finally{if(conn!=null)conn.close(); 
    			if(pstmt!=null)pstmt.close();}
    
    %>
>>>>>>> 23339e0d6a87a368a1f8b811944ea5a9fe5deea9
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
</head>
<body>
<div id="wrap">
		<div id="top">
		</div>
		<div id="content">
			<a href="index.jsp">리스트</a>
			<%=session.getAttribute("userEmail") %>
		</div>
		<div id="bottom">
		</div>
	</div>
</body>
</html>
</jsp:useBean>
