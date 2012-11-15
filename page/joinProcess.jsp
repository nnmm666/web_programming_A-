<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import = "java.sql.*"%>

<%
	String name = request.getParameter("name");
	String id   = request.getParameter("id");
	String pwd  = request.getParameter("pwd");
	String email = request.getParameter("email");
	int country = Integer.parseInt(request.getParameter("country"));
	int gender = Integer.parseInt(request.getParameter("gender"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs   = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/park";
	String dbUser = "park";
	String dbPassword = "123456";
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
			pstmt = conn.prepareStatement("INSERT INTO user(name, id, password, email, country, gender) values(?, ?, ?, ?, ?, ?)");
	
			pstmt.setString(1, name);
			pstmt.setString(2 ,id);
			pstmt.setString(3 ,pwd);
			pstmt.setString(4 ,email);
			pstmt.setInt(5 ,country);
			pstmt.setInt(6 ,gender);
			int result = pstmt.executeUpdate();
			/*if(result!=0)
			{
				out.println("<script>");
				out.println("location.href = 'loginPage.html'");
				out.println("</script>");
			}
			else
			{

				out.println("<script>");
				out.println("location.href = 'index.html'");
				out.println("</script>");
			}
*/		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
}

	%>