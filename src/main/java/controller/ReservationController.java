package controller;

import java.io.IOException;
import java.sql.Date;
import dto.ReservationDTO;
import service.ReservationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReservationController extends HttpServlet {

    private ReservationService service = new ReservationService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 폼 데이터 가져오기
        String userId = request.getParameter("userId");
        String store = request.getParameter("store");
        String designer = request.getParameter("designer");
        String reserveDateStr = request.getParameter("reserveDate");
        String reserveTime = request.getParameter("time");
        String[] servicesArr = request.getParameterValues("service");

        // null 또는 빈 값 체크
        if (userId == null || userId.isEmpty() ||
            store == null || store.isEmpty() ||
            designer == null || designer.isEmpty() ||
            reserveDateStr == null || reserveDateStr.isEmpty() ||
            reserveTime == null || reserveTime.isEmpty() ||
            servicesArr == null || servicesArr.length == 0) {

            request.setAttribute("msg", "❌ 예약 정보가 올바르지 않습니다.");
            request.getRequestDispatcher("/reserve.jsp").forward(request, response);
            return;
        }

        // java.sql.Date로 변환
        Date reserveDate = Date.valueOf(reserveDateStr);

        // 체크박스 배열을 문자열로 변환
        String services = String.join(",", servicesArr);

        // DTO 생성
        ReservationDTO reservation = new ReservationDTO();
        reservation.setUserId(userId);
        reservation.setStore(store);
        reservation.setDesigner(designer);
        reservation.setReserveDate(reserveDate);
        reservation.setReserveTime(reserveTime);
        reservation.setServices(services);

        // Service 호출
        boolean result = service.addReservation(reservation);

        // 메시지 설정
        if(result) {
            request.setAttribute("msg", "✅ 예약이 완료되었습니다!");
        } else {
            request.setAttribute("msg", "❌ 예약에 실패했습니다. 다시 시도해주세요.");
        }

        // 같은 예약 페이지로 이동
        request.getRequestDispatcher("/reserve.jsp").forward(request, response);
    }
}
