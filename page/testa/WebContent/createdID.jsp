
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
<link rel="stylesheet" type="text/css"
	href="stylesheets/sliderkit-core.css" media="screen, projection" />

<link href="./stylesheets/css/index.css" rel="stylesheet"
	type="text/css">
<script src='./javascript/jquery-1.8.2.min.js'></script>
<script src='./javascript/js-cumulus.js'></script>

<script src='./javascript/jquery-1.8.2.min.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
			<div id="header">
				<div id="logo">
					<a href="index.html">Let's Talk!!</a>
				</div>

				<div id="border"></div>
			</div>
		</div>
		<div id="container">
			<div id="loginTitle">
				<h2>가입하기</h2>
				<span>당신의 생각을 향상시켜드립니다.</span>
			</div>
			<div class="add">
				<form action="register.jsp" method="POST" name="joinus">
					<ul>
						<li>name <input type="text" name="name" /></li>
						<li>ID <input type="text" name="userid" /></li>

						<li>Password <input type="password" name="pwd" /></li>
						<li>Password(again) <input type="password" name="pwd_confirm" /></li>

						<li>E-mail <input type="text" name="email" /></li>

						<li>country <select name="country">
								<option value="kr">Korea</option>
								<option value="Ame">America</option>
								<option value="Ger">Germany</option>
								<option value="Jap">Japan</option>
								<option value="Chi">China</option>
						</select>
						</li>

						<li>Gender <input type="radio" name="gender" value="Man" />man
							<input type="radio" name="gender" value="Woman" />woman
						</li>

						<li>favorites<input type="checkbox" name="favorites" value="sports" />
							sports <input type="checkbox" name="favorites" value="book" /> book
							<input type="checkbox" name="favorites" value="sing" /> sing <input
							type="checkbox" name="favorites" value="love" /> love <input
							type="checkbox" name="favorites" value="fassion" /> fassion <input
							type="checkbox" name="favorites" value="photo" /> photo <input
							type="checkbox" name="favorites" value="gambling" /> gambling
						</li>

						<li><textarea cols=“100” rows=“40” name=“memo”></textarea></li>

						<li><input type="submit" name="submit" value=" 가입하기 " /></li>
					</ul>
				</form>
			</div>
		</div>
		<div id="bottom">
			<div id="footer">
				Let's Talk!!&copy; 렛츠토크&copy; 렛톡&copy; 2012<br> <a
					href="developer.html">개발자</a> · <a href="">도움말</a> · <a href="">개인정보보호</a>
				· <a href="">쿠키</a> · <a href="">이용약관</a> · <a href="">고객센터</a>
			</div>
		</div>
		<div id="topicSelect"></div>
	</div>
</body>
</html>