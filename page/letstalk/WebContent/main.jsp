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
	String imgURL="./upload/user/";
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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
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

<body>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle" class="inner layout-1col">
			<div id="content">
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
					<% int items = 20; %>
					<!-- Start sliderkit-panels -->
					<div class="sliderkit-panels">
						<div class="sliderkit-panel">
							<%	Class.forName("com.mysql.jdbc.Driver");
									conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
									stmt = conn.createStatement();
									rs = stmt.executeQuery("SELECT * FROM topic ORDER BY pros DESC LIMIT "+items);
									while (rs.next()) {
							%>
							<div class="sub" id="<%=rs.getInt("id")%>">
									<span><%= rs.getString("content")%></span>
									<img src=upload/topic/<%=rs.getString("photo")  %> alt="사진">
								<a href="opinion.jsp?topic_id=<%=rs.getInt("id")%>"> 토론하고싶어요(go!) ☞</a>
							</div>
							<%	}
									stmt.close();
									rs.close();
							%>
						</div>
						<div class="sliderkit-panel">
							<%	stmt = conn.createStatement();
									rs = stmt.executeQuery("SELECT * FROM topic ORDER BY cons DESC LIMIT " + items);
									while (rs.next()) {
							%>
							<div class="sub" id="<%=rs.getInt("id")%>">
									<span><%= rs.getString("content")%></span>
									<img src=upload/topic/<%=rs.getString("photo") %> alt="사진">
								<a href="opinion.jsp?topic_id=<%=rs.getInt("id")%>"> 토론하고싶어요(go!) ☞</a>
							</div>
							<%	}
									stmt.close();
									rs.close();
							%>
						</div>
						<div class="sliderkit-panel">
							<%	stmt = conn.createStatement();
									rs = stmt.executeQuery("SELECT * FROM topic ORDER BY date DESC LIMIT " + items);
									while (rs.next()) {
							%>
							<div class="sub" id="<%=rs.getInt("id")%>">
									<span><%= rs.getString("content")%></span>
									<img src=upload/topic/<%=rs.getString("photo")%> alt="사진">
								<a href="opinion.jsp?topic_id=<%=rs.getInt("id")%>"> 토론하고싶어요(go!) ☞</a>
							</div>
							<%	}
									stmt.close();
									rs.close();
							%>
						</div>
						<!-- // end of sliderkit-panel -->
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
</body>
</html>
