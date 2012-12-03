<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>

<!-- Site styles -->
<link rel="stylesheet" type="text/css" href="stylesheets/index.css" />
</head>
<body>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="content">
		<div id="write">

	<%
		int keyword_id = (Integer.parseInt(request.getParameter("keyword_id")));
		if(session.getAttribute("userName")!=null){  
		String dbUrl = "jdbc:mysql://localhost:3306/web2012";
		String dbUser = "web";
		String dbPassword = "asdf";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select keyword from keyword where id=?";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,keyword_id);
			rs=pstmt.executeQuery();
	%>
	
			<form action="write_db.jsp?keyword_id=<%=keyword_id %>" method="POST" class="form-horizontal">
				<fieldset>
					<div id="legend" class="">
						<legend class="">당신의 생각을 넓혀드립니다 :-) </legend>
					</div>

					<div id="section">
					<div class="control-group">
							<!-- Text input-->
							<% while(rs.next()){ %>
							<label class="control-label" for="keyword">무엇에 대해서?</label>
							<div class="controls" id="keyword"><%= rs.getString("keyword") %>
								</div>
						</div>
					<%	}
							}catch(Exception e){ e.printStackTrace();
							}finally{
    							if(conn!=null)conn.close(); 
    							if(pstmt!=null)pstmt.close();
    							if(rs!=null)rs.close();
    						} %>
						<div class="control-group">
							<!-- Text input-->
							<label class="control-label" for="user">나의 이름은</label>
							<div class="controls" id="user_name">
								<%=session.getAttribute("userName")%></div>
						</div>

						<div class="control-group">
							<!-- Textarea -->
							<label class="control-label" for="context">내용</label>
							<div class="controls">
								<div class="textarea">
									<textarea name="content"> </textarea>
								</div>
							</div>
						</div>
						<div class="control-group">
							<!-- File Upload -->
							<div class="controls">
								<label class="control-label">첨부하기</label> <input
									class="input-file" id="fileInput" type="file" name="photo">
							</div>
						</div>
					</div>

				</fieldset>
				<input type="submit" value="Lets Talk!"> <input type="reset"
					value="재작성">
			</form>	
			<%}else{%>
			<script>
				$(function(){
				alert("글쓰기는 로그인 후 작성 가능합니다 :-)");
				location='topic.jsp?';
				});
			</script>
		<%}%>
		</div>
	</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
</html>