package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Keyword;
import bean.Opinion;
import bean.PageResult;
import bean.Topic;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.KeywordDAO;
import DAO.OpinionDAO;
import DAO.TopicDAO;

/**
 * Servlet implementation class topicServlet
 */
@WebServlet("/topicServlet")
public class topicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public topicServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
				int keyword_id = TopicDAO.findById(id).getKeyword_id();
				ret = TopicDAO.remove(id);
				request.setAttribute("result", ret);
				if(ret){
					request.setAttribute("errorMsg", "사용자 정보가 삭제되었습니다.");
					actionUrl = "pageServlet?op=index";
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
		String actionUrl = "";
		String errorMsg = "";
		String file = "";
		request.setCharacterEncoding("utf-8");
		boolean result = false;
		int size = 10 * 1024 * 1024;
		String uploadPath = getServletContext().getRealPath("./upload/topic");
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size,"UTF-8", new DefaultFileRenamePolicy()); 
		
		Enumeration files = multi.getFileNames();
		
		if(files.hasMoreElements()) {
			file = (String)files.nextElement();
		} 
		String op = multi.getParameter("op");

		try {
			if(op.equals("write")) {

				int keyword_id = Integer.parseInt(multi.getParameter("keyword_id"));
				String nickname = multi.getParameter("writer");
				String content = multi.getParameter("content");
				String photo = multi.getFilesystemName(file);

				result = TopicDAO.insert(keyword_id, nickname, content, photo);

				actionUrl = "pageServlet?op=topic&keyword_id=" + keyword_id;


				response.sendRedirect(actionUrl);

			}
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
