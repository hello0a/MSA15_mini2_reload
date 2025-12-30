package dto;

import java.sql.Date;

public class ReservationDTO {

    private int reservationId;       // 예약 고유 ID (DB PK)
    private String userId;           // 예약한 사용자 ID
    private String store;            // 매장
    private String designer;         // 디자이너
    private Date reserveDate;        // 예약 날짜
    private String reserveTime;      // 예약 시간
    private String services;         // 선택한 시술 (컷, 펌, 염색 등)

    // 기본 생성자
    public ReservationDTO() {}

    // 전체 생성자 (선택)
    public ReservationDTO(int reservationId, String userId, String store, String designer,
                          Date reserveDate, String reserveTime, String services) {
        this.reservationId = reservationId;
        this.userId = userId;
        this.store = store;
        this.designer = designer;
        this.reserveDate = reserveDate;
        this.reserveTime = reserveTime;
        this.services = services;
    }

    // Getter / Setter
    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getStore() {
        return store;
    }

    public void setStore(String store) {
        this.store = store;
    }

    public String getDesigner() {
        return designer;
    }

    public void setDesigner(String designer) {
        this.designer = designer;
    }

    public Date getReserveDate() {
        return reserveDate;
    }

    public void setReserveDate(Date reserveDate) {
        this.reserveDate = reserveDate;
    }

    public String getReserveTime() {
        return reserveTime;
    }

    public void setReserveTime(String reserveTime) {
        this.reserveTime = reserveTime;
    }

    public String getServices() {
        return services;
    }

    public void setServices(String services) {
        this.services = services;
    }

    @Override
    public String toString() {
        return "ReservationDTO [reservationId=" + reservationId + ", userId=" + userId + ", store=" + store
                + ", designer=" + designer + ", reserveDate=" + reserveDate + ", reserveTime=" + reserveTime
                + ", services=" + services + "]";
    }
}
