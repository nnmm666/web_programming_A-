<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*" import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<form class="form-search" action="topicServlet">
						<input type="text" id="searchbar" placeholder="다른 키워드 검색">
						<button type="submit" class="searchButton">Search</button>
						<div id="suggest_box" class="suggest_box"></div> 		
					</form>
				</div>
				<div id="topicdiv">${keyword.keyword }</div>

				<div id="topic">
					<div id="topicPhoto">
						<img src="${topic.photo }" width='66px' height='100px'>
					</div>
					<div id="topicContentInOpinion">
					${topic.content }
					</div>
					<div class="topicContentBottomInOpinion">
							<span><a href="likehate.jsp?likehate=likes&topic_id=${topic.topic_id }">
							<img src="./images/like.png"> </a>${topic.pros } </span>
							<span><a href="likehate.jsp?likehate=hates&topic_id=${topic.topic_id }">
							<img src="./images/hate.png"> </a>${topic.cons } </span>
							<span>작성자 : ${topic.writer }</span>
							<span>작성일 : ${topic.date }</span>
					</div>
				</div>
				
				<% if(session.getAttribute("userEmail") != null) { //로그인시에만 나오게함 %>
				<form method="GET" action="opinionRegister.jsp">
					<input type="hidden" name="topic_id" value="${topic.topic_id }">
					<div id="myopinion">
						<input type="text" id="opiniontext" name="opiniontext"
						 placeholder="클릭하여 당신의 의견을 남겨주세요">
					</div>
					<div id ="myopinion_sub">
						<span class="myopinion_likehate">
							<input type="radio" name="likehate" value="like">찬성 <img src="./images/like.png">
							<input type="radio" name="likehate" value="hate">반대 <img src="./images/hate.png"> 
						</span>
							<input type="submit" class="opinionWrite" value="Write">
					</div>
				</form>
				<%}%>
				<div id="order">
					<ul>
						<li><hr style="width:616px; margin-top:9px;"></li>
				    <li>
					    <a href="#">정렬▼</a>
					    <ul>
					        <li style="border-top: 1px solid #ccc;"><a href="pageServlet?op=opinion&topic_id=${topic.topic_id}&align=like">찬성순</a></li>
					        <li><a href="pageServlet?op=opinion&topic_id=${topic.topic_id}&align=hate">반대순</a></li>
					        <li><a href="pageServlet?op=opinion&topic_id=${topic.topic_id}&align=likeOnly">찬성만</a></li>
					        <li><a href="pageServlet?op=opinion&topic_id=${topic.topic_id}&align=hateOnly">반대만</a></li>
					        <li><a href="pageServlet?op=opinion&topic_id=${topic.topic_id}&align=reply">덧글순</a></li>
					        <li style="border-bottom: 1px solid #ccc;"><a href="pageServlet?op=opinion&topic_id=${topic.topic_id}&align=default">최신순</a></li>
					    </ul>
				    </li>
				    <li><hr style="width:34px;"></li>
					</ul>
				</div>
				<div id="MoreOpinion">

					<c:forEach var="opinion" items="${opinions }">
						<div class="opinion">
							<div class="titleborder_${opinion.position }">
								${opinion.position }
								<span class="opinion_writer">작성자 : ${opinion.writer }</span>
							</div>
							<div class="section">
								<div class="section_top">
									<div class="section_left">
										${opinion.content }
									</div>
									<div class="section_right">
										<span><a href="likehate.jsp?likehate=like&id=${opinion.opinion_id }&topic_id=${topic.topic_id}">
										<img src="./images/like.png"></a> ${opinion.pros } </span>
										<span><a href="likehate.jsp?likehate=hate&id=${opinion.opinion_id }&topic_id=${topic.topic_id}">
										<img src="./images/hate.png"></a> ${opinion.cons } </span>
									</div>
									<div class="section_bottom">
									<a href="#" class="toggle"> Reply ↕ </a>
									<span> 작성일 : ${opinion.date }</span>
									</div>
								</div>
								
								<div id="section_sub">
								
									<c:forEach var="reply" items="${opinion.replies }">
										<div class="section_reply">
											<span class="reply_writer"><b>${reply.writer }</b></span>
											<span class="reply_content">${reply.content }</span>
											<span class="reply_date">${reply.date }></span>
										</div>
									</c:forEach>
									
										<% if(session.getAttribute("userEmail") != null) { //로그인시에만 나오게함 %>
										<div class="section_reply_1">
											<div class="replyInputName"><%=session.getAttribute("userName") %></div>
												<form method="GET" action="replyRegister.jsp">
													<input type="hidden" name="topic_id" value="${topic.topic_id }">
													<input type="hidden" name="opinion_id" value="${opinion.opinion_id }">
													<input type="text" class="reply_more" name= "reply_more" placeholder="댓글달기...">
													<input type="submit" class="replyInputButton" value="Write">
												</form>
										</div>
										<%} %>
								</div>
							</div>
						</div>
					</c:forEach>
					<div id="ejqhrl">더보기</div>
				</div>

			</div>
		</div>
	
	</div>
	
</body>
		
<script type="text/javascript">
function fill(name) {
	// 아이템이 선택되었을때 처리 
	$('#searchbar').val(name);
	$('#suggest_box').fadeOut();
}

$(function(){
	$('#searchbar').keyup(function() {
		// 입력창에 키가 눌러진 경우 이벤트 처리
		// Ajax로 값을 전송
		$.post('KeywordSuggestServlet', {query: $('#searchbar').val()}, 
			function(data) {
				$('#suggest_box').html(data).show();
			});		
	});
	
	$(window).scroll(function() {
		if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			$("#ejqhrl").show();
			}
		});

	$(".toggle").click(function(){
			$(this).parents('.opinion').find('#section_sub').slideToggle();
		});
	
	$("#ejqhrl").hide();
});
</script>
</html>
