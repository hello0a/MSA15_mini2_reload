<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- css 코드 불러오기 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_user/css/reserve.css">
	<title>마이페이지_회원용_예약조회</title>
</head>
<body>
	<header>
		<jsp:include page="${pageContext.request.contextPath}/layout/header.jsp" />
	</header>
	<main class="reserve-main">
		<div class="inner">
			<section class="left">
				<jsp:include page="${pageContext.request.contextPath}/mypage_user/mypage_menu.jsp" />
			</section>
			<section class="right">
				<div class="reserve">
					<div class="designer-profile">
						<img src="${pageContext.request.contextPath}/mypage_user/img/1 (3).jpg"
							alt="프로필 사진">
						<p class="designer-name">이름</p>
					</div>
					<div class="reserve-detail">
						<div class="label-wrap">
							<label class="date">날짜</label> <label class="time">시간</label> <label
								class="styel">시술</label>
						</div>
						<div class="p-wrap">
							<p>날짜</p>
							<p>시간</p>
							<p>컷/펌 등</p>
						</div>
					</div>
				</div>
				<a class="reserve-edit" href="/mypage_user/reserve.css">예약 변경</a>
			</section>
		</div>
	</main>
	<footer> 
		<jsp:include page="${pageContext.request.contextPath}/layout/footer.jsp" />
	</footer>
</body>