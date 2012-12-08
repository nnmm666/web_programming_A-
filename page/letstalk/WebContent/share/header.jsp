<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*" buffer="8kb"%>

<%
	String errorMsg =null;
	Connection conn = null;
	PreparedStatement stmt=null;
	ResultSet rs= null;

	String dbUrl = "jdbc:mysql://localhost:3306/web2012";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	int id = 0;
	String email="";
	String password="";
	String name = "";
	
	try{
		email=request.getParameter("inputemail");
	}catch (Exception e){}
	
	if(email != null) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			
			conn =DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			
			stmt = conn.prepareStatement("SELECT * FROM users WHERE email=?");
			stmt.setString(1,email);
	
			rs=stmt.executeQuery();
			
			if(rs.next()){
				id = rs.getInt("id");
				email = rs.getString("email");
				password = rs.getString("password");
				name = rs.getString("name");
			}
		}catch (SQLException e){
			errorMsg = "SQL에러 : " + e.getMessage();
		}finally {
			if(rs!=null ) try{rs.close();}catch(SQLException e){}
			if(stmt !=null) try{stmt.close();} catch(SQLException e){}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
	}else{
		errorMsg = "email가 지정되지 않았습니다.";
	}
%>
<script src='./javascript/jquery-1.8.2.min.js'></script>
	<div id="header">
		<div id="logo">
			<a href="index.jsp">Let's Talk!!</a>
	</div>

<% if(request.getMethod() == "POST"){
		String inputemail= request.getParameter("inputemail");
		String inputpwd = request.getParameter("inputpwd");
		int userid = id;

		if(inputemail == null || inputpwd ==null || inputemail.length()==0|| inputpwd.length()==0 ){
		%>
		<script>
  		alert("이메일과 비밀번호를 입력하세요."); 
  		location.href="index.jsp";
		</script>
		<% 
		} else if(email.equals(inputemail) && password.equals(inputpwd)){
			//로그인 성공
			session.setAttribute("userEmail", email);
			session.setAttribute("userName", name);
			session.setAttribute("userId", id);%>
			<script type="text/javascript">
			location = 'index.jsp';
			</script>
	<%}else {%>
		<script>
  		alert("아이디나 비밀번호가 잘못되었습니다.");
  		location.href="../letstalk/index.jsp";
		</script>
	<%
	}
	}%>
	
	<% if(session.getAttribute("userEmail") == null){%>
	
	<div id="login">
			<form method="post">
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
		안녕하세요. <b><%=session.getAttribute("userName") %></b> 님 반갑습니다.
			<a href="signup.jsp?id=<%=session.getAttribute("userId") %>">개인정보수정</a>
			<input type="submit" id ="logout_button" value="로그아웃"> 
		</form>
	</div>
	<%} %>
		<div id="border"></div>
</div>