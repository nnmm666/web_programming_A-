<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.io.*" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>Let's Talk!!렛톡에 오신걸 환영합니다!!</title>
<!-- Site styles -->
<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
<script src='./javascript/jquery-1.8.2.min.js'></script>
<script src='./javascript/js-cumulus.js'></script>

<script type="text/javascript">
	//JSCumulus.noConflict();

	/* DEBUG */window.console && console.time && console.time("TagCloud1");

	/* TagCloud 1 */
	var tags = [
/*
			new Tag("JavaScript", {	color: "red"	}),																		// Color setting Example
			new Tag("Jeroen van Warmerdam", 60, "http://www.jeroenvanwarmerdam.nl"),		// link Example
			new Tag("이명박", 100, false),																							// Tag(name, weight, link, new window)
*/
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	
		Class.forName("com.mysql.jdbc.Driver");

		String dbUrl = "jdbc:mysql://localhost:3306/web2012";
		String dbUser = "root";
		String dbPassword = "32Armyband";
		
		String keyword;
		int weight;
		int id;
	
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.createStatement();
    	rs = stmt.executeQuery("select id, keyword, weight from keyword");
    	while(rs.next()) {
    		id = rs.getInt("id");
    		keyword = rs.getString("keyword");
    		weight = rs.getInt("weight");
    		out.println("new Tag(\"" + keyword + "\", " + weight + ", \"topic.jsp?id=" + id + "\"" +  "),");
    	}
    	
    	stmt.close();
    	rs.close();

	%>
	 ];
	var tagCloud1 = new TagCloud(tags, 440, 340);
	/* DEBUG */
	window.console && console.time && console.timeEnd("TagCloud1");
</script>
</head>

<body>
	<div id="wrap">
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

					<div id="tag_cloud">
						<div id="tagCloud1"></div>
						<script type="text/javascript">
							tagCloud1.Distribute(
									document.getElementById("tagCloud1"))
									.Animate();
						</script>
					</div>
					
					<div id="content_bottom">
						<a href="keyword.jsp" class="btn btn-mini" style="margin-right: 10px;">키워드추가</a>
						<a href="main..jsp" class="btn btn-mini">주제보기</a>
					</div>
				</div>
			</div>
		</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>

		<%
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
		    if (rs != null) try{rs.close();} catch(SQLException e) {}
		    if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		    if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		%>
</html>