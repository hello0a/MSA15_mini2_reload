
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- css 코드 불러오기 -->
    <!-- side.jsp 만들어서 include 하기 (왼쪽 사이드) : 마이페이지왼쪽 정렬까지 기능 붙이기 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_user/css/main.css">
    <title>마이페이지_회원용_메인</title>
</head>

<body>
    <header>

    </header>
    <section class="mypage-main">
        
        <div class="user-profile">
            <img src="${pageContext.request.contextPath}/mypage_user/img/profile.png" alt="회원 프로필 사진">
            <p>이름</p>
        </div>
        <nav class="mypage-index">
            <a href="/mypage_user/info/info.html" class="user-info">회원 정보</a>
            <a href="/mypage_user/reserve/reserve.html" class="user-reserve">예약 조회</a>
            <a href="/mypage_user/review/review.html" class="user-review">후기 관리</a>
            <a href="" class="user-board">CS 문의</a>
        </nav>
    </section>
    <footer>

    </footer>
</body>
</html>