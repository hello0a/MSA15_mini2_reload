<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 페이지</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/reserve.css">
    <link rel="stylesheet" type="text/css" href="layout/common.css">
    <link rel="stylesheet" type="text/css" href="layout/header.jsp">
    <link rel="stylesheet" type="text/css" href="layout/footer.jsp">
</head>

<body>
<jsp:include page="layout/header.jsp" />

<h2>매장 / 디자이너 (선택완료)</h2>

<div class="container">

  <!-- 예약 날짜 카드 -->
  <details>
    <summary>예약 날짜</summary>
    <div class="card-content">
      <input type="date" name="reserveDate" value="${param.reserveDate}">
    </div>
  </details>

  <!-- 예약 시간 카드 -->
  <details>
    <summary>예약 시간</summary>
    <div class="card-content">
      <div class="time-list">
        <c:if test="${not empty availableTimes}">
          <c:forEach var="time" items="${availableTimes}">
            <label>
              <input type="radio" name="time" value="${time}">
              <span>${time}</span>
            </label>
          </c:forEach>
        </c:if>
        <c:if test="${empty availableTimes}">
          <p>예약 가능한 시간이 없습니다.</p>
        </c:if>
      </div>
    </div>
  </details>

  <!-- 시술 선택 카드 -->
  <details>
    <summary>시술 선택</summary>
    <div class="card-content service">
        <label><input type="checkbox" name="service" value="컷"> 컷</label>
        <label><input type="checkbox" name="service" value="펌"> 펌</label>
        <label><input type="checkbox" name="service" value="염색"> 염색</label>
        <p>⚠️모발 길이·손상도에 따른 추가 요금이 있을 수 있습니다.</p>
    </div>
  </details>

  <!-- 예약 버튼 및 hidden input 추가 -->
  <form action="<%= request.getContextPath() %>/reserve" method="post">
      <input type="hidden" name="userId" value="${sessionScope.userId}">
      <input type="hidden" name="store" value="${selectedStore}">
      <input type="hidden" name="designer" value="${selectedDesigner}">
      <input type="hidden" name="reserveDate" value="${param.reserveDate}">

      <button type="submit" class="reserve-btn">예약하기</button>
  </form>

  <!-- 예약 성공/실패 메시지 -->
  <c:if test="${not empty msg}">
      <div class="msg">${msg}</div>
  </c:if>

</div>

<jsp:include page="layout/footer.jsp" />

</body>
</html>
