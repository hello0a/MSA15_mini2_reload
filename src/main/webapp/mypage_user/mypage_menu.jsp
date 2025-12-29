<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage_menu</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layout/common.css"><%-- 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_user/css/main.css"> --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_user/css/mypage_menu.css">
</head>
<body>
	<section class="mypage-main">
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
	</section>
</body>
</html>