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
		
		String topic_id = request.getParameter("topic_id");
		String writer=(String)session.getAttribute("userName");
		String content = request.getParameter("opiniontext");
		String opinion_position = request.getParameter("likehate");
		
		List<String> errorMsg = new ArrayList<String>();
		int result = 0;

		if (content == null || content.trim().length() == 0) {
			errorMsg.add("내용을 반드시 입력해주세요.");
		}
		if(opinion_position == null || !( opinion_position.equals("like") || opinion_position.equals("hate") )){
			errorMsg.add("찬성인지 반대인지 선택해주세요.");
		}

		if (errorMsg.size() == 0) {
			try {
				conn = DriverManager.getConnection(dbUrl, dbUser,
						dbPassword);
				stmt = conn
						.prepareStatement("INSERT INTO opinion (topic_id,writer,content,position)"
								+ " VALUES(?,?,?,?)");

				stmt.setString(1, topic_id);
				stmt.setString(2, writer);
				stmt.setString(3, content);
				stmt.setString(4, opinion_position);

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
						<%
							} else if (result == 1) {
						%>
							<script type="text/javascript">
								$(function(){
										alert('의견이 등록 되었습니다.');
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
