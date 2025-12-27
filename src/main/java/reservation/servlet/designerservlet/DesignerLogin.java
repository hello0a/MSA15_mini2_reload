package reservation.servlet.designerservlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import reservation.dto.DesignerDTO;
import reservation.dto.UserDTO;
import reservation.service.DesignerService;
import reservation.service.DesignerServiceImpl;
import reservation.service.UserService;
import reservation.service.UserServiceImpl;

import java.io.IOException;

@WebServlet("/designer/login")
public class DesignerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	DesignerService designerService = new DesignerServiceImpl();
    public DesignerLogin() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.getRequestDispatcher("/login/designer_login_test.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
				
		DesignerDTO result = designerService.selectById(id, pw);
		if (result == null) {
			response.sendRedirect("/designer/login");
			return;
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("id", result.getId());
			session.setAttribute("pw", result.getPassword());
		}
		
		response.sendRedirect("/main/");
	}

}
