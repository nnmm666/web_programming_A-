package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
//				String nickname = (String) session.getAttribute("user.nickname");
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
