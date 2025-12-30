<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>로그인 선택</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginmain.css">
  <!-- 공통 CSS -->
  <link rel="stylesheet" type="text/css" href="layout/common.css">
  <!-- 헤더/푸터 CSS -->
  <link rel="stylesheet" type="text/css" href="layout/header.jsp">
  <link rel="stylesheet" type="text/css" href="layout/footer.jsp">
</head>

<body>
 	<!-- 헤더 include -->
    <jsp:include page="layout/header.jsp" />

  <div class="container">
    <h1 class="title">로그인</h1>

    <div class="card-wrap">
      <a href="loginmain?type=owner" class="login-card owner">
        <img src="img/owner.jpg" alt="매장용 로그인">
        <h2>매장용 로그인</h2>
        <p>미용실 직원 전용</p>
      </a>

      <a href="loginmain?type=user" class="login-card user">
        <img src="img/user.jpg" alt="회원용 로그인">
        <h2>회원용 로그인</h2>
        <p>일반 고객 전용</p>
      </a>
    </div>
  </div>
  <!-- 푸터 include -->
  <jsp:include page="layout/footer.jsp" />
</body>
</html>
