<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8">
	<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
	<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
	<link href="stylesheets/opinion.css" rel="stylesheet" type="text/css">
	<script src='./javascript/jquery-1.8.2.min.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
					<jsp:include page="share/header.jsp" />
		</div>
	
		<div id="middle">
			<div id="content">
				<div id="search">
					<form class="form-search">
						<input type="text" id="searchbar" class="input-medium search-query" placeholder="다른 주제 검색">
						<button type="submit" class="searchButton">Search</button>
					</form>
				</div>
				<div id="topicdiv">슈퍼스타k4</div>
				<div id="topic">
					<div id="topicPhoto">
						<img src="./images/example.png" width='66px' height='100px'>
					</div>
					<div id="topicContent">
					엠넷의 대국민 오디션 슈퍼스타k4는 한국 K-POP시장에 큰 파장을 불러 일으킨다고 생각합니다.
					매 시즌마다 실력좋은 가수들이 나오고 있고, 시청률도 또한 동시간대 최고를 기록하고 있습니다....
					어쩌고저쩌고...
					</div>
				</div>
				<div id="myopinion">
					<input type="text" id="opiniontext" placeholder="클릭하여 당신의 의견을 남겨주세요">
				</div>
				<div id ="myopinion_sub">
					<span class="myopinion_likehate">
						<input type="radio" name="likehate" value="like">찬성 <img src="./images/like.png">
						<input type="radio" name="likehate" value="hate">반대 <img src="./images/hate.png"> 
					</span>
					<input type="button" id="opinionWrite" value="Write">
				</div>
				<div id="MoreOpinion">
					<div>
						<div class="opinion">
							<div class="titleborder_like">
								인기가 있으면 논란이 되는건 당연한법~~
								<span class="toggle">▲▼</span>
							</div>
							<div class="section">
								<div class="section_top">
									<div class="section_left">
										인기가 있으면 논란이 되는건 당연한법~~<br>
										뭐 저런거갖다가 난리냐<br>
										재미만 있으면 됏지<br>
									</div>
									<div class="section_right">
										<span><img src="./images/like.png"> 0 </sapn>
										<span><img src="./images/hate.png"> 0 </span>
									</div>
								</div>
								<div id="section_sub">
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 공감합니당 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> 개미즐 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 넵 깨갱..</div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> ㅎㅎㅎ.. </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply_1"> <input type="text" class="reply_more" placeholder="댓글달기..."> </div>
								</div>
							</div>
						</div>
						<div class="opinion">
							<div class="titleborder_hate">
								재미없음
								<span class="toggle">▲▼</span>
							</div>
							<div class="section">
								<div class="section_top">
									<div class="section_left">
										재미없음<br>
										애들도 예전만 못하구..
									</div>
									<div class="section_right">
										<span><img src="./images/like.png"> 0 </sapn>
										<span><img src="./images/hate.png"> 0 </span>
									</div>
								</div>
								<div id="section_sub">
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 공감합니당 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> 개미즐 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 넵 깨갱..</div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> ㅎㅎㅎ.. </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply_1"> <input type="text" class="reply_more" placeholder="댓글달기..."> </div>
								</div>
							</div>
						</div>
						<div class="opinion">
							<div class="titleborder_hate">
								사기방송!! 종영해라!!
								<span class="toggle">▲▼</span>
							</div>
							<div class="section">
								<div class="section_top">
									<div class="section_left">
										사기방송!! 종영해라!!
										사기치치지말고 이제 그만하지??
										이승철 ㅗㅗ
									</div>
									<div class="section_right">
										<span><img src="./images/like.png"> 0 </sapn>
										<span><img src="./images/hate.png"> 0 </span>
									</div>
								</div>
								<div id="section_sub">
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 공감합니당 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> 개미즐 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 넵 깨갱..</div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> ㅎㅎㅎ.. </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply_1"> <input type="text" class="reply_more" placeholder="댓글달기..."> </div>
								</div>
							</div>
						</div>
						<div class="opinion">
							<div class="titleborder_like">
								완전 재밌는뎅??
								<span class="toggle">▲▼</span>
							</div>
							<div class="section">
								<div class="section_top">
									<div class="section_left">
										유승우는 왜 떨구냐! 정준영을 탈락시키자!
									</div>
									<div class="section_right">
										<span><img src="./images/like.png"> 0 </sapn>
										<span><img src="./images/hate.png"> 0 </span>
									</div>
								</div>
								<div id="section_sub">
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 공감합니당 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> 개미즐 </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>이 창희</b> 넵 깨갱..</div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply">
										<div class="user_Face"><img src="./images/charactor.png" width ="70px;" height="50px;"></div>
										<div class="user_content">
											<div><b>윤 나라</b> ㅎㅎㅎ.. </div>
											<div>2012.11.13</div>
										</div>
									</div>
									<div class="section_reply_1"> <input type="text" class="reply_more" placeholder="댓글달기..."> </div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	
	</div>
	
</body>
</html>

<script type="text/javascript">

$(function(){

	$(".toggle").click(function(){
			$(this).parents('.opinion').find('.section').slideToggle();
		});
});
	
</script>
