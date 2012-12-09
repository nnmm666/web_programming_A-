package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.KeywordDAO;


@WebServlet("/KeywordSuggestServlet")
public class KeywordSuggestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public KeywordSuggestServlet() {
		super();
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");

		String query=request.getParameter("query");
		PrintWriter out=response.getWriter();
		List<String> keywordList = null;
		try {
			keywordList = KeywordDAO.getKeyword();
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
