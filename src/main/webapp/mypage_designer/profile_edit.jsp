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
				<form action="/designer/profile/edit" method="post">
				<div class="designer-profile">
					<img src="${pageContext.request.contextPath}/mypage_designer/img/dug.jpg" alt="디자이너 프로필 사진">
					<p>디자이너이름</p>
				</div>
				<div class="info">
					<input type="hidden" name="id" value="${designer.id}" >
					<div class="label-wrap">
						<label class="id">아이디</label> 
						<label class="pw">비밀번호</label> 
						<label class="name">이름</label> 
						<label class="birth">생년월일</label> 
						<label class="email">이메일</label> 
						<label class="phone">전화번호</label> 
						<label class="shopname">매장명</label> 
						<label class="sex">사업자번호</label>
						<label class="sex">성별</label>
						<label class="sex">국적</label>
						<label class="sex">위치</label>
					</div>

					<div class="p-wrap">
						<p>${designer.id }</p>
						<p><input name="pw" value="${designer.password}" ></p>
						<p><input name="name" value="${designer.full_name}" ></p>
						<p><input name="birth" value="${designer.birth}" ></p>
						<p><input name="email" value="${designer.email}" ></p>
						<p><input name="phone" value="${designer.phonenumber}" ></p>
						<p><input name="shopName" value="${designer.shop_name}" ></p>
						<p><input name="bizNum" value="${designer.biz_num}" ></p>
						<p><input name="gender" value="${designer.gender}" ></p>
						<p><input name="nation" value="${designer.nationality}" ></p>
						<p><input name="city" value="${designer.city}" ></p>
						<p><input name="district" value="${designer.district}" ></p>
						<p><input name="addrDetail" value="${designer.addr_detail}" ></p>
					</div>
				</div>
				<button type="submit" class="edit">수정 완료</button>
				</form>
			</section>

		</div>
	</main>
	<footer>
		<jsp:include page="${pageContext.request.contextPath}/layout/footer.jsp" />
	</footer>
</body>