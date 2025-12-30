package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reserveFinish")
public class ReserveFinishServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 1️ 폼 데이터 가져오기
        String reserveDate = request.getParameter("reserveDate");
        String reserveTime = request.getParameter("time");
        String[] services = request.getParameterValues("service");

        // 2️ 서비스 문자열 합치기
        String servicesStr = (services != null) ? String.join(" + ", services) : "선택 없음";
        String reserveDateTime = reserveDate + " " + reserveTime;

        // 3️ 디자이너/예약 정보 (예시)
        String designerName = "김조은";
        String designerCareer = "헤어 전문가, 경력 5년";
        String designerImg = "img/1.jpg";
        String address = "인천광역시 부평구 부평동 123";

        // 4️ JSP로 전달
        request.setAttribute("designerName", designerName);
        request.setAttribute("designerCareer", designerCareer);
        request.setAttribute("designerImg", designerImg);
        request.setAttribute("address", address);
        request.setAttribute("services", servicesStr);
        request.setAttribute("reserveDateTime", reserveDateTime);

        // 5️ 예약 완료 JSP로 포워드
        request.getRequestDispatcher("/reserveFinish.jsp").forward(request, response);
    }
}
