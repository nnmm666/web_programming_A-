package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String likehate = request.getParameter("likehate");

		try {
			if(likehate.equals("likes")) {
				OpinionDAO.sendlikehate(likehate);
			}else if(likehate.equals("like")) {
				OpinionDAO.sendlikehate(likehate);
			}else if(likehate.equals("hates")) {
				OpinionDAO.sendlikehate(likehate);
			}else if(likehate.equals("hate")) {
				OpinionDAO.sendlikehate(likehate);
			}
		}catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

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
