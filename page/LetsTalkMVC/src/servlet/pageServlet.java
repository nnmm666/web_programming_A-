package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.KeywordDAO;
import DAO.TopicDAO;
import bean.Keyword;
import bean.PageResult;
import bean.Topic;

/**
 * Servlet implementation class pageServlet
 */
@WebServlet("/pageServlet")
public class pageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	private int getIntFromParameter(String str, int defaultValue) {
		int id;
		
		try {
			id = Integer.parseInt(str);
		} catch (Exception e) {
			id = defaultValue;
		}
		return id;
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		String actionUrl = "";
		
		try {
			if(op == null || op.equals("index")) {
				List<Keyword> keywords = KeywordDAO.getKeywords();
				request.setAttribute("keywords", keywords);
				actionUrl = "index.jsp";
				
			} else if(op.equals("topic")) {
				int page = getIntFromParameter(request.getParameter("page"), 1);
				int keyword_id = getIntFromParameter(request.getParameter("keyword_id"), 1);
				PageResult<Topic> topics = TopicDAO.getTopicPage(page, keyword_id);
				Keyword keyword = KeywordDAO.findById(keyword_id);
				request.setAttribute("topics", topics);
				request.setAttribute("page", page);
				request.setAttribute("keyword", keyword);
				actionUrl = "topic.jsp";
			}
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
