package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.OpinionDAO;
import bean.Opinion;

@WebServlet("/likehateServlet")
public class likehateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public likehateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
	
	}

}
