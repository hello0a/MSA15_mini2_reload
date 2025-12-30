package service;

import dao.ReservationDAO;
import dto.ReservationDTO;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class ReservationService {

    private ReservationDAO dao = new ReservationDAO();

    public boolean addReservation(ReservationDTO reservation) {
        return dao.insertReservation(reservation) > 0;
    }

    public List<ReservationDTO> getReservations(String userId) {
        List<ReservationDTO> list = dao.selectReservationsByUser(userId);
        return list != null ? list : new ArrayList<>();
    }

    public boolean updateReservation(ReservationDTO reservation) {
        return dao.updateReservation(reservation) > 0;
    }

    public boolean deleteReservation(int reservationId) {
        return dao.deleteReservation(reservationId) > 0;
    }

    // 예약 가능한 시간 조회
    public List<String> getAvailableTimes(String store, String designer, Date reserveDate) {
        List<String> times = dao.getAvailableTimes(store, designer, reserveDate);
        return times != null ? times : new ArrayList<>();
    }
}
