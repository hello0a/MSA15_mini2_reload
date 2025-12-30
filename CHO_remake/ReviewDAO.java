package board.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import board.DTO.ReviewDTO;

public class ReviewDAO {
    
    /**
     * 모든 리뷰 조회
     */
    public List<ReviewDTO> getAllReviews() {
        List<ReviewDTO> reviews = new ArrayList<>();
        String sql = "SELECT * FROM review ORDER BY review_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                reviews.add(mapResultSetToDTO(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
    
    /**
     * 디자이너별 리뷰 조회
     */
    public List<ReviewDTO> getReviewsByDesigner(String designerName) {
        List<ReviewDTO> reviews = new ArrayList<>();
        String sql = "SELECT * FROM review WHERE designer_name = ? ORDER BY review_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, designerName);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    reviews.add(mapResultSetToDTO(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
    
    /**
     * 페이징 처리된 리뷰 조회
     */
    public List<ReviewDTO> getReviewsWithPaging(int offset, int limit) {
        List<ReviewDTO> reviews = new ArrayList<>();
        String sql = "SELECT * FROM review ORDER BY review_date DESC LIMIT ? OFFSET ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, limit);
            pstmt.setInt(2, offset);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    reviews.add(mapResultSetToDTO(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
    
    /**
     * 특정 리뷰 조회
     */
    public ReviewDTO getReviewById(int reviewId) {
        String sql = "SELECT * FROM review WHERE review_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, reviewId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToDTO(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    /**
     * 리뷰 등록
     */
    public boolean insertReview(ReviewDTO review) {
        String sql = "INSERT INTO review (user_id, user_name, user_handle, user_avatar, designer_name, " +
                     "review_text, review_image, review_date, help_count, receipt_verified) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, review.getUser_id());
            pstmt.setString(2, review.getUser_name());
            pstmt.setString(3, review.getUser_handle());
            pstmt.setString(4, review.getUser_avatar());
            pstmt.setString(5, review.getDesigner_name());
            pstmt.setString(6, review.getReview_text());
            pstmt.setString(7, review.getReview_image());
            pstmt.setDate(8, review.getReview_date());
            pstmt.setInt(9, review.getHelp_count());
            pstmt.setBoolean(10, review.isReceipt_verified());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * 리뷰 수정
     */
    public boolean updateReview(ReviewDTO review) {
        String sql = "UPDATE review SET designer_name = ?, review_text = ?, " +
                     "review_image = ?, review_date = ? WHERE review_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, review.getDesigner_name());
            pstmt.setString(2, review.getReview_text());
            pstmt.setString(3, review.getReview_image());
            pstmt.setDate(4, review.getReview_date());
            pstmt.setInt(5, review.getReview_id());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * 리뷰 삭제
     */
    public boolean deleteReview(int reviewId) {
        String sql = "DELETE FROM review WHERE review_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, reviewId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * 도움이 됐어요 카운트 증가
     */
    public boolean incrementHelpCount(int reviewId) {
        String sql = "UPDATE review SET help_count = help_count + 1 WHERE review_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, reviewId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * 도움이 됐어요 카운트 감소
     */
    public boolean decrementHelpCount(int reviewId) {
        String sql = "UPDATE review SET help_count = help_count - 1 WHERE review_id = ? AND help_count > 0";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, reviewId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * 전체 리뷰 개수 조회
     */
    public int getTotalReviewCount() {
        String sql = "SELECT COUNT(*) FROM review";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    /**
     * 디자이너별 리뷰 개수 조회
     */
    public int getReviewCountByDesigner(String designerName) {
        String sql = "SELECT COUNT(*) FROM review WHERE designer_name = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, designerName);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    /**
     * ResultSet을 ReviewDTO로 매핑
     */
    private ReviewDTO mapResultSetToDTO(ResultSet rs) throws SQLException {
        ReviewDTO review = new ReviewDTO();
        review.setReview_id(rs.getInt("review_id"));
        review.setUser_id(rs.getString("user_id"));
        review.setUser_name(rs.getString("user_name"));
        review.setUser_handle(rs.getString("user_handle"));
        review.setUser_avatar(rs.getString("user_avatar"));
        review.setDesigner_name(rs.getString("designer_name"));
        review.setReview_text(rs.getString("review_text"));
        review.setReview_image(rs.getString("review_image"));
        review.setReview_date(rs.getDate("review_date"));
        review.setHelp_count(rs.getInt("help_count"));
        review.setReceipt_verified(rs.getBoolean("receipt_verified"));
        return review;
    }
}