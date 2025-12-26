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
<link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_user/css/info.css">
	<title>마이페이지_회원용_회원정보</title>
</head>

<body>
	<header> </header>
	<main>
		<div class="inner">
			<section class="left">
				<jsp:include page="/mypage_user/main.jsp" />
			</section>
			<section class="right">
				<form action="/user/profile" method="post">
				<input type="hidden" id="id" name="id" value="${user.id }" />
				<div class="info">
					<div class="label-wrap">
						<label class="id">아이디</label> 
						<label class="pw">비밀번호</label> 
						<label class="name">이름</label> 
						<label class="birth">생년월일</label> 
						<label class="email">이메일</label> 
						<label class="phone">전화번호</label> 
						<label class="sex">성별</label>
					</div>

					<div class="p-wrap">
						<p>${user.id }</p>
						<p><input id="password" name="password" value="${user.password }" /></p>
						<p><input id="name" name="name" value="${user.full_name }" /></p>
						<p><input id="birth" name="birth" value="${user.birth }" /></p>
						<p><input id="email" name="email" value="${user.email }" /></p>
						<p><input id="phonenumber" name="phonenumber" value="${user.phonenumber }" /></p>
						<p><input id="gender" name="gender" value="${user.gender }" /></p>
<!-- 						<div class="button-wrap">
							<button>남</button>
							<button>여</button>
						</div>
 -->					</div>
				</div>
				<button class="edit" type="submit">회원정보 저장</button>
				</form>
			</section>

		</div>
	</main>
	<footer> </footer>
</body>