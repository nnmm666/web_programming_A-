<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*" import="java.sql.*"%>
    
<%
		request.setCharacterEncoding("utf-8");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		Class.forName("com.mysql.jdbc.Driver");

		String dbUrl = "jdbc:mysql://localhost:3306/web2012";
		String dbUser = "root";
		String dbPassword = "32Armyband";
		
		String topic_id = request.getParameter("topic_id");
		String keyword = "";
		String content = "";
		String writer = "";
		String date = "";

		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement("SELECT topic.id, keyword, content, substr(topic.date, 1, 10) as date, writer " 
					 + "FROM keyword JOIN topic ON keyword.id = topic.keyword_id WHERE topic.id=?");
	    stmt.setString(1, topic_id);
    	rs = stmt.executeQuery();
    	rs.next();
    	
    	keyword = rs.getString("keyword");
    	content = rs.getString("content");
    	writer = rs.getString("writer");
    	date = rs.getString("date");
    	
    	
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
					<%=content %>
					</div>
					<div class="topicContentBottomInOpinion">
						<span>작성자 : <%=writer %></span><span>작성일 : <%=date %></span>
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
				<div id="MoreOpinion">
					<div>
						<div class="opinion">
							<div class="titleborder_like">
								인기가 있으면 논란이 되는건 당연한법~~
								<a href="#"><span class="toggle">▲▼</span></a>
							</div>
							<div class="section">
								<div class="section_top">
									<div class="section_left">
										인기가 있으면 논란이 되는건 당연한법~~<br>
										뭐 저런거갖다가 난리냐<br>
										재미만 있으면 됏지<br>
									</div>
									<div class="section_right">
										<span><img src="./images/like.png"> 0 </span>
										<span><img src="./images/hate.png"> 0 </span>
									</div>
								</div>
								<div id="section_sub">
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 공감합니당 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> 개미즐 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 넵 깨갱..</div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> ㅎㅎㅎ.. </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply_1"> <input type="text" class="reply_more" placeholder="댓글달기..."> </div>
								</div>
							</div>
						</div>
						<div class="opinion">
							<div class="titleborder_hate">
								재미없음
								<a href="#"><span class="toggle">▲▼</span></a>
							</div>
							<div class="section">
								<div class="section_top">
									<div class="section_left">
										재미없음<br>
										애들도 예전만 못하구..
									</div>
									<div class="section_right">
										<span><img src="./images/like.png"> 0 </span>
										<span><img src="./images/hate.png"> 0 </span>
									</div>
								</div>
								<div id="section_sub">
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 공감합니당 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> 개미즐 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 넵 깨갱..</div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> ㅎㅎㅎ.. </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply_1"> <input type="text" class="reply_more" placeholder="댓글달기..."> </div>
								</div>
							</div>
						</div>
						<div class="opinion">
							<div class="titleborder_hate">
								사기방송!! 종영해라!!
								<a href="#"><span class="toggle">▲▼</span></a>
							</div>
							<div class="section">
								<div class="section_top">
									<div class="section_left">
										사기방송!! 종영해라!!
										사기치치지말고 이제 그만하지??
										이승철 ㅗㅗ
									</div>
									<div class="section_right">
										<span><img src="./images/like.png"> 0 </span>
										<span><img src="./images/hate.png"> 0 </span>
									</div>
								</div>
								<div id="section_sub">
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 공감합니당 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> 개미즐 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 넵 깨갱..</div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> ㅎㅎㅎ.. </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply_1"> <input type="text" class="reply_more" placeholder="댓글달기..."> </div>
								</div>
							</div>
						</div>
						<div class="opinion">
							<div class="titleborder_like">
								완전 재밌는뎅??
								<a href="#"><span class="toggle">▲▼</span></a>
							</div>
							<div class="section">
								<div class="section_top">
									<div class="section_left">
										유승우는 왜 떨구냐! 정준영을 탈락시키자!
									</div>
									<div class="section_right">
										<span><img src="./images/like.png"> 0 </span>
										<span><img src="./images/hate.png"> 0 </span>
									</div>
								</div>
								<div id="section_sub">
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 공감합니당 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> 개미즐 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 넵 깨갱..</div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> ㅎㅎㅎ.. </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply_1"> <input type="text" class="reply_more" placeholder="댓글달기..."> </div>
								</div>
							</div>
						</div>
						<div id="ejqhrl">더보기</div>
					</div>
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
