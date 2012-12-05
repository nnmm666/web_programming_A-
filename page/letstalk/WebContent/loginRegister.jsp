
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@page import = "java.sql.*" %>
<%
int size = 10 * 1024 * 1024;


Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

String dbUrl = "jdbc:mysql://localhost:3306/web2012";
String dbUser = "web";
String dbPassword = "asdf";

request.setCharacterEncoding("utf-8");
String uploadPath = request.getRealPath("upload/user");

String fileName     = "";
String origFileName = "";
String email =  "";
String name =  "";
String password = ""; 
String password_confirm = ""; 
String photo =  "";

MultipartRequest multi = new MultipartRequest(request,
            uploadPath,size,"euc-kr",new DefaultFileRenamePolicy());  
    
	email = multi.getParameter("email");
	name = multi.getParameter("name");
	password = multi.getParameter("password");
	password_confirm = multi.getParameter("password_confirm");
	photo = multi.getParameter("photo");
    
    Enumeration files = multi.getFileNames(); 

    
    String file = (String)files.nextElement();
    fileName = multi.getFilesystemName(file);
    origFileName = multi.getOriginalFileName(file);

	


	List<String> errorMsg = new ArrayList<String>();
	int result = 0;

	if (email == null || email.trim().length() == 0) {
		errorMsg.add("E-mail을 반드시 입력해주세요.");
	}
	if (name == null || name.trim().length() == 0) {
		errorMsg.add("이름을 반드시 입력해주세요.");
	}
	if (password == null || password.length() < 6) {
		errorMsg.add("비밀번호는 6자 이상 입력해주세요.");
	}
	if (password.equals(password_confirm) != true) {
		errorMsg.add("비밀번호가 일치하지 않습니다.");
	}

	if (errorMsg.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser,
					dbPassword);
			stmt = conn
					.prepareStatement("INSERT INTO users (email,name,password,photo)"
							+ "VALUES(?,?,?,?)");

			stmt.setString(1, email);
			stmt.setString(2, name);
			stmt.setString(3, password);
			stmt.setString(4, photo);

			result = stmt.executeUpdate();
			if (result != 1) {
				errorMsg.add("등록에 실패하였습니다.");
			}
		} catch (SQLException e) {
			errorMsg.add("SQL에러:" + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
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
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
			<div id="header">
				<div id="logo">
					<a href="index.jsp">Let's Talk!!</a>
				</div>
			</div>
		</div>
		<div id="middle">
			<div id="content">
				<div class="container">
					<%
						if (errorMsg.size() > 0) {
					%>
					<div class="alert">
						<b>Error:</b>
						<%
							for (String msg : errorMsg) {
						%>
						<%=msg%>
						<%
							}
						%>
					</div>
					<div class="form-action">
						<a onclick="history.back();" class="btn">뒤로 돌아가기</a>
					</div>
					<%
						} else if (result == 1) {
					%>
					<div class="alert">
						<b><%=name%></b>님 등록해주셔서 감사합니다.
					</div>
					<div class="form-action">
						<a href="index.jsp" class="btn">토론하러가기</a>
					</div>
					<%
						}
					%>
				</div>
			</div>
		</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>

</body>
</html>