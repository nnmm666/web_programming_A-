package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Reply;
import bean.User;

import DAO.OpinionDAO;
import DAO.ReplyDAO;
import DAO.TopicDAO;

@WebServlet("/replyServlet")
public class replyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public replyServlet() {
		super();
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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		String actionUrl = "";
		
		try {
			if (op.equals("delete")){
				boolean ret;

				int id = getIntFromParameter(request.getParameter("id"), 0);
				int opinion_id = ReplyDAO.findById(id).getOpinion_id();
				int topic_id = OpinionDAO.findById(opinion_id).getTopic_id();
				
				ret = ReplyDAO.remove(id);
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);

		int opinion_id = pageServlet.getIntFromParameter(request.getParameter("opinion_id"), 0);
		User user = (User) session.getAttribute("user");
		String writer = user.getNickname();
		String content = request.getParameter("content");

		try{
			if(ReplyDAO.sendreply(new Reply(opinion_id, content, writer))){
				response.getWriter().write("ok");
			}else {
				response.getWriter().write("메세지 전송에 실패했습니다..");
			}
		}catch(Exception e){
			response.getWriter().write(e.getMessage());

		}
	}

}
