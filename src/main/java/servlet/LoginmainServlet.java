package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/loginmain")
public class LoginmainServlet extends HttpServlet {

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String type = request.getParameter("type");

    if ("owner".equals(type)) {
      request.getRequestDispatcher("/ownerLogin.jsp").forward(request, response);
    } else {
      request.getRequestDispatcher("/userLogin.jsp").forward(request, response);
    }
  }
}