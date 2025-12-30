<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
  <!-- 공통 CSS -->
  <link rel="stylesheet" type="text/css" href="layout/common.css">
  <!-- 헤더/푸터 CSS -->
  <link rel="stylesheet" type="text/css" href="layout/header.jsp">
  <link rel="stylesheet" type="text/css" href="layout/footer.jsp">
</head>

<body>
	<jsp:include page="layout/header.jsp" />
  <div class="login-wrap">
    <div class="login-container">
      <h1>로그인</h1>

      <form action="login" method="post">
        <div class="input-box">
          <label>아이디</label>
          <input type="text" name="id" required>
        </div>

        <div class="input-box">
          <label>비밀번호</label>
          <input type="password" name="pw" required>
        </div>

        <button type="submit" class="login-btn">로그인</button>
      </form>

      <c:if test="${not empty error}">
        <p class="error">${error}</p>
      </c:if>

      <div class="login-links">
        <a href="id_find.jsp">아이디 찾기</a> |
        <a href="">회원가입</a>
      </div>
    </div>
  </div>
  <jsp:include page="layout/footer.jsp" />
</body>
</html>
