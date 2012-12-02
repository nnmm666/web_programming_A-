<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
Connection conn = null;
Statement stmt =null;
ResultSet rs = null;

String dbUrl = "jdbc:mysql://localhost:3306/web2012";
String dbUser = "web";
String dbPassword = "asdf";

request.setCharacterEncoding("utf-8");
	String imgURL="http://localhost:8080/letstalk/";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
<meta name="Keywords"
	content="slider, kit, slideshow, gallery, carousel, jquery plugin" />
<meta name="Description"
	content="Slider Kit jQuery slideshow plugin: content sliders examples" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<!-- jQuery Plugin scripts -->
<script type="text/javascript" src="javascript/jquery.easing.1.3.min.js"></script>
<script type="text/javascript" src="javascript/jquery.mousewheel.min.js"></script>

<!-- Slider Kit scripts -->
<script type="text/javascript"
	src="javascript/jquery.sliderkit.1.9.2.pack.js"></script>
<!-- Slider Kit launch -->
<script type="text/javascript">
	$(window).load(function() { //$(window).load() must be used instead of $(document).ready() because of Webkit compatibility		
		// Photo slider > Minimal
		$(".contentslider-std").sliderkit({
			auto : 0,
			tabs : 1,
			circular : 1,
			panelfx : "sliding",
			panelfxfirst : "fading",
			panelfxeasing : "easeInOutExpo",
			fastchange : 0,
			keyboard : 1
		});
	});
</script>
<link rel="stylesheet" type="text/css" href="stylesheets/index.css" />
<link rel="stylesheet" type="text/css" href="stylesheets/main.css"
	media="screen, projection" />
</head>

<!-- Body Start -->
<body>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>

		<div id="page" class="inner layout-1col">
			<div id="content">
				<noscript>
					<div class="noscript">
						<span class="code-sitename">Slider Kit</span> jQuery plugin
						requires Javascript activation.
					</div>
				</noscript>

				<!-- Start contentslider-std -->
				<div class="sliderkit contentslider-std">
					<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-prev">
						<a href="#" title="Previous"><span>Previous</span> </a>
					</div>
					<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-next">
						<a href="#" title="Next"><span>Next</span> </a>
					</div>
					<div class="sliderkit-nav">
						<div class="sliderkit-nav-clip">
							<ul>
								<li><a href="#" title="[link title]">추천순</a></li>
								<li><a href="#" title="[link title]">반대순</a></li>
								<li><a href="#" title="[link title]">최신순</a></li>
							</ul>
						</div>
					</div>

					<!-- Start sliderkit-panels -->
					<div class="sliderkit-panels">
						<div class="sliderkit-panel">
							<%
								try {
									Class.forName("com.mysql.jdbc.Driver");
									conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
									stmt = conn.createStatement();
									rs = stmt.executeQuery("SELECT * FROM topic ORDER BY pros DESC");
									while (rs.next()) {
							%>
							<div class="sub" id="<%=rs.getInt("id")%>">
								<a href="opinion.jsp?topic_id=<%=rs.getInt("id")%>"> 의견 나누기! </a>
								<p>
									<img src=<%= imgURL + rs.getString("photo") %> alt="사진">
									<span><%= rs.getString("content")%></span>
								</p>
							</div>
							<%
								}
								} catch (Exception e) {
									out.println(e.toString());
								} finally {
									stmt.close();
									rs.close();
								}
							%>
						</div>
						<div class="sliderkit-panel">
							<%
								try{
									stmt = conn.createStatement();
									rs = stmt.executeQuery("SELECT * FROM topic ORDER BY cons DESC");
									while (rs.next()) {
							%>
							<div class="sub" id="<%=rs.getInt("id")%>">
								<a href="opinion.jsp?topic_id=<%=rs.getInt("id")%>"> 의견 나누기! </a>
								<p>
									<img src=<%= imgURL + rs.getString("photo") %> alt="사진">
									<span><%= rs.getString("content")%></span>
								</p>
							</div>
							<%
								}
								} catch (Exception e) {
									out.println(e.toString());
								} finally {
									stmt.close();
									rs.close();
								}
							%>
						</div>
						<div class="sliderkit-panel">
							<%
								try{
									stmt = conn.createStatement();
									rs = stmt.executeQuery("SELECT * FROM topic ORDER BY date DESC");
									while (rs.next()) {
							%>
							<div class="sub" id="<%=rs.getInt("id")%>">
								<a href="opinion.jsp?topic_id=<%=rs.getInt("id")%>"> 의견 나누기! </a>
								<p>
									<img src=<%= imgURL + rs.getString("photo") %> alt="사진">
									<span><%= rs.getString("content")%></span>
								</p>
							</div>
							<%
								}
								} catch (Exception e) {
									out.println(e.toString());
								} finally {
									stmt.close();
									rs.close();
								}
							%>
						</div>
						<!-- // end of sliderkit-panel -->
						<script type="text/javascript">
							function lastPostFunc(){
								$.post("scroll.asp?action=getLastPost&lastID=" + $('.sub:last').attr('id'),
								function(data){
									if(data != " "){
										$('.sub:last').after(data);
									}
								});
							};
							$(function(){
								$(window).scroll(function(){	
									if($(window).scrollTop() == $(document).height() - $(window).height()){
										alert("hello");
										lastPostFunc();
									}
								});
							});
					
						</script>
					</div>
					<!-- // end of sliderkit-panels -->

				</div>
				<!-- // end of contentslider-std -->

			</div>
			<!-- // end of contetnt-->

		</div>
		<!-- // end of layout-1col -->

		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>

	</div>
	<!-- // end of wrap -->
</body>
</html>
