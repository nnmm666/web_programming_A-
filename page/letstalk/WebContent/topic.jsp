<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.io.*" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>Let's Talk!!렛톡에 오신걸 환영합니다!!</title>
<!-- Site styles -->
<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
<script src='http://code.jquery.com/jquery-latest.js'></script>

<%
	request.setCharacterEncoding("utf-8");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		int pageNo = 1;
		
		try {
			pageNo = Integer.parseInt(request.getParameter("page"));
		} catch(NumberFormatException ex) {}
		
		int numInPage = 3;
		int startPos = (pageNo - 1) * numInPage;
		int numItems, numPages;		
		
		Class.forName("com.mysql.jdbc.Driver");

		String dbUrl = "jdbc:mysql://localhost:3306/web2012";
		String dbUser = "web";
		String dbPassword = "asdf";
		
		String keyword_id = request.getParameter("keyword_id");
		String keyword = "";
		String topic_id = "";
		String content = "";
		String writer = "";
		String date = "";

		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			
			stmt = conn.prepareStatement("SELECT keyword.keyword, count(*) FROM keyword JOIN topic ON keyword.id = topic.keyword_id WHERE keyword_id=?");
			stmt.setString(1, keyword_id);
	    rs = stmt.executeQuery();
	    rs.next();
	    keyword = rs.getString("keyword.keyword");
	    numItems = rs.getInt("count(*)");
	    numPages = (int)Math.ceil((double)numItems / (double)numInPage);
	    rs.close();
	    stmt.close();
	    
	    
			stmt = conn.prepareStatement("SELECT topic.id, keyword.id, keyword, content, substr(topic.date, 1, 10) as date, writer " 
					 + "FROM keyword JOIN topic ON keyword.id = topic.keyword_id WHERE keyword_id=? "
					 + "LIMIT ?, ?");
    	stmt.setString(1, keyword_id);
    	stmt.setInt(2, startPos);
    	stmt.setInt(3, numInPage);
    
    	rs = stmt.executeQuery();
    	
	%>
</head>

<body>
	<div id="wrap">
		<div id="mask"></div>
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id="content">
			
			
				<div id="section_1">
					<div id="section_1_top">
						<span id="section_1_exit"><a href="index.jsp">×</a> </span>
						 Hot Hot Topics!! about <%=keyword %>
						<hr></hr>
					</div>

					<!-- Start of pagination-basic -->
					<div class="pagination-basic">
						<div class="sliderkit-panel">
						<% if(numItems == 0) {
							out.println("관련된 주제가 없습니다.");
						} %>

							<%
								while(rs.next()) {
									content = rs.getString("content");
									writer = rs.getString("writer");
									date = rs.getString("date");
									topic_id = rs.getString("topic.id");
							%>
							<a href="opinion.jsp?topic_id=<%= topic_id %>">
								<div class="sliderkit-block">
									<div id="topicPhoto">
										<img src="./images/example.png" width='66px' height='60px'>
									</div>
									<div id="topicContent">
										<%=content %>
									</div>
									<div class="topicContentBottom">
										<span>작성자 : <%=writer %></span><span>작성일 : <%=date %></span>
									</div>
								</div>
							</a>
							<%
								}				
							%>
						</div>
					
					
						<div class="sliderkit-nav">
							<div class="sliderkit-nav-clip">
								<ul>
									<%
									int startPageNo, endPageNo;
									int delta = 5;
									startPageNo = (pageNo <= delta) ? 1 : pageNo - delta;
									endPageNo = startPageNo + delta*2 + 1;
									
									if(endPageNo > numPages) {
										endPageNo = numPages;
									}
									
									if(pageNo <= 1) {
									%>
									<li class="disable"><a href="#">&laquo;</a></li>
									<% } else { %>
									<li><a href="topic.jsp?keyword_id=<%=keyword_id %>&page=<%=pageNo -1 %>">&laquo;</a></li>
									<%
									}
									
									String className = "";
									for(int i = startPageNo; i<=endPageNo; i++) {
										className = (i == pageNo) ? "active" : "";
										out.println("<li class='" + className + "'>");
										out.println("<a href='topic.jsp?keyword_id=" + keyword_id + "&page=" + i + "'>" + i + "</a>");
										out.println("</li>");
									}
									
									if(pageNo >= numPages) {
									%>
									<li class="disable"><a href="#">&raquo;</a></li>
									<% } else { %>
									<li><a href="topic.jsp?keyword_id=<%=keyword_id %>&page=<%=pageNo +1 %>">&raquo;</a></li>
									<%}	%>
								</ul>
								<a href="#" id=writeButton>
									주제 추가하기
								</a>
							</div>
						</div>
			
					</div>

					<!-- // end of tabs-imbricate -->
				</div>

			</div>
		</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
		<%
		stmt.close();
		rs.close();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
		    if (rs != null) try{rs.close();} catch(SQLException e) {}
		    if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		    if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		%>

<script type="text/javascript">
	$(document).ready(function() {
			//검은 막 눌렀을 때
			$('#mask').click(function () {            
	    	location = "index.jsp";
	    }); 
	});
</script>
</html>