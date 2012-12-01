<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>

<!-- bootstrap -->
<link rel="stylesheet" media="screen"
	href="stylesheets/bootstrap.min.css" />
<!-- Site styles -->
<link rel="stylesheet" type="text/css" href="stylesheets/index.css" />
<link rel="stylesheet" type="text/css" href="stylesheets/write.css" />
</head>
<body>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="content">

	<%if(session.getAttribute("userName")!=null){ 
		int keyword_id = (Integer.parseInt(request.getParameter("keyword_id"))); 
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
						<legend class="">글 작성하기</legend>
					</div>

					<div id="section">
					<div class="control-group">
							<!-- Text input-->
							<% while(rs.next()){ %>
							<label class="control-label" for="keyword">키워드</label>
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
							<label class="control-label" for="user">작성자</label>
							<div class="controls" id="user_name">
								<%=session.getAttribute("userName")%></div>
						</div>

						<div class="control-group">
							<!-- Textarea -->
							<label class="control-label" for="context">내용</label>
							<div class="controls">
								<div class="textarea">
									<textarea rows="10" cols="100" name="content"> </textarea>
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
				<input type="submit" value="올리기"> <input type="reset"
					value="다시">
			</form>	
			<%}else{%>
			<script>
				alert("로그인해주세요");
				location.href="index.jsp";
			</script>
		<%}%>
		</div>
	
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
</html>