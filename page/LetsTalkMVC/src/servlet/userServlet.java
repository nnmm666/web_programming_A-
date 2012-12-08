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
		String errorMsg = "";
		String file = "";
		request.setCharacterEncoding("utf-8");
		boolean result = false;
		int size = 10 * 1024 * 1024;
		String uploadPath = getServletContext().getRealPath("./upload/user");
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size,"UTF-8", new DefaultFileRenamePolicy());  
		Enumeration files = multi.getFileNames();
		if(files.hasMoreElements()) {
			file = (String)files.nextElement();
		} 
		String op = multi.getParameter("op");
		
		try {
			if(op == null) {
				errorMsg = "명령오류";
				request.setAttribute("errorMsg", errorMsg);
				actionUrl = "error.jsp";
			} else if(op.equals("register")) {
		
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
		
		
				result = userDAO.insert(email, nickname, name, password, photo);
				request.setAttribute("nickname", nickname);
				request.setAttribute("email", email);
				if(result) {
					actionUrl = "register.jsp";
				}
				else {
					errorMsg = "등록에 실패하였습니다.";
					request.setAttribute("errorMsg", errorMsg);
					actionUrl = "error.jsp";
				}
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
				dispatcher.forward(request, response);
				
			} else if(op.equals("login")) {
				String inputEmail = multi.getParameter("inputemail");
				String inputPwd = multi.getParameter("inputpwd");
				
				User user = userDAO.findById(inputEmail);
				
				if(user.getPassword().equals(inputPwd)) {
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					
					actionUrl = "pageServlet";
					response.sendRedirect(actionUrl);
				} else {
					errorMsg = "비밀번호가 틀렸습니다.";
					request.setAttribute("errorMsg", errorMsg);
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
	}

}
