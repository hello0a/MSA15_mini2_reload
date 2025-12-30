package board.DTO;

import java.sql.Date;

public class ReviewDTO {
    
    private int review_id;           // 리뷰 ID (PK)
    private String user_id;          // 사용자 ID
    private String user_name;        // 사용자 이름 (예: 예진0928)
    private String user_handle;      // 사용자 핸들 (예: @YJ0928)
    private String user_avatar;      // 사용자 프로필 이미지
    private String designer_name;    // 디자이너 이름
    private String review_text;      // 리뷰 내용
    private String review_image;     // 리뷰 이미지 경로
    private Date review_date;        // 리뷰 작성일
    private int help_count;          // 도움이 됐어요 카운트
    private boolean receipt_verified; // 영수증 인증 여부
    
    // 기본 생성자
    public ReviewDTO() {
        this.help_count = 0;
        this.receipt_verified = true;
    }
    
    // 전체 생성자
    public ReviewDTO(int review_id, String user_id, String user_name, String user_handle, 
                     String user_avatar, String designer_name, String review_text, 
                     String review_image, Date review_date, int help_count, boolean receipt_verified) {
        this.review_id = review_id;
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_handle = user_handle;
        this.user_avatar = user_avatar;
        this.designer_name = designer_name;
        this.review_text = review_text;
        this.review_image = review_image;
        this.review_date = review_date;
        this.help_count = help_count;
        this.receipt_verified = receipt_verified;
    }
    
    // Getter & Setter
    public int getReview_id() {
        return review_id;
    }
    
    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }
    
    public String getUser_id() {
        return user_id;
    }
    
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    
    public String getUser_name() {
        return user_name;
    }
    
    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    
    public String getUser_handle() {
        return user_handle;
    }
    
    public void setUser_handle(String user_handle) {
        this.user_handle = user_handle;
    }
    
    public String getUser_avatar() {
        return user_avatar;
    }
    
    public void setUser_avatar(String user_avatar) {
        this.user_avatar = user_avatar;
    }
    
    public String getDesigner_name() {
        return designer_name;
    }
    
    public void setDesigner_name(String designer_name) {
        this.designer_name = designer_name;
    }
    
    public String getReview_text() {
        return review_text;
    }
    
    public void setReview_text(String review_text) {
        this.review_text = review_text;
    }
    
    public String getReview_image() {
        return review_image;
    }
    
    public void setReview_image(String review_image) {
        this.review_image = review_image;
    }
    
    public Date getReview_date() {
        return review_date;
    }
    
    public void setReview_date(Date review_date) {
        this.review_date = review_date;
    }
    
    public int getHelp_count() {
        return help_count;
    }
    
    public void setHelp_count(int help_count) {
        this.help_count = help_count;
    }
    
    public boolean isReceipt_verified() {
        return receipt_verified;
    }
    
    public void setReceipt_verified(boolean receipt_verified) {
        this.receipt_verified = receipt_verified;
    }
    
    // 날짜 포맷팅 메서드 (JSP에서 사용)
    public String getFormattedDate() {
        if (review_date == null) return "";
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy.MM.dd");
        return sdf.format(review_date);
    }
    
    // toString 메서드 (디버깅용)
    @Override
    public String toString() {
        return "ReviewDTO{" +
                "review_id=" + review_id +
                ", user_id='" + user_id + '\'' +
                ", user_name='" + user_name + '\'' +
                ", user_handle='" + user_handle + '\'' +
                ", designer_name='" + designer_name + '\'' +
                ", review_text='" + review_text + '\'' +
                ", review_date=" + review_date +
                ", help_count=" + help_count +
                ", receipt_verified=" + receipt_verified +
                '}';
    }
}