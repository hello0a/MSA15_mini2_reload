<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 완료 화면</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/reservefinish.css">
    <link rel="stylesheet" type="text/css" href="layout/common.css">
</head>
<body>
<jsp:include page="layout/header.jsp" />

<div class="reserve-complete">
    <h2>예약이 완료되었습니다!</h2>

    <div class="designer-info">
        <img src="<%= request.getContextPath() %>/<%= request.getAttribute("designerImg") %>" alt="디자이너 사진">
        <div>
            <p><%= request.getAttribute("designerName") %></p>
            <p><%= request.getAttribute("designerCareer") %></p>
        </div>
    </div>

    <div class="reserve-details">
        <p>시술: <%= request.getAttribute("services") %></p>
        <p>날짜/시간: <%= request.getAttribute("reserveDateTime") %></p>
        <p>주소: <%= request.getAttribute("address") %></p>
    </div>

    <div class="actions">
        <a href="<%= request.getContextPath() %>/mypage_user/reserve_edit/reserve-edit.jsp">
            <button>예약 변경</button>
        </a>
        <a href="<%= request.getContextPath() %>/메인화면/main.jsp">
            <button>홈으로 이동</button>
        </a>
    </div>
</div>

<jsp:include page="layout/footer.jsp" />
</body>
</html>
