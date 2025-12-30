package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 예시용
    private final String USER_ID = "user123";
    private final String USER_PW = "userpass";
    private final String OWNER_ID = "owner123";
    private final String OWNER_PW = "ownerpass";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 1️ form 데이터 받기
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String type = request.getParameter("type"); // user or owner

        boolean loginSuccess = false;

        // 2️ 로그인 검증
        if ("user".equals(type)) {
            if (USER_ID.equals(id) && USER_PW.equals(pw)) {
                loginSuccess = true;
            }
        } else if ("owner".equals(type)) {
            if (OWNER_ID.equals(id) && OWNER_PW.equals(pw)) {
                loginSuccess = true;
            }
        }

        // 3️ 로그인 성공/실패 처리
        if (loginSuccess) {
            HttpSession session = request.getSession();
            session.setAttribute("loginId", id);
            session.setAttribute("loginType", type);

            // 회원/직원별 메인 페이지로 이동
            if ("user".equals(type)) {
                response.sendRedirect(request.getContextPath() + "");
            } else {
                response.sendRedirect(request.getContextPath() + "");
            }
        } else {
            // 로그인 실패 → login.jsp로 error 메시지 전달
            request.setAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            request.getRequestDispatcher("/login.jsp?type=" + type).forward(request, response);
        }
    }
}
