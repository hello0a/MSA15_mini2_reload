<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // URL 파라미터로 type 받기
    String type = request.getParameter("type");
    if(type == null) type = "user"; // 기본값: 회원

    String title = "owner".equals(type) ? "직원 로그인" : "회원 로그인";
    String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title><%= title %></title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css">
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
      <h1><%= title %></h1>

      <form action="<%= request.getContextPath() %>/loginProcess" method="post">
        <input type="hidden" name="type" value="<%= type %>">

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
