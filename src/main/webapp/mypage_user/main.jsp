<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- css 코드 불러오기 -->
	<!-- side.jsp 만들어서 include 하기 (왼쪽 사이드) : 마이페이지왼쪽 정렬까지 기능 붙이기 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layout/common.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_user/css/main.css">
	<title>마이페이지_회원용_메인</title>
</head>

<body>
	<header>
		<jsp:include page="${pageContext.request.contextPath}/layout/header.jsp" />
	</header>
	
	<section class="mypage-main">
		<jsp:include page="${pageContext.request.contextPath}/mypage_user/mypage_menu.jsp" />
	</section>
		
	<%-- <section class="mypage-main">

		<div class="user-profile">
			<img src="${pageContext.request.contextPath}/mypage_user/img/profile.png" alt="회원 프로필 사진">
			<p>${user.full_name}</p>
		</div>
		<nav class="mypage-index">
			<a href="${pageContext.request.contextPath}/user/mypage/profile?id=${user.id}" class="user-info">회원 정보</a> 
			<a href="/mypage_user/reserve/reserve.html" class="user-reserve">예약조회</a> 
			<a href="/mypage_user/review/review.html" class="user-review">후기관리</a> 
			<a href="" class="user-board">CS 문의</a>
		</nav>
	</section> --%>
	<footer>
		<jsp:include page="${pageContext.request.contextPath}/layout/footer.jsp" />
	</footer>
</body>

</html>