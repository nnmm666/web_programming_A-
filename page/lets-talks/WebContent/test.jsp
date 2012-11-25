<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
		<!-- Site styles -->
		<link rel="stylesheet" type="text/css" href="stylesheets/index.css"/>
		<link rel="stylesheet" type="text/css" href="stylesheets/test.css"/>
</head>
<body>
<div id="wrap">
		<div id="top">
				<jsp:include page="share/header.jsp" />
		</div>
		<div id="content">
				
		  
		  <form class="form-horizontal">
		    <fieldset>
		      <div id="legend" class="">
		        <legend class="">Form Name</legend>
		      </div>
		
		    <div class="control-group">
		
		          <!-- Text input-->
		          <label class="control-label" for="input01">작성자</label>
		          <div class="controls">
		            <input type="text" placeholder="placeholder" class="input-xlarge">
		            <p class="help-block">Supporting help text</p>
		          </div>
		        </div><div class="control-group">
		          <label class="control-label">첨부하기</label>
			
		          <!-- Text input-->
		          <label class="control-label" for="input01">제목</label>
		          <div class="controls">
		            <input type="text" placeholder="placeholder" class="input-xlarge">
		            <p class="help-block">Supporting help text</p>
		          </div>
		        </div><div class="control-group">
		
		          <!-- Textarea -->
		          <label class="control-label">내용</label>
		          <div class="controls">
		            <div class="textarea">
		                  <textarea rows="10" cols="100"  class=""> </textarea>
		            </div>
		          </div>
		          
		        	<!-- File Upload -->
		          <div class="controls">
		            <input class="input-file" id="fileInput" type="file">
		          </div>
		        </div><div class="control-group">
		        </div>
		
		    
		    </fieldset>
		    	<input type="submit" value="올리기">
		    	<input type="reset" value="다시">
		  </form>

		</div>
		<div id="bottom">
					<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
</html>