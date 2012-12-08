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

import DAO.userDAO;
import bean.User;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class userServlet
 */
@WebServlet("/userServlet")
public class userServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userServlet() {
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
		boolean result = false;
		request.setCharacterEncoding("utf-8");
		int size = 10 * 1024 * 1024;
		String uploadPath = getServletContext().getRealPath("./upload/user");
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size,"UTF-8", new DefaultFileRenamePolicy());  
		Enumeration files = multi.getFileNames();
		String file = (String)files.nextElement();

		String email = "";
		String nickname = "";
		String name = "";
		String password = ""; 
		String photo = "";
		
		email = multi.getParameter("email");
		nickname = multi.getParameter("nickname");
		name = multi.getParameter("name");
		password = multi.getParameter("password");
		photo = multi.getFilesystemName(file);
		
		try {
			result = userDAO.insert(email, nickname, name, password, photo);
			request.setAttribute("nickname", nickname);
			request.setAttribute("email", email);
			if(result) {
				actionUrl = "register.jsp";
			}
			else {
				actionUrl = "error.jsp";
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

}
