package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import dto.ReservationDTO;
import util.DBUtil;

public class ReservationDAO {

    // 예약 추가
    public int insertReservation(ReservationDTO reservation) {
        String sql = "INSERT INTO reservation (user_id, store, designer, reserve_date, reserve_time, services) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, reservation.getUserId());
            ps.setString(2, reservation.getStore());
            ps.setString(3, reservation.getDesigner());
            ps.setDate(4, reservation.getReserveDate());
            ps.setString(5, reservation.getReserveTime());
            ps.setString(6, reservation.getServices());

            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 예약 조회 (userId 기준)
    public List<ReservationDTO> selectReservationsByUser(String userId) {
        List<ReservationDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM reservation WHERE user_id=? ORDER BY reserve_date, reserve_time";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                ReservationDTO r = new ReservationDTO();
                r.setReservationId(rs.getInt("reservation_id"));
                r.setUserId(rs.getString("user_id"));
                r.setStore(rs.getString("store"));
                r.setDesigner(rs.getString("designer"));
                r.setReserveDate(rs.getDate("reserve_date"));
                r.setReserveTime(rs.getString("reserve_time"));
                r.setServices(rs.getString("services"));
                list.add(r);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 예약 수정
    public int updateReservation(ReservationDTO reservation) {
        String sql = "UPDATE reservation SET reserve_date=?, reserve_time=?, services=? WHERE reservation_id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setDate(1, reservation.getReserveDate());
            ps.setString(2, reservation.getReserveTime());
            ps.setString(3, reservation.getServices());
            ps.setInt(4, reservation.getReservationId());

            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 예약 삭제
    public int deleteReservation(int reservationId) {
        String sql = "DELETE FROM reservation WHERE reservation_id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, reservationId);
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 예약 가능한 시간 조회
    public List<String> getAvailableTimes(String store, String designer, Date reserveDate) {
        List<String> times = new ArrayList<>();
        String[] allTimes = {"10:00","12:00","14:00","16:00","18:00","20:00","22:00"};

        String sql = "SELECT reserve_time FROM reservation WHERE store=? AND designer=? AND reserve_date=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, store);
            ps.setString(2, designer);
            ps.setDate(3, reserveDate);

            ResultSet rs = ps.executeQuery();
            List<String> reservedTimes = new ArrayList<>();
            while(rs.next()) {
                reservedTimes.add(rs.getString("reserve_time"));
            }

            for(String t : allTimes) {
                if(!reservedTimes.contains(t)) {
                    times.add(t);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return times;
    }
}
