<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"
    import= "org.apache.commons.lang3.StringUtils"%>
 <%
	String[] countries = {"한국","미국","영국","일본","중국"};
 	String[] idols      = { "아이유","카라","소녀시대","2NE1","씨스타"};
 	String[][] genders = {{"M","남성"},{"F","여성"}};
 	
 	String errorMsg = null;
 	
 	String actionUrl;
 	// DB 접속을 위한 준비
 	Connection conn = null;
 	PreparedStatement stmt = null;
 	ResultSet rs = null;
 	
 	String dbUrl = "jdbc:mysql://localhost:3306/web2012";
 	String dbUser = "web";
 	String dbPassword ="asdf";
 	
 	//사용자 정보를 위한 변수 초기화
	String userid = "";
	String name = "";
	String pwd = "";
	String email = "";
	String country = "";
	String gender = "";
	String favorites = "";
	List<String> favoriteList = null;
	int id = 0;
	try {
		id = integer.parseInt(request.getParameter("id"));
	} catch (Exception e){}
	
	if(id>0){
		actionUrl = "update.jsp";
	}
	try {
			Class.forName("com.mysql.jdbc.Driver");
			// db 접속
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
			//질의 준비
			stmt = conn.PreparedStatement("SELECT * FROM users WHERE id =?");
			stmt.setInt(i,id);
			//수행 
			rs = stmt.executeQuery();
			
			if(rs.next()){
				userid = rs.getString("userid");
				name   = rs.getString("name");
				pwd    = rs.getString("pwd");
				email  = rs.getString("country");
				country= rs.getString("gender");
				favorites = rs.getString("favorites");
				if(favorites != null && favorites.length()>0){
					favoriteList = Arrays.asList(StringUtils.split(favorites));
						}
					}
				}catch (SQLException e){
					errorMsg = "SQL 에러: " + e.getMessage();
				}finally {
				 //무슨일이 있어도 리소스를 제대로 종료
					if(rs != null)try{rs.close();}catch(SQLException e){}
					if(stmt != null)try{stmt.close();}catch(SQLException e){}
					if(conn != null)try{conn.close();}catch(SQLException e){}
				}
			}else {
				actionUrl = "register.jsp";
			}
 	 
%>
<!DOCTYPE html>
<html>
<head>
<title>회원 목록</title>
<link href = "css/boostrap.min.css" rel = "stylesheet">
<link href = "css.base.css" rel = "stylesheet">
<script src = "js/jquery-1.8.2.min.js"></script>
<script src = "js/boostrap.min/js"></script>
</head>
<body>
<jsp:include page = "header.jsp">
<jsp:param name = "current" value ="Sign Up"/>
</jsp:include>
<div class ="container">
	<%
		if(errorMsg != null && errorMsg.length() > 0){
			out.print("<div class = 'alert'>" + errorMsg + "</div>");
			}
			%>
</div>
<div> 
		<form class = "form-horizontal" action = "<%=actionUrl %>" method ="post">
		<fieldset>
			<legend class ="legend">Sign Up</legend>
			<%
				if (id>0){
					out.println("<input type = 'hidden' name ='id' value='" +id +"'>");
				}
			%>
			<div class = "control-group">
				<label class = "control-label" for ="userid">ID</label>
					<div class = "controls">
						<input type ="text" name ="userid" value="<%=userid %>">
					</div>
				</div>
				<div class = "control-group">
					<label class = control-label" for = "name"> Name</label>
					<div class = "controls">
						<input type = "text" placeholder="홍길동" name = "name" value="<%=name %>">
					</div>
				</div>
				<%if(id<=0){ %>
					<%--신규 가입일때만 비밀번호 입력 창을 나타냄 --%>
						<div class ="control-group">
							<label class ="control-label" for="pwd">Password</label>
							<div class ="controls">
								<input type ="password" name ="pwd">
							</div>
						</div>
					<div class ="control-group">
							<label class ="control-label" for="pwd_confirm">Password Confirmation</label>
							<div class ="controls">
								<input type ="password" name ="pwd_confirm">
							</div>
						</div>
						<% } %>
						<div class ="control-group">
							<label class ="control-label" for="email">E-mail</label>
							<div class ="controls">
								<input type ="password" name ="email" value="<%=email%>">
							</div>
						</div>
						
						<div class ="control-group">
						   <label class ="control-label" >Country</label>
							<div class ="controls">
								<select name ="country">
								<%
									for(String countryName:countries){
										out.print("<option");
										if(countryName.equals(country)){
											out.print("checked");
										}
										out.println(">"+countryName+"</option>");
										}
								%>
								</select>
							</div>
						</div>
						
						<div class ="control-group">
							<label class ="control-label">Gender</label>
							<div class ="controls">
							<%
								for(String[] genderOption : genders){ %>
									<label class="radio">
										<input type ="radio" value="<%=genderOption[0] %> name ="gender"
										<% if (genderOption[0].equals(gender)) {out.print("checked");}%>
										>
										<%=genderOption[1] %>
									</label>
								<% }%>
							</div>
						</div>
						<div class ="control-group">
							<label class ="control-label">Favorites</label>
							<div class ="controls">
							<%
								for(String idolName : idols){ %>
									<label class="checkbox">
										<input type ="checkbox" name ="favorites value="<%=idolName %> name ="gender"
										<% if (favoritList != null && favoriteList.contains(idolName)) 
										{out.print("checked");}
										%>
										>
										<%=idolName %>
									</label>
								<% }%>
							</div>
						</div>
						
						<div class ="form-actions">
						   <a href = "index.jsp"class ="btn">목록으로</a>
							<% if (id<=0){ %>	
							<input type ="submit" class="btn btn-primary" value="가입">
							<%}else  { %>
							<input type ="submit" class="btn btn-primary" value ="수정">
							<%} %>						
							
						</div>
						
		</fieldset>
		</form>
</div>
</body>
</html>