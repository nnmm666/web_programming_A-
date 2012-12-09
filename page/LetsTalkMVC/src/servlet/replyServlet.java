package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Reply;
import bean.User;

import DAO.ReplyDAO;

@WebServlet("/replyServlet")
public class replyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public replyServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
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
