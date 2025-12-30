<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="board.DTO.ReviewDTO" %>
<%@ page import="board.DAO.ReviewDAO" %>
<%
    ReviewDAO dao = new ReviewDAO();
    List<ReviewDTO> reviews = dao.getAllReviews();  // 최신순으로 모두 가져옴
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 조회 - 망머샵 미용실</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/review_list.css">
</head>
<body>
    <jsp:include page="/layout/header.jsp" />

    <div class="review-list-container">
        <!-- 기존 탭들 유지 -->
        <div class="main-tabs">
            <div class="tab-item">가격</div>
            <div class="tab-item">예약</div>
            <div class="tab-item active">리뷰</div>
            <div class="tab-item">사진</div>
            <div class="tab-item">정보</div>
        </div>

        <div class="review-type-tabs">
            <button class="type-btn visitor">방문자 리뷰</button>
            <button class="type-btn instagram" onclick="location.href='https://www.instagram.com'">인스타그램 리뷰</button>
        </div>

        <div class="filter-section">
            <select class="designer-select" id="designer-filter">
                <option value="all">디자이너별 리뷰 보기 ▽</option>
                <option value="김조은 원장">김조은 원장</option>
                <option value="박한별 디자이너">박한별 디자이너</option>
                <option value="이민지 디자이너">이민지 디자이너</option>
            </select>
            <div class="receipt-info">영수증 인증 후 작성된 리뷰입니다.</div>
        </div>

        <!-- 리뷰 리스트 동적 출력 -->
        <div class="review-items" id="review-list">
            <%
                if (reviews.isEmpty()) {
            %>
                <p style="text-align:center; padding:50px; color:#999;">아직 작성된 리뷰가 없습니다.</p>
            <%
                } else {
                    for (ReviewDTO r : reviews) {
            %>
                <div class="review-card" data-designer="<%= r.getDesigner_name() %>">
                    <div class="user-header">
                        <img src="<%= r.getUser_avatar() != null ? r.getUser_avatar() : "images/default_avatar.jpg" %>" class="user-avatar" alt="avatar">
                        <div class="user-meta">
                            <span class="uid"><%= r.getUser_name() %></span>
                            <span class="handle"><%= r.getUser_handle() %></span>
                        </div>
                    </div>
                    <div class="review-content">
                        <div class="review-img-placeholder">
                            <% if (r.getReview_image() != null && !r.getReview_image().isEmpty()) { %>
                                <img src="<%= r.getReview_image() %>" style="max-width:100%; border-radius:8px;">
                            <% } else { %>
                                No image
                            <% } %>
                        </div>
                        <div class="review-body">
                            <div class="designer-name"><%= r.getDesigner_name() %></div>
                            <div class="review-text"><%= r.getReview_text() %></div>
                            <div class="card-footer">
                                <span class="help-btn">👍 도움이 됐어요 <span class="count"><%= r.getHelp_count() %></span></span>
                                <span class="date"><%= r.getFormattedDate() %></span>
                            </div>
                        </div>
                    </div>
                </div>
            <%
                    }
                }
            %>
        </div>
    </div>

    <script>
        // 디자이너 필터 (기존 스크립트 유지)
        document.getElementById('designer-filter').addEventListener('change', function() {
            const selected = this.value;
            document.querySelectorAll('.review-card').forEach(card => {
                if (selected === 'all' || card.dataset.designer === selected) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    </script>

    <jsp:include page="/layout/footer.jsp" />
</body>
</html>