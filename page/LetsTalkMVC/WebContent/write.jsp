<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
<!-- Site styles -->
<link rel="stylesheet" type="text/css" href="stylesheets/index.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="content">
		<div id="write">
		
			<c:if test="${sessionScope.user.nickname == null }">
				<script>
					$(function(){
						alert("글쓰기는 로그인 후 작성 가능합니다.");
						location='topic.jsp?keyword_id=' + ${keyword_id };
					});
				</script>
			</c:if>

			<form action="multiServlet?op=write"class="form-horizontal" enctype ="multipart/form-data"  method ="post" >
				<fieldset>
					<div id="legend" class="">
						<legend class="">당신의 생각을 넓혀드립니다 :-) </legend>
					</div>
					<div id="section">
					<div class="control-group">
							<!-- Text input-->

							<label class="control-label" for="keyword">무엇에 대해서?</label>
							<div class="controls" id="keyword">${keyword_id }
								</div>
						</div>

						<div class="control-group">
							<!-- Text input-->
							<label class="control-label" for="user">나의 이름은</label>
							<div class="controls" id="user_name">
								${sessionScope.user.nickname }</div>
						</div>
						
						<div class="control-group">
							<!-- Textarea -->
							<label class="control-label" for="context">내용</label>
							<div class="controls">
								<div class="textarea">
									<textarea name="content"> </textarea>
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
				
				<input type="hidden" name="keyword_id" value="${keyword_id }">
				<input type="hidden" name="op" value="write">
				<input type="submit" value="Lets Talk!">
				<input type="reset" value="재작성">
			</form>	

		</div>
	</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
</html>