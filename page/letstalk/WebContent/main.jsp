<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
		<meta name="Keywords" content="slider, kit, slideshow, gallery, carousel, jquery plugin" />
		<meta name="Description" content="Slider Kit jQuery slideshow plugin: content sliders examples" />
		
		<!-- jQuery Plugin scripts -->
		<script type="text/javascript" src="javascript/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="javascript/jquery.easing.1.3.min.js"></script>
		<script type="text/javascript" src="javascript/jquery.mousewheel.min.js"></script>
		
		<!-- Slider Kit scripts -->
		<script type="text/javascript" src="javascript/jquery.sliderkit.1.9.2.pack.js"></script>
		
		<!-- Slider Kit launch -->
			<script type="text/javascript">
			$(window).load(function(){ //$(window).load() must be used instead of $(document).ready() because of Webkit compatibility		
				
				// Photo slider > Minimal
				$(".contentslider-std").sliderkit({
					auto:0,
					tabs:1,
					circular:1,
					panelfx:"sliding",
					panelfxfirst:"fading",
					panelfxeasing:"easeInOutExpo",
					fastchange:0,
					keyboard:1
				});
				
			});	
		</script>

		<!-- Site styles -->
		<link href="./stylesheets/index.css" rel="stylesheet" type="text/css">
		<!-- Slider Kit styles -->
		
		<link rel="stylesheet" type="text/css" href="./stylesheets/sliderkit-core.css" media="screen, projection" />
		<link rel="stylesheet" type="text/css" href="./stylesheets/main.css" media="screen, projection" />
	</head>

	<body>
		<div id="wrap">
			<div id="top">
			<!-- 	<jsp:include page="share/header.jsp" /> -->
			</div>

			<div id="page" class="inner layout-1col">
				<div id="content">				
					<noscript><div class="noscript"><span class="code-sitename">Slider Kit</span> jQuery plugin requires Javascript activation.</div></noscript>
					
				
					<!-- Start contentslider-std -->
					<div class="sliderkit contentslider-std">
						<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-prev"><a href="#" title="Previous"><span>Previous</span></a></div>
						<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-next"><a href="#" title="Next"><span>Next</span></a></div>
						<div class="sliderkit-nav">
							<div class="sliderkit-nav-clip">
								<ul>
									<li><a href="#" title="[link title]">추천수</a></li>
									<li><a href="#" title="[link title]">조회수</a></li>
									<li><a href="#" title="[link title]">댓글수</a></li>
								</ul>
							</div>
						</div>
						<div class="sliderkit-panels">
							<div class="sliderkit-panel">
								<a href="opinion.html">
									<div class="sub">
										<div class="sub_title"><span>오바마 재선 미국 바뀔까요??</span>
											<div class="sub_title_right">
												<span><img src="./images/like.png"> 0 </span>
												<span><img src="./images/hate.png"> 0 </span>
											</div>
										</div>
										<div class="left"><img src="./images/charactor.png" alt="사진"></div>
										<div class="right">
											<p>사실 오바마가 4년간 집권하면서 미국 경제 살리기는 커녕 부시가 벌려놓은 일들 뒷바라지 하느라 바빳잖아요. 못한 일은 없지만 딱히 잘한 일도 없는것 같은데 이번엔 미국이 과연 바뀔 수 있을까요?</p>
										</div>
									</div>
								</a>
							</div>				

							<div class="sliderkit-panel">
								<a href="opinion.html">
									<div class="sub">
										<div class="sub_title"><span>Title 1</span>
											<div class="sub_title_right">
												<span><img src="./images/like.png"> 0 </span>
												<span><img src="./images/hate.png"> 0 </span>
											</div>
										</div>
										<div class="left"><img src="./images/charactor.png" alt="사진"></div>
										<div class="right">
											<p>helo</p>
										</div>
									</div>
								</a>
							</div>
							
							<div class="sliderkit-panel">
								<a href="opinion.html">
									<div class="sub">
										<div class="sub_title"><span>Title 1</span>
											<div class="sub_title_right">
												<span><img src="./images/like.png"> 0 </span>
												<span><img src="./images/hate.png"> 0 </span>
											</div>
										</div>
										<div class="left"><img src="./images/charactor.png" alt="사진"></div>
										<div class="right">
											<p>helo</p>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<!-- // end of contentslider-std -->
					
				</div>
				<!-- end of contetn-->
			</div>
			<div id="bottom">
				<jsp:include page="share/footer.jsp"/>
			</div>
		</div>
	</body>
</html>