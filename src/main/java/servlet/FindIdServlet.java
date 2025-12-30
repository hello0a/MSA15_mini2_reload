package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/findId")
public class FindIdServlet extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String email = request.getParameter("email");

    // 테스트용
    if ("홍길동".equals(name) && "test@test.com".equals(email)) {
      request.setAttribute("foundId", "hong123");
    } else {
      request.setAttribute("error", "일치하는 회원 정보가 없습니다");
    }

    request.getRequestDispatcher("id_find.jsp").forward(request, response);
  }
}
