package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.KeywordDAO;
import bean.Keyword;

@WebServlet("/keywordAddServlet")
public class keywordAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public keywordAddServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String keyword = request.getParameter("keyword");
		int weight = 0;
		String type = "";

		try{
			if(KeywordDAO.sendkeyword(new Keyword(keyword, weight, type))){
				response.getWriter().write("ok");
			}else {
				response.getWriter().write("메세지 전송에 실패했습니다..");
			}
		}catch(Exception e){
			response.getWriter().write(e.getMessage());

		}
	}

}


