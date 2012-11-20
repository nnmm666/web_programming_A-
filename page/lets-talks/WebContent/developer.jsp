<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8">
	<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
	<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
	<link href="stylesheets/developer.css" rel="stylesheet" type="text/css">
	<script src='./javascript/jquery-1.8.2.min.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
					<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id="content">
				<h2>개발자 정보</h2>
				<div class="profiles">
					<div id="left">
						<div class="profiles_list">
							<div class="profile_factor_left"><img src="1.jpg" alt="zz"></div>
							<div class="profile_factor_right">
								<div class="profile_factor">
									<span class="factor">이름</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">연락처</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">이메일</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">직업</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">개인 사이트</span>
									<span></span>
								</div>
							</div>
						</div>
						<div class="profiles_list">
							<div class="profile_factor_left"><img src="1.jpg" alt="zz"></div>
							<div class="profile_factor_right">
								<div class="profile_factor">
									<span class="factor">이름</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">연락처</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">이메일</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">직업</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">개인 사이트</span>
									<span></span>
								</div>
							</div>
						</div>
					</div>

					<div id="right">
						<div class="profiles_list">
							<div class="profile_factor_left"><img src="1.jpg" alt="zz">사진</div>
							<div class="profile_factor_right">
								<div class="profile_factor">
									<span class="factor">이름</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">연락처</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">이메일</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">직업</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">개인 사이트</span>
									<span></span>
								</div>
							</div>
						</div>
						<div class="profiles_list">
							<div class="profile_factor_left"><img src="1.jpg" alt="이가을"></div>
							<div class="profile_factor_right">
								<div class="profile_factor">
									<span class="factor">이름</span>
									<span>이가을</span>
								</div>
								<div class="profile_factor">
									<span class="factor">연락처</span>
									<span>010-8768-5300</span>
								</div>
								<div class="profile_factor">
									<span class="factor">이메일</span>
									<span>lge920904@naver.com</span>
								</div>
								<div class="profile_factor">
									<span class="factor">직위</span>
									<span>대학생</span>
								</div>
								<div class="profile_factor">
									<span class="factor">개인 사이트</span>
									<span>cyworld.com/87685300</span>
								</div>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>

		<div id="bottom">
					<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
</html>