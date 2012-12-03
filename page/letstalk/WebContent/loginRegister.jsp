<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*" 
    import="com.oreilly.servlet.MultipartRequest"
    import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
	
<%

    String uploadPath = request.getRealPath("upload");
	
    int size = 10 * 1024 * 1024;
    
    String name         = "";
    String email 		= "";
    String password  	= "";
    String password_confirm = "";
    String photoname 	= "";
    String fileName     = "";
    String origFileName = "";
    
    try{
        MultipartRequest multi = new MultipartRequest(request,
                uploadPath,size,"euc-kr",new DefaultFileRenamePolicy());  //COS라이브러리가 제공하는 업로드 클레스이다.
               //DefaultFileRenamePolicy()메서드는 파일이름이 중복될경우 test1과 같이 파일 이름을 rename해주는 역할을 한다.
    
                
        email = new String(multi.getParameter("email").getBytes("euc-kr"), "utf-8");
        name = new String(multi.getParameter("name").getBytes("euc-kr"), "utf-8");
        password =new String( multi.getParameter("password").getBytes("euc-kr"), "utf-8");
        password_confirm =new String( multi.getParameter("password_confirm").getBytes("euc-kr"), "utf-8");
        photoname = new String(multi.getParameter("photoname").getBytes("euc-kr"), "utf-8");
        
        
        Enumeration files = multi.getFileNames();  //전송된 파일 타입의 파라미터 이름들을 Enumeration타입으로 반환한다.        
        String file = (String)files.nextElement();
        fileName =new String( multi.getFilesystemName(file).getBytes("utf-8"),"euc-kr");
        origFileName = new String(multi.getOriginalFileName(file).getBytes("utf-8"),"euc-kr");
        
        
    }catch(Exception e){
        e.printStackTrace();
    }
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2012";
	String dbUser = "web";
	String dbPassword = "asdf";
		
	List<String> errorMsg = new ArrayList<String>();
	int result = 0;

	if (email == null || email.trim().length()<0) {
		errorMsg.add("E-mail을 반드시 입력해주세요.");
	}
	if (name == null || name.trim().length()<0) {
		errorMsg.add("이름을 반드시 입력해주세요.");
	}
	if (password==null || password.trim().length()<=6) {
		errorMsg.add("비밀번호는 6자 이상 입력해주세요.");
	}
	if (!password.equals(password_confirm)) {
		errorMsg.add("비밀번호가 일치하지 않습니다.");
		
	}
	

	if (errorMsg.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser,
					dbPassword);
			stmt = conn
					.prepareStatement("INSERT INTO users (email,name,password,photo)"
							+ "VALUES(?,?,?,?)");

			stmt.setString(1, email);
			stmt.setString(2, name);
			stmt.setString(3, password);
			stmt.setString(4, photoname);

			result = stmt.executeUpdate();
				if (result != 1) {
					errorMsg.add("등록에 실패하였습니다.");
				}
		} catch (SQLException e) {
			errorMsg.add("SQL에러:" + e.getMessage());
		} finally {
			stmt.close();
			conn.close();
			}
	}
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>Let's Talk!! 렛톡에 오신걸 환영합니다!!</title>
<link href="stylesheets/loginPage.css" rel="stylesheet" type="text/css">
<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
			<div id="header">
				<div id="logo">
					<a href="index.jsp">Let's Talk!!</a>
				</div>
			</div>
		</div>
		<div id="middle">
			<div id="content">
				<div class="container">
					<%
						if (errorMsg.size() > 0) {
					%>
					<div class="alert">
						<b>Error:</b>
						<%
							for (String msg : errorMsg) {
						%>
						<%=msg%>
						<%
							}
						%>
					</div>
					<div class="form-action">
						<a onclick="history.back();" class="btn">뒤로 돌아가기</a>
					</div>
					<%
						} else if (result == 1) {
					%>
					<div class="alert">
						<b><%=name%></b>님 등록해주셔서 감사합니다.
					
					
					</div>
					<div class="form-action">
						<a href="index.jsp" class="btn">토론하러가기</a>
					</div>
					<%
						}
					%>
				</div>
			</div>
		</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>

</body>
</html>