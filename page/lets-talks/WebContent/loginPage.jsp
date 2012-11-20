<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8">
	<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
	<link href="stylesheets/loginPage.css" rel="stylesheet" type="text/css">
	<script src='./javascript/jquery-1.8.2.min.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
					<jsp:include page="share/header.jsp" />
		</div>
			<div id = "wraplogin">	
				
					<div id="loginTitle">
							<span><b>가입하기</b></br></span>
							당신의 생각을 향상시켜 드립니다.
					</div>
					<div class ="add">
						<form name="write" action="joinProcess.jsp" method ="POST">
						<ul>
							<li>name
							<input type = "text" name="name"/></li>
							<li>ID :
							<input type = "text" name="id"/>
							</li>
							<li>Password:
							<input type = "password" name="pwd"/>
							</li>
							<li>Password(again):
							<input type = "password" name="pwdagain"/>
							</li>
							<li>E-mail
							<input type ="text" name="email"/>
							</li>
							<li>country
							<select name="country">
								<option value = "kr">
									Korea
								</option>
								<option value = "Ame">
									America
								</option>
								<option value = "Ger">
								Germany
								</option>
								<option value = "Jap">
									Japan
								</option>
								<option value ="Chi">
									China
								</option>
							</select>
							</li>
							<li>
								Gender:
							</li>
							<li>
								<input type ="radio"name="gender" value="1"/>man
								<input type ="radio" name="gender" value ="2"/>woman
							</li>
							<li>
								hobby:
							</li>
							<li>
								<input type ="checkbox"name ="hobby"value="sports"/>
								sports
								<input type ="checkbox"name ="hobby"value="book"/>
								book
								<input type ="checkbox"name ="hobby"value="sing"/>
								sing
								<input type ="checkbox"name ="hobby"value="love"/>
								love
								<input type ="checkbox"name ="hobby"value="fassion"/>
								fassion
								<input type ="checkbox"name ="hobby"value="photo"/>
								photo
								<input type ="checkbox"name ="hobby"value="gambling"/>
								gambling

							</li>
							<li><input type="submit" name="submit"
								value=" 가입하기 "/></li>
						</ul>
							</form>
					</div>
			
			</div>
		<div id="bottom">
					<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
</html>