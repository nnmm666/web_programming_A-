<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
						<input type="hidden" id="op" name="op" value="find" >
						<input type="text" id="searchbar" name="searchbar" placeholder="다른 키워드 검색">
						<button type="submit" class="searchButton">Search</button>
						<div id="suggest_box" class="suggest_box"></div> 		
					</form>
				</div>
				<div id="topicdiv">${keyword.keyword }</div>

				<div id="topic">
					<div id="topicPhoto">
						<img src="./upload/topic/${topic.photo }" width='120px' height='100px'>
					</div>
					<div id="topicContentInOpinion">
					${topic.content }
					</div>
					<div class="topicContentBottomInOpinion">

						<c:if test="${sessionScope.user.nickname == topic.writer }">
							<span>
								<a class="modified" href="#">수정</a>
								<a class="deleted_tp" href="#" data-id="${topic.topic_id }">삭제</a>
							</span>
						</c:if>
							<span><a class="likes" href="PositionServlet?likehate=likes&topic_id=${topic.topic_id}&opinion_id=${opinion.opinion_id}">
							<img src="./images/like.png"> </a>${topic.pros } </span>
							<span><a class="hates" href="PositionServlet?likehate=hates&topic_id=${topic.topic_id}&opinion_id=${opinion.opinion_id}">
							<img src="./images/hate.png"> </a>${topic.cons } </span>
							<span>작성자 : ${topic.writer }</span>
							<span>작성일 : ${topic.date }</span>

					</div>
				</div>
				
				<c:if test="${sessionScope.user.nickname != null }">
					<div class="opinion_form">
						<input type="hidden" id="topic_id" name="topic_id" value="${topic.topic_id }">
						<div id="myopinion">
							<input type="text" id="opiniontext" name="opiniontext" placeholder="클릭하여 당신의 의견을 남겨주세요">
						</div>
						<div id ="myopinion_sub">
							<span class="myopinion_likehate">
								<input type="radio" name="likehate" value="like">찬성 <img src="./images/like.png">
								<input type="radio" name="likehate" value="hate">반대 <img src="./images/hate.png"> 
							</span>
								<input type="button" id="opinionWrite" class="opinionWrite" value="Write">
						</div>
					</div>
				</c:if>
				
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
								<div class="section_top_${opinion.position }">
									<div class="section_left">
										${opinion.content }
									</div>
									<div class="section_right">
										<span><a class="like" href="PositionServlet?likehate=like&opinion_id=${opinion.opinion_id}&topic_id=${topic.topic_id}">
										<img src="./images/like.png"></a> ${opinion.pros } </span>
										<span><a class="hate" href="PositionServlet?likehate=hate&opinion_id=${opinion.opinion_id}&topic_id=${topic.topic_id}">
										<img src="./images/hate.png"></a> ${opinion.cons } </span>
									</div>
									<div class="section_bottom">
									<c:if test="${sessionScope.user.nickname == opinion.writer }">
										<span>
											<a class="modified" href="#">수정</a>
											<a class="deleted_op" href="#" data-id="${opinion.opinion_id }">삭제</a>
										</span>
									</c:if>
									<a href="#" class="toggle"> 댓글보기  </a>
									<span class="opinion-date"> 작성일 : ${opinion.date }</span>
									</div>
								</div>
								
								<div id="section_sub">
								
									<c:forEach var="reply" items="${opinion.replies }">
										<div class="section_reply">
											<span class="reply_writer"><b>${reply.writer }</b></span>
											<span class="reply_content">${reply.content }</span>
											<span class="reply_date">${reply.date }</span>
											<c:if test="${sessionScope.user.nickname == reply.writer }">
												<span><a class="deleted_rp" href="#" style="float:right;" data-id="${reply.reply_id }" >삭제</a>
												<a class="modified" href="#" style="float:right; ">수정</a></span>
											</c:if>
										</div>
									</c:forEach>
									
										<c:if test="${sessionScope.user.nickname != null }">
											<div class="section_reply_1">
											<div class="replyInputName">${sessionScope.user.nickname }</div>
												<div id="reply_form">
													<input type="hidden" name="topic_id" value="${topic.topic_id }">
													<input type="hidden" class ="opinion_id" name="opinion_id" value="${opinion.opinion_id }">
													<input type="text" class="reply_more" name= "reply_more" placeholder="댓글달기...">
													<input type="button" class="replyInputButton" value="Write">
												</div>
										</div>
										</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
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
	
	$(".deleted_op").click(function(){
		if(confirm("정말로 삭제 하시겠습니까?")){
			location = 'pageServlet?op=delete&id=' + $(this).attr('data-id');
		}
		return false;
	});
	$(".deleted_tp").click(function(){
		if(confirm("정말로 삭제 하시겠습니까?")){
			location = 'topicServlet?op=delete&id=' + $(this).attr('data-id');
		}
		return false;
	});
	$(".deleted_rp").click(function(){
		if(confirm("정말로 삭제 하시겠습니까?")){
			location = 'replyServlet?op=delete&id=' + $(this).attr('data-id');
		}
		return false;
	});
	
	$("#opinionWrite").click(function(){
		if($("#opiniontext").val().length == 0) {
			alert("내용을 입력하여 주세요.");
			$("#opiniontext").focus();
			return;
		}
		if($(':radio[name="likehate"]:checked').length == 0) {
			alert("찬성인지 반대인지 선택해 주세요.");
			return;
		}
		
		$.post('pageServlet', {
			topic_id : $("#topic_id").val(),
			content : $("#opiniontext").val(),
			position : $(':radio[name="likehate"]:checked').val()
		}, function(){
			alert("의견이 정상적으로 등록되었습니다.");
			location = 'pageServlet?op=opinion&topic_id=' + $("#topic_id").val();
		});
		$("#opiniontext").val("");
	});
	
	$(".replyInputButton").click(function() {
		if ($(this).parent().find((".reply_more")).val().length == 0) {
			alert("댓글을 입력하여 주세요.");
			$(this).parent().find((".reply_more")).focus();
			return;
		}
		
		$.post('replyServlet', {
				opinion_id : $(this).parent().find((".opinion_id")).val(),
				content : $(this).parent().find((".reply_more")).val()
		}, function(){
				alert("댓글이 등록되었습니다.");
				location = 'pageServlet?op=opinion&topic_id=' + $("#topic_id").val();
			});
		$(this).parent().find((".reply_more")).val("");
	});
	
	$('.reply_more').keydown(function(event){
		if(event.keyCode == 13)
		$(this).parent().find(".replyInputButton").click();
	});
	
	$('#opiniontext').keydown(function(event){
		if(event.keyCode == 13)
		$("#opinionWrite").click();
	});
	
	$('#searchbar').keyup(function() {
		// 입력창에 키가 눌러진 경우 이벤트 처리
		// Ajax로 값을 전송
		$.post('KeywordSuggestServlet', {query: $('#searchbar').val()}, 
			function(data) {
				$('#suggest_box').html(data).show();
			});		
	});


	$(".toggle").click(function(){
			$(this).parents('.opinion').find('#section_sub').slideToggle();
		});

});
</script>
</html>
