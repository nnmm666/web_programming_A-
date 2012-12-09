package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


@WebServlet("/KeywordSuggestServlet")
public class KeywordSuggestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public KeywordSuggestServlet() {
		super();
	}
	public static List<String> getKeyword() throws SQLException, NamingException {
		List<String> list = new ArrayList<String>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String dbUrl = "jdbc:mysql://localhost:3306/web2012";
		String dbUser = "web";
		String dbPassword = "asdf";
		String keywords="";

		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select keyword from keyword");
			
			while(rs.next()) {
				keywords = rs.getString("keyword");
				list.add(keywords);
			}
			
			stmt.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		return list;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");

		String query=request.getParameter("query");
		PrintWriter out=response.getWriter();
		List<String> keywordList = null;
		try {
			keywordList = getKeyword();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (query == null){
			out.println("<div>Cannot access</div>");

		}else{
			if(query.length() > 0){
				for( String keyword : keywordList ){
					if( keyword.contains(query)){	
						out.println("<li onclick=\"fill('"+keyword+"');\">"+keyword+"</li>"); 
					}
				}
			}	
		}
		out.close();
	}
}
