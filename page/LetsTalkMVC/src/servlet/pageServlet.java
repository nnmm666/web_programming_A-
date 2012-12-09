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
import javax.servlet.http.HttpSession;

import DAO.KeywordDAO;
import DAO.OpinionDAO;
import DAO.TopicDAO;
import DAO.userDAO;
import bean.Keyword;
import bean.Opinion;
import bean.PageResult;
import bean.Topic;
import bean.User;

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

	public static int getIntFromParameter(String str, int defaultValue) {
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
				int keyword_id = getIntFromParameter(request.getParameter("keyword_id"), 0);
				PageResult<Topic> topics = TopicDAO.getTopicPage(page, keyword_id);
				Keyword keyword = KeywordDAO.findById(keyword_id);
				request.setAttribute("topics", topics);
				request.setAttribute("page", page);
				request.setAttribute("keyword", keyword);
				actionUrl = "topic.jsp";
				
			} else if(op.equals("opinion")) {
				int topic_id = getIntFromParameter(request.getParameter("topic_id"), 0);
				String align = request.getParameter("align");
				Topic topic = TopicDAO.findById(topic_id);
				Keyword keyword = KeywordDAO.findById(topic.getKeyword_id());
				List<Opinion> opinions = OpinionDAO.getOpinions(topic_id, align);
				
				request.setAttribute("topic", topic);
				request.setAttribute("keyword", keyword);
				request.setAttribute("opinions", opinions);
				
				actionUrl = "opinion.jsp";
				
			}else if (op.equals("delete")){
				boolean ret;

				int id = getIntFromParameter(request.getParameter("id"), 0);
				int topic_id = OpinionDAO.findById(id).getTopic_id();
				ret = OpinionDAO.remove(id);
				request.setAttribute("result", ret);
				if(ret){
					request.setAttribute("errorMsg", "사용자 정보가 삭제되었습니다.");
					actionUrl = "pageServlet?op=opinion&topic_id=" + topic_id;
				}else{
					request.setAttribute("errorMsg", "사용자 정보 삭제에 실패했습니다.");
					actionUrl = "error.jsp";
				}
			}
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
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
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
			
		int topic_id = getIntFromParameter(request.getParameter("topic_id"), 0);
		
		User user = (User) session.getAttribute("user");
		String writer = user.getNickname();
		String content = request.getParameter("content");
		String position = request.getParameter("position");
	
		try{
			if(OpinionDAO.sendOpinion(new Opinion(topic_id, content, writer, position))){
				response.getWriter().write("ok");
			}else {
				response.getWriter().write("메세지 전송에 실패했습니다..");
			}
		}catch(Exception e){
			response.getWriter().write(e.getMessage());

		}
	}

}
