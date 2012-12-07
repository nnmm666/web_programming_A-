<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
		int size = 10 * 1024 * 1024;

  	Connection conn = null;
  	PreparedStatement stmt =null;
  	ResultSet rs = null;

		String dbUrl = "jdbc:mysql://localhost:3306/web2012";
		String dbUser = "web";
		String dbPassword = "asdf";
  	
  	request.setCharacterEncoding("utf-8");
  	String uploadPath = getServletContext().getRealPath("./upload/user");
  	
  	MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());  
  	
  	int id = 0 ;
  	try{
  		id = Integer.parseInt(multi.getParameter("id"));
  	}catch(Exception e){}
  		String name = multi.getParameter("name");
  		String password = multi.getParameter("password");
  		String password_confirm = multi.getParameter("password_confirm");
  		String photo = multi.getParameter("photo");
  		
  		Enumeration files = multi.getFileNames();
  		String file = (String)files.nextElement();
  		photo = multi.getFilesystemName(file);

  		List<String> errorMsg = new ArrayList<String>();
  		int result = 0 ;
  		
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
  				Class.forName("com.mysql.jdbc.Driver");
  				
  				conn = DriverManager.getConnection(dbUrl,dbUser, dbPassword);
  				stmt = conn.prepareStatement(
  					"UPDATE users " +
  					"SET name =?, password =?, photo =? " +
  					"WHERE id =?"
  				);
  				stmt.setString(1, name);
  				stmt.setString(2, password);
  				stmt.setString(3, photo);
  				stmt.setInt(4, id);
  				
  				result = stmt.executeUpdate();
  				if(result !=1){
  					errorMsg.add("변경에 실패하였습니다.");
  				}
  			}catch(SQLException e){
  				errorMsg.add("SQL 에러:" + e.getMessage());
  			}finally{
  				if(rs!=null) try{rs.close();} catch(SQLException e){}
  				if(stmt!=null) try{stmt.close();} catch(SQLException e){}
  				if(conn!=null) try{conn.close();} catch(SQLException e){}
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
					<% if(errorMsg.size() > 0){ %>
					<div class="alert">
						<h3>Errors:</h3>
						<ul>
							<% for(String msg : errorMsg){ %>
							<li><%=msg %></li>
							<%} %>
						</ul>
					</div>

					<div class="form-action">
						<a onclick="history.back();" class="btn">뒤로 돌아가기</a>
					</div>
					<%} else if (result == 1){ %>
					<div class="alert">
						<b><%=name %></b>님 정보가 수정되었습니다.
					</div>
					<div class="form-action">
						<a href="index.jsp" class="btn">첫 화면으로</a>
					</div>
					<%}%>
				</div>
			</div>
		</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
</html>