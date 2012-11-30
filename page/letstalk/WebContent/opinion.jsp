<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*" import="java.sql.*"%>
    
<%
		request.setCharacterEncoding("utf-8");
		Connection conn = null;
		PreparedStatement stmt = null;
		PreparedStatement reply_stmt = null;
		ResultSet rs = null;
		ResultSet reply_rs = null;

		Class.forName("com.mysql.jdbc.Driver");

		String dbUrl = "jdbc:mysql://localhost:3306/web2012";
		String dbUser = "web";
		String dbPassword = "asdf";
		
		String topic_id = request.getParameter("topic_id");
		String keyword = "";
		String topic_content = "";
		String topic_writer = "";
		String topic_date = "";
		int topic_pros = 0;
		int topic_cons = 0;
		
		String opinion_id = "";
		String opinion_content = "";
		String opinion_writer = "";
		String opinion_position = "";
		int opinion_pros = 0;
		int opinion_cons = 0;
		String opinion_date = "";
		
		String reply_id = "";
		String reply_content = "";
		String reply_writer = "";
		String reply_date = "";
		
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement("SELECT *, substr(topic.date, 1, 10) as conv_date " 
					 + "FROM keyword JOIN topic ON keyword.id = topic.keyword_id WHERE topic.id=?");
	    stmt.setString(1, topic_id);
    	rs = stmt.executeQuery();
    	rs.next();
    	
    	keyword = rs.getString("keyword");
    	topic_content = rs.getString("content");
    	topic_writer = rs.getString("writer");
    	topic_date = rs.getString("conv_date");
    	topic_pros = rs.getInt("pros");
    	topic_cons = rs.getInt("cons");
    	
    	stmt.close();
    	rs.close();
	%>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8">
	<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
	<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
	<link href="stylesheets/opinion.css" rel="stylesheet" type="text/css">
	<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
					<jsp:include page="share/header.jsp" />
		</div>
	
		<div id="middle">
			<div id="content">
				<div id="search">
					<form class="form-search">
						<input type="text" id="searchbar" class="input-medium search-query" placeholder="다른 주제 검색">
						<button type="submit" class="searchButton">Search</button>
					</form>
				</div>
				<div id="topicdiv"><%=keyword %></div>
				<div id="topic">
					<div id="topicPhoto">
						<img src="./images/example.png" width='66px' height='100px'>
					</div>
					<div id="topicContentInOpinion">
					<%=topic_content %>
					</div>
					<div class="topicContentBottomInOpinion">
							<span><img src="./images/like.png"> <%=topic_pros %> </span><span><img src="./images/hate.png"> <%=topic_cons %> </span>
							<span>작성자 : <%=topic_writer %></span><span>작성일 : <%=topic_date %></span>
					</div>
				</div>
				<div id="myopinion">
					<input type="text" id="opiniontext" placeholder="클릭하여 당신의 의견을 남겨주세요">
				</div>
				<div id ="myopinion_sub">
					<span class="myopinion_likehate">
						<input type="radio" name="likehate" value="like">찬성 <img src="./images/like.png">
						<input type="radio" name="likehate" value="hate">반대 <img src="./images/hate.png"> 
					</span>
					<input type="button" id="opinionWrite" value="Write">
				</div>
				<div id="order">
					<ul>
						<li><hr style="width:616px; margin-top:9px;"></li>
				    <li>
					    <a href="#">정렬▼</a>
					    <ul>
					        <li style="border-top: 1px solid #ccc;"><a href="#">찬성순</a></li>
					        <li><a href="#">반대순</a></li>
					        <li><a href="#">찬성만</a></li>
					        <li><a href="#">반대만</a></li>
					        <li><a href="#">덧글순</a></li>
					        <li style="border-bottom: 1px solid #ccc;"><a href="#">최신순</a></li>
					    </ul>
				    </li>
				    <li><hr style="width:34px;"></li>
					</ul>
				</div>
				<div id="MoreOpinion">

					<%
					stmt = conn.prepareStatement("SELECT *, substr(date, 1, 10) as conv_date FROM opinion WHERE topic_id=?");
					stmt.setString(1, topic_id);
					rs = stmt.executeQuery();
					
					while(rs.next()) {
					
					opinion_id = rs.getString("id");
					opinion_content = rs.getString("content"); 
					opinion_writer = rs.getString("writer");
					opinion_position = rs.getString("position");	
					opinion_pros = rs.getInt("pros");
					opinion_cons = rs.getInt("cons");
					opinion_date = rs.getString("conv_date");
					
					opinion_position = opinion_position.equals("찬성") ? "like" : "hate";	
					%>
					
				
					<div class="opinion">
						<div class="titleborder_<%=opinion_position%> ">
							인기가 있으면 논란이 되는건 당연한법~~
							<a href="#" class="toggle">▲▼</a><span class="opinion_writer">작성자 : <%=opinion_writer %></span>
						</div>
						<div class="section">
							<div class="section_top">
								<div class="section_left">
									<%=opinion_content %>
								</div>
								<div class="section_right">
									<span><img src="./images/like.png"> <%=opinion_pros %> </span>
									<span><img src="./images/hate.png"> <%=opinion_cons %> </span>
								</div>
								<div class="section_bottom">
								작성일 : <%=opinion_date %>
								</div>
							</div>
							<div id="section_sub">
								
								<%
								try {
									reply_stmt = conn.prepareStatement("SELECT *, substr(date, 1, 10) as conv_date FROM reply WHERE opinion_id=?");
									reply_stmt.setString(1, opinion_id);
									reply_rs = reply_stmt.executeQuery();
									
									while(reply_rs.next()) {									
										reply_id = reply_rs.getString("id");
								 		reply_content = reply_rs.getString("content");
								 		reply_writer = reply_rs.getString("writer");
								 		reply_date = reply_rs.getString("conv_date");
								%>
								<div class="section_reply">
									<span class="reply_writer"><b><%=reply_writer %></b></span>
									<span class="reply_content"><%=reply_content %></span>
									<span class="reply_date"><%=reply_date %></span>
								</div>
								<%
									}

								} catch (SQLException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} finally {
								    if (reply_rs != null) try{reply_rs.close();} catch(SQLException e) {}
								    if (reply_stmt != null) try{reply_stmt.close();} catch(SQLException e) {}
								}
								%>
								
								<div class="section_reply_1"> <input type="text" class="reply_more" placeholder="댓글달기..."> </div>
							</div>
						</div>
					</div>
						
				<%} %>
						
						<div id="ejqhrl">더보기</div>
				</div>

			</div>
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

$(function(){
	$(window).scroll(function() {
		if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			$("#ejqhrl").show();
			}});

	$(".toggle").click(function(){
			$(this).parents('.opinion').find('.section').slideToggle();
		});
	$("#ejqhrl").hide();
});

	
</script>
		
</html>
