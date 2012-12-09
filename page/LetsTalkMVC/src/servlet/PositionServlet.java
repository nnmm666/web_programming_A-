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
import DAO.OpinionDAO;
import DAO.TopicDAO;
import bean.Keyword;
import bean.Opinion;
import bean.PageResult;
import bean.Topic;

@WebServlet("/PositionServlet")
public class PositionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PositionServlet() {
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
		request.setCharacterEncoding("UTF-8");
		String actionUrl = "";

		String likehate = request.getParameter("likehate");
		int opinion_id = getIntFromParameter(request.getParameter("opinion_id"), 0);
		int topic_id = getIntFromParameter(request.getParameter("topic_id"), 0);
		
		try {
			if(likehate.equals("likes")) {
				OpinionDAO.sendlikehate(likehate,topic_id, opinion_id);
				actionUrl = "pageServlet?op=opinion&topic_id=" + topic_id;
			}else if(likehate.equals("like")) {
				OpinionDAO.sendlikehate(likehate,topic_id, opinion_id);
				actionUrl = "pageServlet?op=opinion&topic_id=" + topic_id;
			}else if(likehate.equals("hates")) {
				OpinionDAO.sendlikehate(likehate,topic_id, opinion_id);
				actionUrl = "pageServlet?op=opinion&topic_id=" + topic_id;
			}else if(likehate.equals("hate")) {
				OpinionDAO.sendlikehate(likehate,topic_id, opinion_id);
				actionUrl = "pageServlet?op=opinion&topic_id=" + topic_id;
			}
		}catch (NamingException e) {
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
		/*
		request.setCharacterEncoding("UTF-8");

		String position = request.getParameter("likehate");

		try{
			if(OpinionDAO.sendlikehate(new Opinion(position))){
				response.getWriter().write("ok");
			}else {
				response.getWriter().write("메세지 전송에 실패했습니다..");
			}
		}catch(Exception e){
			response.getWriter().write(e.getMessage());

		}
		 */
	}


}
