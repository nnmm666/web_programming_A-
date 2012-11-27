<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*" import="java.util.*"
%>
<%
	Connection conn =null;
	PreparedStatement stmt= null;
	ResultSet rs =null;
	
	String dbUrl="jdbc:mysql://localhost:3306/logindb";
	String dbUser ="root";
	String dbPassword ="tiger";
	
	request.setCharacterEncoding("utf-8");
	
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String password_confirm = request.getParameter("password_confirm");
	String photo = request.getParameter("photo");
	
	List<String> errorMsg = new ArrayList<String>();
	int result = 0 ;
	
	if(email == null || email.trim().length() ==0){
		errorMsg.add("E-mail을 반드시 입력해주세요.");
	}
	if(name == null || name.trim().length() ==0){
		errorMsg.add("이름을 반드시 입력해주세요.");
	}
	if(password == null ||password.length()<6){
		errorMsg.add("비밀번호는 6자 이상 입력해주세요.");
	}
	if (!password.equals(password_confirm)) {
		errorMsg.add("비밀번호가 일치하지 않습니다.");
	}
	
	if(errorMsg.size() ==0){
		try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement("INSERT INTO users (email,name,password,photo)" +
					"VALUES(?,?,?,?)");
			
			stmt.setString(1, email);
			stmt.setString(2, name);
			stmt.setString(3, password);
			stmt.setString(4, photo);
			
			result = stmt.executeUpdate();
			if(result != 1){
				errorMsg.add("등록에 실패하였습니다.");
			}
		}catch(SQLException e){
			errorMsg.add("SQL에러:"+ e.getMessage());
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException e){}
			if(stmt !=null) try{stmt.close();} catch(SQLException e){}
			if(conn != null) try{conn.close();} catch(SQLException e){}
		}
	}
	
	
%>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8">
	<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
	<link href="stylesheets/loginPage.css" rel="stylesheet" type="text/css">
	<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
	<script src='./javascript/jquery-1.8.2.min.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
					<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id="content">
		<div class="container">
			<% if(errorMsg.size() > 0){ %>
				<div class = "alert alert-error">
					<h3>Error:</h3>
					<ul>
						<% for(String msg : errorMsg) { %>
							<li><%=msg %></li>
							<%} %>
					</ul>
				</div>
				<div class="form-action">
					<a onclick ="history.back();" class="btn">뒤로 돌아가기</a>
				</div>
			<%}else if(result ==1) { %>
			<div class="alert alert-success">
				<b><%=name %></b>님 등록해주셔서 감사합니다.
			</div>
			<div class="form-action">
				<a href="index.jsp" class="btn">목록으로</a>
			</div>
			<%} %>
	</div>
	<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
		</div>
		</div>
		</div>

</body>
</html>