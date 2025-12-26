package reservation.servlet.userservlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import reservation.dto.UserDTO;
import reservation.service.UserService;
import reservation.service.UserServiceImpl;

import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	UserService userService = new UserServiceImpl();
    public Login() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		UserDTO user = userService.selectById(id, pw);
		request.setAttribute("id", user);
		request.setAttribute("pw", user);
		request.getRequestDispatcher("/login/login_test.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDTO user = UserDTO.builder()
							.id(id)
							.password(pw)
							.build();
		
		UserDTO result = userService.selectById(id, pw);
		if (result == null) {
			response.sendRedirect("/login");
			return;
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("id", result.getId());
			session.setAttribute("pw", result.getPassword());
		}
		
		String root = request.getContextPath();
		response.sendRedirect("/main/main.html");
	}

}
