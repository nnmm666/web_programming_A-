<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>Let's Talk!!렛톡에 오신걸 환영합니다!!</title>
<!-- Site styles -->
<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
<script src='./javascript/jquery-1.8.2.min.js'></script>
<script src='./javascript/js-cumulus.js'></script>


<meta name="Keywords"
	content="slider, kit, slideshow, gallery, carousel, jquery plugin" />
<meta name="Description"
	content="Slider Kit jQuery slideshow plugin: content sliders examples" />

<!-- Slider Kit scripts -->
<script type="text/javascript"
	src="javascript/jquery.sliderkit.1.9.2.pack.js"></script>

<!-- Slider Kit launch -->
<script type="text/javascript">
	$(window).load(function() {
		$(".pagination-basic").sliderkit({
			auto : false,
			tabs : true,
			freeheight : true
		});
	});
</script>

<script type="text/javascript">
	//JSCumulus.noConflict();

	/* DEBUG */window.console && console.time && console.time("TagCloud1");

	/* TagCloud 1 */
	var tags = [
	//			new Tag("JavaScript", {	color: "red"	}),		// Color setting Example
	//			new Tag("Jeroen van Warmerdam", 60, "http://www.jeroenvanwarmerdam.nl"),		// link Example
	new Tag("이명박", 100, false), new Tag("박근혜", 80, false), // Tag(name, weight, link, new window)
	new Tag("문재인", 5, false), new Tag("안철수", 50, false),
			new Tag("슈퍼스타k4", 50, false), new Tag("오바마", 50, false),
			new Tag("한글날", 50, false), new Tag("타블로", 50, false),
			new Tag("묻지마 폭행", 50, false), new Tag("윈도우8", 50, false),
			new Tag("스티브 잡스", 50, false), ];
	var tagCloud1 = new TagCloud(tags, 440, 340);

	/* DEBUG */window.console && console.time && console.timeEnd("TagCloud1");
</script>
</head>

<body>
	<div id="wrap">
		<div id="mask"></div>
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id="content">
				<div id="content_top">
					<form>
						<input type="text" placeholder="  키워드를 검색하세요!" id="search_bar">
						<input type="button" value="검색" id="search_button">
					</form>
				</div>
				<div id="content_center">
					<div id="caption">Hot Keyword</div>

					<div id="section_1">

						<div id="section_1_top">
							<span id="section_1_exit"><img
								src="./images/btn_close.png"> </span> Hot Hot Topics!!
							<hr></hr>
						</div>

						<!-- Start of pagination-basic -->
						<div class="pagination-basic">

							<div class="sliderkit-panels">
								<div class="sliderkit-panel">
									<a href="opinion.jsp">
										<div class="sliderkit-block">
											<div id="topicPhoto">
												<img src="./images/example.png" width='66px' height='60px'>
											</div>
											<div id="topicContent">
												엠넷의 대국민 오디션 슈퍼스타k4가 악마의 편집으로 논란이 끊기지 않습니다. 어떻게 생각하시나요??<br>
											</div>
										</div> </a> <a href="opinion.jsp">
										<div class="sliderkit-block">
											<div id="topicPhoto">
												<img src="./images/example.png" width='66px' height='60px'>
											</div>
											<div id="topicContent">
												엠넷의 대국민 오디션 슈퍼스타k4가 악마의 편집으로 논란이 끊기지 않습니다. 어떻게 생각하시나요??<br>
											</div>
										</div> </a> <a href="opinion.jsp">
										<div class="sliderkit-block">
											<div id="topicPhoto">
												<img src="./images/example.png" width='66px' height='60px'>
											</div>
											<div id="topicContent">
												엠넷의 대국민 오디션 슈퍼스타k4가 악마의 편집으로 논란이 끊기지 않습니다. 어떻게 생각하시나요??<br>
											</div>
										</div> </a>
								</div>
								<div class="sliderkit-panel">
									<div class="sliderkit-block">A sixth block.</div>
									<div class="sliderkit-block">A seventh content block.</div>
									<div class="sliderkit-block">A eighth content block.</div>
								</div>
								<div class="sliderkit-panel">
									<div class="sliderkit-block">A eleventh block.</div>
									<div class="sliderkit-block">A twelfth content block.</div>
									<div class="sliderkit-block">A thirteenth content block.</div>
								</div>
								<div class="sliderkit-panel">
									<div class="sliderkit-block">A sixteenth content block.</div>
									<div class="sliderkit-block">A seventeenth content block.</div>
									<div class="sliderkit-block">That's all folks !</div>
								</div>
							</div>
							<div class="sliderkit-nav">
								<div class="sliderkit-nav-clip">
									<ul>
										<li><a href="#" title="[link title]">1</a></li>
										<li><a href="#" title="[link title]">2</a></li>
										<li><a href="#" title="[link title]">3</a></li>
										<li><a href="#" title="[link title]">4</a></li>
									</ul>
								</div>
							</div>

						</div>
						<!-- // end of tabs-imbricate -->
					</div>
					<div id="tag_cloud">
						<div id="tagCloud1"></div>
						<script type="text/javascript">
							tagCloud1.Distribute(
									document.getElementById("tagCloud1"))
									.Animate();
						</script>
					</div>
					<div id="content_bottom">
						<a href="main.jsp">Enter</a>
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

<script type="text/javascript">

function wrapWindowByMask(){
	//화면의 높이와 너비구함
		var maskHeight = $(document).height();        
	  var maskWidth = $(window).width();
	  // 구한 높이와 너비를 css에..
	  $('#mask').css({'width':maskWidth,'height':maskHeight});
		//불투명도 80%
	  $('#mask').fadeTo("fast",0.8);  
	  $("#section_1").show();
}
	$(document).ready(function() {
		//mask 띄우기
		$(".tagClass").click(function(e) {       
		    e.preventDefault();         
		    wrapWindowByMask();     
		  });
			//닫기 눌렀을 때
			$("#section_1_exit").click(function(e) {
				 e.preventDefault(); 
				$("#mask, #section_1").hide();
			});
			//검은 막 눌렀을 때
			$('#mask').click(function () {            
	    $(this).hide();            
	    $("#section_1").hide();        
	    }); 
		$("#section_1").hide();
	});
</script>
