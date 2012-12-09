<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="bean.Keyword;"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>Let's Talk!!렛톡에 오신걸 환영합니다!!</title>
<!-- Site styles -->
<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
<script src='./javascript/js-cumulus.js'></script>
<script src='http://code.jquery.com/jquery-latest.js'></script>
<script type="text/javascript">
	//JSCumulus.noConflict();

	/* DEBUG */
	window.console && console.time && console.time("TagCloud1");

	/* TagCloud 1 */
	var tags = [
			/*
			new Tag("JavaScript", {	color: "red"	}),																		// Color setting Example
			new Tag("Jeroen van Warmerdam", 60, "http://www.jeroenvanwarmerdam.nl"),		// link Example
			new Tag("이명박", 100, false),																							// Tag(name, weight, link, new window)
			*/
<%
		List<Keyword> list = (List<Keyword>)request.getAttribute("keywords");

		for(Keyword keywords : list) {
			String keyword = keywords.getKeyword();
			int weight = keywords.getWeight();
			int id = keywords.getKeyword_id();
	   	out.println("new Tag(\"" + keyword + "\", " + weight + ", \"pageServlet?op=topic&keyword_id=" + id + "\"" +  "),");
		}
%>
	 ];
	var tagCloud1 = new TagCloud(tags, 440, 340);
	/* DEBUG */
	window.console && console.time && console.timeEnd("TagCloud1");
</script>
</head>

<body>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id="content">
				<div id="content_top">
					<c:if test="${sessionScope.user.nickname != null }">
						<div id="add_keyword_form">
							<input type="text"  name="add_keyword" id="add_bar" placeholder="  토론하고 싶은 키워드를 추가하세요!">
							<input type="button" value="추가" id="add_button">
						</div>
					</c:if>
				</div>
				<div id="content_center">
					<div id="caption">Hot Keyword</div>

					<div id="tag_cloud">
						<div id="tagCloud1"></div>
						<script type="text/javascript">
							tagCloud1.Distribute(document.getElementById("tagCloud1")).Animate();
						</script>
					</div>
					
					<div id="content_bottom">
						<a href="main.jsp" class="btn btn-mini">입장하기</a>
					</div>
				</div>
			</div>
		</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
<script type="text/javascript">

$(function(){
	
	$("#add_button").click(function(){
		if($("#add_bar").val().length == 0) {
			alert("내용을 입력하여 주세요.");
			$("#add_bar").focus();
			return;
		}

		$.post('keywordAddServlet', {
			keyword : $("#add_bar").val()
		}, function(){
			alert("키워드가 등록되었습니다.");
			location = 'pageServlet';
		});
		$("#add_bar").val("");
	});
	
	$('#add_bar').keydown(function(event){
		if(event.keyCode == 13)
		$(this).parent().find("#add_button").click();
	});

});
</script>
</html>