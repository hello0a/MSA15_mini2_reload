<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>아이디 찾기</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/id_find.css">
  <!-- 공통 CSS -->
  <link rel="stylesheet" type="text/css" href="layout/common.css">
  <!-- 헤더/푸터 CSS -->
  <link rel="stylesheet" type="text/css" href="layout/header.jsp">
  <link rel="stylesheet" type="text/css" href="layout/footer.jsp">
</head>

<body>
	<jsp:include page="layout/header.jsp" />
  <div class="find-wrap">
    <h1 class="title">아이디 찾기</h1>

    <form action="findId" method="post">
      <div class="input-box">
        <label>이름</label>
        <input type="text" name="name" required>
      </div>

      <div class="input-box">
        <label>이메일</label>
        <input type="email" name="email" required>
      </div>

      <button type="submit" class="find-btn">아이디 찾기</button>
    </form>

    <c:if test="${not empty foundId}">
      <div class="result-box">
        <p>
          회원님의 아이디는<br>
          <span>${foundId}</span> 입니다
        </p>
      </div>
    </c:if>

    <c:if test="${not empty error}">
      <p class="error">${error}</p>
    </c:if>

    <div class="bottom-links">
      <a href="signup_customer.jsp">회원가입</a>
    </div>
  </div>
  <jsp:include page="layout/footer.jsp" />
</body>
</html>
