<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%
    	String content = request.getParameter("text");
 		String email = "zzzzz"; //session.getAttribute("userEmail");
 		
    	Connection conn = null;
    	PreparedStatement pstmt = null;

    	String dbUrl = "jdbc:mysql://localhost:3306/web2012";
    	String dbUser = "root";
    	String dbPassword = "32Armyband";
    	
    	try{
    	Class.forName("com.mysql.jdbc.Driver");
    	conn = DriverManager.getConnection(url,user,pw);
    	pstmt = conn.prepareStatement("insert into contents(content, email) value(?,?)");
    	pstmt.setString(1,text);
    	pstmt.setString(2,email);
    	
    	int i = pstmt.executeUpdate();
    	out.println(i);
    	}catch(Exception e){ e.printStackTrace();}
    	finally{if(conn!=null)conn.close(); 
    			if(pstmt!=null)pstmt.close();}
    
    %>
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