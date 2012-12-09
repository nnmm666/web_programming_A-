<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8">
	<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
	<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
	<script src='http://code.jquery.com/jquery-latest.js'></script>
	<style>
	.profiles{width : 890px; height:500px; padding-left:110px;}
.profiles .profiles_list{width:400px; height:150px; border:1px solid #eee; background: #eee; margin-bottom:70px; padding:5px;}
.profiles .profiles_list .profile_factor_left{width:130px; float:left; padding:5px;}
.profiles .profiles_list .profile_factor_right{margin-left:15px; text-align:left; padding:10px;}
.profiles .profiles_list .profile_factor_right .profile_factor .factor{line-height: 25px; font-weight:bold;color:#555;}
.profiles .profiles_list .profile_factor_right .profile_factor span{}
#profil_left{float:left; margin:25px 0 3px 10px;}
#profil_right{float:right; margin:25px 3px 0 10px;}

.profile_factor_left {margin-right:50px;}
	</style>
</head>
<body>
	<div id="wrap">
		<div id="top">
					<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id="content">
				<p style="margin-top:30px; font-size:30px;">Who Make this Site?</p>
				<div class="profiles">
					<div id="profil_left">
						<div class="profiles_list">
							<div class="profile_factor_left"><img style="width:150px; height:120px;" src="./images/image3.JPG" alt="zz"></div>
							<div class="profile_factor_right">
								<div class="profile_factor">
									<span class="factor">Name : 이창희</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">email : ctrl0703@naver.com</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">Job : 학생</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">Site : letstalk</span>
									<span></span>
								</div>
							</div>
						</div>
						<div class="profiles_list">
							<div class="profile_factor_left"><img style="width:150px; height:120px;" src="./images/image2.jpg" alt="zz"></div>
							<div class="profile_factor_right">
								<div class="profile_factor">
									<span class="factor">Name : 윤나라</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">email : si1254@naver.com</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">Job : 학생</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">Site : letstalk</span>
									<span></span>
								</div>
							</div>
						</div>
					</div>

					<div id="profil_right">
						<div class="profiles_list">
							<div class="profile_factor_left"><img style="width:150px; height:120px;" src="./images/image1.jpg" alt="zz"> </div>
							<div class="profile_factor_right">
								<div class="profile_factor">
									<span class="factor">Name : 박세진</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">Email : nnmm666@naver.com</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">Job : 학생</span>
									<span></span>
								</div>
								<div class="profile_factor">
									<span class="factor">Site : letstalk</span>
									<span></span>
								</div>
							</div>
						</div>
						<div class="profiles_list">
							<div class="profile_factor_left"><img style="width:150px; height:120px;" src="./images/image4.jpg" alt="이가을"></div>
							<div class="profile_factor_right">
								<div class="profile_factor">
									<span class="factor">Name : 이가을</span>
								</div>
								<div class="profile_factor">
									<span class="factor">Email : leegaeul92@naver.com</span>
								</div>
								<div class="profile_factor">
									<span class="factor">Job : 학생</span>
								</div>
								<div class="profile_factor">
									<span class="factor">Site : letstalk</span>
								</div>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
		
	</div>
	<div id="bottom">
			<div id="footer">
				Let's Talk!!&copy; 렛츠토크&copy; 렛톡&copy; 2012<br>
				<a href="developer.jsp">개발자</a> · <a href="">도움말</a> ·  <a href="">개인정보보호</a> ·  <a href="">쿠키</a> ·  <a href="">이용약관</a> ·  <a href="">고객센터</a>
			</div>
		</div>
</body>
</html>