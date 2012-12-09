<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
<!-- Site styles -->
<link rel="stylesheet" type="text/css" href="stylesheets/index.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="content">
		<div id="write">
	<%int keyword_id = (Integer.parseInt(request.getParameter("keyword_id")));

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String dbUrl = "jdbc:mysql://localhost:3306/web2012?useUnicode=true& useUnicode=true&characterEncoding=euc_kr";
		String dbUser = "web";
		String dbPassword = "asdf";

		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPassword);

			stmt=conn.prepareStatement("select keyword from keyword where id=?");
			
			stmt.setInt(1,keyword_id);
			rs=stmt.executeQuery();
			
	%>
		
			<c:if test="${sessionScope.user.nickname == null }">
				<script>
					$(function(){
						alert("글쓰기는 로그인 후 작성 가능합니다.");
						location='topic.jsp?keyword_id=' + ${keyword_id };
					});
				</script>
			</c:if>

			<form action="topicServlet" class="form-horizontal" enctype ="multipart/form-data"  method ="POST" >
				<fieldset>
					<div id="legend" class="">
						<legend class="">당신의 생각을 넓혀드립니다 :-) </legend>
					</div>
					<div id="section">
					<div class="control-group">
							<!-- Text input-->
							<% while(rs.next()){ %>
							<label class="control-label" for="keyword">무엇에 대해서?</label>
							<div class="controls" id="keyword"><%=rs.getString("keyword") %>
							</div>
						</div>
						<%	}
							}catch(Exception e){ e.printStackTrace();
							}finally{
    							if(conn!=null)conn.close(); 
    							if(stmt!=null)stmt.close();
    							if(rs!=null)rs.close();
    						} %>

						<div class="control-group">
							<!-- Text input-->
							<label class="control-label" for="user">나의 이름은</label>
							<div class="controls" id="user_name">
								${sessionScope.user.nickname }</div>
						</div>
						
						<div class="control-group">
							<!-- Textarea -->
							<label class="control-label" for="context">토론 주제</label>
							<div class="controls">
								<div class="textarea">
									<textarea name="content"  placeholder="선택하신 키워드와 관련된 토론 주제를 적어주세요!"></textarea>
								</div>
							</div>
						</div>
						
						<div class="control-group">
							<!-- File Upload -->		
								<label class="control-label">첨부하기</label>
							<div class="controls">
								<input class="input-file" id="fileInput" type="file" name="photo">
							</div>
						</div>
					</div>
				</fieldset>
				
				<input type="hidden" name="keyword_id" value="<%=request.getParameter("keyword_id") %>">
				<input type="hidden" name="op" value="write">
				<input type="hidden" name="writer" value="${sessionScope.user.nickname }">
				<input style="width:70px; height:25px;" type="submit" value="Lets Talk!">
				<input style="width:70px; height:25px;" type="reset" value="재작성">
			</form>	

		</div>
	</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
</html>