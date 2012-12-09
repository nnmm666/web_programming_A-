<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id="content">
				<div id="content_border">
					<div id="logintitle">
						<span><b>지금 Let's-talk에 가입하세요</b> </span><br>
						<h4>당신의 생각을 향상시켜드립니다.</h4>
					</div>
					<div class="container">
						
						<form id="form" class="form-horizontal" action="multiServlet" enctype="multipart/form-data" method="POST">
							<fieldset>
								<legend class="legend">Sign Up</legend>

							<%int id = Integer.parseInt(request.getParameter("id")); %>
									<div id="user_content">
									<c:if test ="id > 0">
										<div class="control-group">
											<label class="control-label" for="email">E-mail</label>
											
												<div class="controls">
													<input id="email" class="inputbox" type="email" placeholder="아이디 혹은 이메일"
													name="email" >
												</div>
											
										</div>
									</c:if>
									
									<div class="control-group">
										<label class="control-label" for="nickname">Nick-Name</label>
										<div class="controls">
											<input id="nickname" class="inputbox" type="text" placeholder="닉네임"
												name="nickname" value="${sessionScope.user.nickname }">
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="name">Name</label>
										<div class="controls">
											<input id="name" class="inputbox" type="text" placeholder="이름" name="name" value="${sessionScope.user.name }">
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="password">Password</label>
										<div class="controls">
											<input id="password" class="inputbox" type="password" name="password">
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="password_confirm">Password
											Confirmation</label>
										<div class="controls">
											<input id="password-confirm" class="inputbox" type="password"	name="password_confirm">
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="picture">Profile Photo</label>
										<div class="controls">
											<input class="file" id="fileInput" name="file" type="file">
										</div>
									</div>
								</div>
							</fieldset>

							<div class="form-actions">
								<input type="hidden" name="op" value="register">
								<input id="cancel" type="button" class="btn" value="취소하기">
								<input id="btn" type="button" class="btn btn-primary" value="가입">
							</div>
						</form>
						
						
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
	$("#btn").click(function() {
		if($("#email").val() == "") {
			alert("E-mail을 입력해주십시오");
		} else if($("#nickname").val() == "") {
			alert("Nick-Name을 입력해주십시오");
		} else if($("#name").val() == "") {
			alert("Name을 입력해주십시오");
		} else if($("#password").val() == "") {
			alert("비밀번호를 입력해주십시오");
		} else if($("#password").val() != $("#password-confirm").val()) {
			alert("비밀번호가 일치하지 않습니다");
		} else if($("#fileInput").val() == null) {
			alert("프로필 사진을 선택해주십시오");
		} else {
			$("#form").submit();
		}
	});
	$("#cancel").click(function() {
		history.back();
	});
</script>
</html>