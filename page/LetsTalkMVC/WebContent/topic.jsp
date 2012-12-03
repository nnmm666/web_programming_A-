<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>Let's Talk!!렛톡에 오신걸 환영합니다!!</title>
<!-- Site styles -->
<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
<script src='http://code.jquery.com/jquery-latest.js'></script>
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
						<span id="section_1_exit"><a href="pageServlet">×</a> </span> Hot
						Hot Topics!! about ${keyword.keyword }
						<hr></hr>
					</div>

					<!-- Start of pagination-basic -->
					<div class="pagination-basic">
						<div class="sliderkit-panel">

						<c:if test="${topics.numItems == 0 }">
							관련된 주제가 없습니다.
						</c:if>

							<c:forEach var="topic" items="${topics.list }">
								<a href="opinion.jsp?topic_id=${topic.topic_id }">
									<div class="sliderkit-block">
										<div id="topicPhoto">
											<img src="./images/example.png" width='66px' height='60px'>
										</div>
										<div id="topicContent">${topic.content }</div>
										<div class="topicContentBottom">
											<span>작성자 : ${topic.writer }</span>
											<span>작성일 :	${topic.date }</span>
										</div>
									</div>
								</a>
							</c:forEach>
						</div>


						<div class="sliderkit-nav">
							<div class="sliderkit-nav-clip">
								<ul>
									<c:choose>
										<c:when test="${1 >= topics.page }">
											<li class="disable"><a href="#">&laquo;</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="pageServlet?op=topic&keyword_id=${id }&page=${topics.page - 1 }">&laquo;</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="i" begin="${topics.startPageNo }" end="${topics.endPageNo }">
										<c:choose>
											<c:when test="${i == topics.page }">
												<li class="active"><a	href='pageServlet?op=topic&keyword_id=${keyword.id }&page=${i }'>${i }</a></li>
											</c:when>
											<c:otherwise>
												<li><a href='pageServlet?op=topic&keyword_id=${keyword.id }&page=${i }'>${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:choose>
										<c:when test="${topics.numPages <= topics.page }">
											<li class="disable"><a href="#">&raquo;</a></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="pageServlet?op=topic&keyword_id=${keyword.id }&page=${topics.page + 1 }">&raquo;</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
								<a href="pageServlet?op=write&keyword_id=${keyword.id }" id=writeButton> 주제 추가하기 </a>
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


<script type="text/javascript">
	$(document).ready(function() {
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		// 구한 높이와 너비를 css에..
		$('#mask').css({
			'width' : maskWidth,
			'height' : maskHeight
		});
		//검은 막 눌렀을 때
		$('#mask').click(function() {
			location = "pageServlet";
		});
	});
</script>
</html>