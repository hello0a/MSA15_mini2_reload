package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import dto.ReservationDTO;
import service.ReservationService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reserve")
public class ReserveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationService service = new ReservationService();

    // GET: 예약 페이지 호출 + 예약 가능한 시간 조회
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String store = request.getParameter("store");
        String designer = request.getParameter("designer");
        String reserveDateStr = request.getParameter("reserveDate");

        request.setAttribute("selectedStore", store);
        request.setAttribute("selectedDesigner", designer);

        if(store != null && designer != null && reserveDateStr != null && !reserveDateStr.isEmpty()) {
            Date reserveDate = Date.valueOf(reserveDateStr);
            List<String> availableTimes = service.getAvailableTimes(store, designer, reserveDate);
            request.setAttribute("availableTimes", availableTimes);
        }

        request.getRequestDispatcher("/reserve.jsp").forward(request, response);
    }

    // POST: 예약 등록
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String userId = (String) request.getSession().getAttribute("userId");
        String store = request.getParameter("store");
        String designer = request.getParameter("designer");
        String reserveDateStr = request.getParameter("reserveDate");
        String reserveTime = request.getParameter("time");
        String[] servicesArr = request.getParameterValues("service");

        if(userId == null || store == null || designer == null || reserveDateStr == null || reserveTime == null) {
            request.setAttribute("msg", "예약 정보가 올바르지 않습니다.");
            request.getRequestDispatcher("/reserve.jsp").forward(request, response);
            return;
        }

        Date reserveDate = Date.valueOf(reserveDateStr);
        String services = (servicesArr != null) ? String.join(" + ", servicesArr) : "선택 없음";

        ReservationDTO reservation = new ReservationDTO();
        reservation.setUserId(userId);
        reservation.setStore(store);
        reservation.setDesigner(designer);
        reservation.setReserveDate(reserveDate);
        reservation.setReserveTime(reserveTime);
        reservation.setServices(services);

        boolean success = service.addReservation(reservation);

        request.setAttribute("msg", success ? "예약이 정상적으로 완료되었습니다." : "예약 실패! 다시 시도해주세요.");
        request.getRequestDispatcher("/reserveFinish.jsp").forward(request, response);
    }
}
