<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="board.DTO.ReviewDTO" %>
<%@ page import="board.DAO.ReviewDAO" %>
<%@ page import="java.sql.Date" %>
<%
    request.setCharacterEncoding("UTF-8");

    String designerNo = request.getParameter("designer_no");
    String content = request.getParameter("content");

    // 세션에서 사용자 아이디 (없으면 테스트용)
    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
        userId = "testuser";
    }

    // 간단한 사용자 정보 (실제로는 DB에서 가져와야 하지만 과제라 고정)
    String userName = "예진0928";  // 예시
    String userHandle = "@YJ0928";
    String userAvatar = "images/default_avatar.jpg"; // 없어도 됨

    // 디자이너 이름 매핑 (designer_no → 이름)
    String designerName = "";
    if ("1".equals(designerNo)) designerName = "김조은 원장";
    else if ("2".equals(designerNo)) designerName = "박한별 디자이너";
    else if ("3".equals(designerNo)) designerName = "이민지 디자이너";

    if (designerName.isEmpty() || content == null || content.trim().isEmpty()) {
        out.println("<script>alert('잘못된 접근입니다.'); history.back();</script>");
        return;
    }

    // DTO 생성
    ReviewDTO review = new ReviewDTO();
    review.setUser_id(userId);
    review.setUser_name(userName);
    review.setUser_handle(userHandle);
    review.setUser_avatar(userAvatar);
    review.setDesigner_name(designerName);
    review.setReview_text(content);
    review.setReview_image("");  // 이미지 없음
    review.setReview_date(new Date(System.currentTimeMillis()));  // 오늘 날짜
    review.setHelp_count(0);
    review.setReceipt_verified(true);

    // DAO로 삽입
    ReviewDAO dao = new ReviewDAO();
    boolean success = dao.insertReview(review);

    if (success) {
%>
        <script>
            alert("리뷰가 등록되었습니다!");
            location.href = "review_list.jsp";
        </script>
<%
    } else {
%>
        <script>
            alert("리뷰 등록에 실패했습니다.");
            history.back();
        </script>
<%
    }
%>