<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*" import="java.sql.*" import="java.util.*"%>
<%		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String dbUrl = "jdbc:mysql://localhost:3306/web2012?useUnicode=true& useUnicode=true&characterEncoding=euc_kr";
		String dbUser = "web";
		String dbPassword = "asdf";
		
		request.setCharacterEncoding("utf-8");
		
		List<String> errorMsg = new ArrayList<String>();
		int result = 0;
		
		String id = request.getParameter("id");
		String topic_id = request.getParameter("topic_id");
		String likehate = request.getParameter("likehate");
		
		
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			if(likehate.equals("like")){
				stmt = conn.prepareStatement("UPDATE opinion SET pros = pros+1 WHERE id =? ");
				stmt.setString(1, id);
	
				result = stmt.executeUpdate();
				if (result != 1) {
					errorMsg.add("다시 선택해주세요");
				}
			}else if(likehate.equals("likes")){
				stmt = conn.prepareStatement("UPDATE topic SET pros = pros+1 WHERE id =? ");
				stmt.setString(1, topic_id);
	
				result = stmt.executeUpdate();
				if (result != 1) {
					errorMsg.add("다시 선택해주세요");
				}
			}else if(likehate.equals("hate")){
				stmt = conn.prepareStatement("UPDATE opinion SET cons = cons+1 WHERE id =? ");
				stmt.setString(1, id);
	
				result = stmt.executeUpdate();
				if (result != 1) {
					errorMsg.add("다시 선택해주세요");
				}
			}else if(likehate.equals("hates")){
				stmt = conn.prepareStatement("UPDATE topic SET cons = cons+1 WHERE id =? ");
				stmt.setString(1, topic_id);
	
				result = stmt.executeUpdate();
				if (result != 1) {
					errorMsg.add("다시 선택해주세요");
				}
			}
		} catch (SQLException e) {
			errorMsg.add("SQL에러:" + e.getMessage());
		} finally {
			if (rs != null)try {rs.close();} catch (SQLException e) {}
			if (stmt != null)try {stmt.close();} catch (SQLException e) {}
			if (conn != null)try {conn.close();} catch (SQLException e) {}
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
				<div id="content" style="height:520px;">
					<div class="container">
						<%if (errorMsg.size() > 0) {%>
						<div class="alert">
							<b>Error:</b><br><br><br>
							<%	for (String msg : errorMsg) {%>
							<%=msg%>
							<br><br><br>
							<%}%>
						</div>
						<%} else if (result == 1) {%>
							<script type="text/javascript">
								$(function(){
										alert('감사합니다.');
										location = 'opinion.jsp?topic_id=<%=topic_id %>';
								});</script>
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