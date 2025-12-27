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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layout/common.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_designer/css/side-left.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_designer/css/profile.css">
	<title>마이페이지_디자이너용_회원정보</title>
</head>

<body>
	<header>
		<jsp:include page="${pageContext.request.contextPath}/layout/header.jsp" />
	</header>
	<main>
		<div class="inner">
			<section class="left">
				<jsp:include page="${pageContext.request.contextPath}/mypage_designer/side-left.jsp" />
			</section>
			<section class="right">
				<div class="designer-profile">
					<img src="${pageContext.request.contextPath}/mypage_designer/img/dug.jpg" alt="디자이너 프로필 사진">
					<p>디자이너이름</p>
				</div>
				<div class="info">
					<div class="label-wrap">
						<label class="id">아이디</label> 
						<label class="pw">비밀번호</label> 
						<label class="name">이름</label> 
						<label class="birth">생년월일</label> 
						<label class="email">이메일</label> 
						<label class="phone">전화번호</label> 
						<label class="shopname">매장명</label> 
						<label class="sex">성별</label>
						<label class="sex">국적</label>
						<label class="sex">사업자번호</label>
						<label class="sex">위치</label>
					</div>

					<div class="p-wrap">
						<p>${designer.id }</p>
						<p>${designer.password }</p>
						<p>${designer.full_name }</p>
						<p>${designer.birth }</p>
						<p>${designer.email }</p>
						<p>${designer.phonenumber }</p>
						<p>${designer.shop_name }</p>
						<p>${designer.gender }</p>
						<p>${designer.nationality }</p>
						<p>${designer.biz_num }</p>
						<div>
							<p>${designer.city }</p>
							<p>${designer.district }</p>
							<p>${designer.addr_detail }</p>
						</div>
					</div>
				</div>
				<a class="edit" href="/designer/profile/edit?id=${designer.id}">회원정보 수정</a>
			</section>

		</div>
	</main>
	<footer>
		<jsp:include page="${pageContext.request.contextPath}/layout/footer.jsp" />
	</footer>
</body>