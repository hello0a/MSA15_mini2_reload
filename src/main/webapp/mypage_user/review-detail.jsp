<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- css 코드 불러오기 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_user/css/review-detail.css">
    <title>마이페이지_회원용_후기변경</title>
</head>
<body>
    <header>
      
    </header>
    <main>
    	<div class="inner">
            <section class="left">
                <jsp:include page="/mypage_user/main.jsp"/>
            </section>
            <section class="right">
            	<div class="container">
                    <div class="img-wrap">
                        <img src="${pageContext.request.contextPath}/mypage_user/img/장원영.jpeg" alt="후기 사진">
                        <img src="${pageContext.request.contextPath}/mypage_user/img/장원영.jpeg" alt="후기 사진">
                        <img src="${pageContext.request.contextPath}/mypage_user/img/장원영.jpeg" alt="후기 사진">
                    </div>
                    <div class="reserve-detail">
                        <img src="${pageContext.request.contextPath}/mypage_user/img/1 (3).jpg" alt="프로필 사진">
                        <p>디자이너 이름</p>
                        <p>예약 날짜</p>
                    </div>
                    <textarea>고객 후기</textarea>
                </div>
                <button class="review-edit">수정하기</button>
            </section>
    	</div>
    </main>
    <footer>

    </footer>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- css 코드 불러오기 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_user/css/review-detail.css">
    <title>마이페이지_회원용_후기변경</title>
</head>
<body>
    <header>
      
    </header>
    <main>
    	<div class="inner">
            <section class="left">
                <jsp:include page="/mypage_user/main.jsp"/>
            </section>
            <section class="right">
            	<div class="container">
                    <div class="img-wrap">
                        <img src="${pageContext.request.contextPath}/mypage_user/img/장원영.jpeg" alt="후기 사진">
                        <img src="${pageContext.request.contextPath}/mypage_user/img/장원영.jpeg" alt="후기 사진">
                        <img src="${pageContext.request.contextPath}/mypage_user/img/장원영.jpeg" alt="후기 사진">
                    </div>
                    <div class="reserve-detail">
                        <img src="${pageContext.request.contextPath}/mypage_user/img/1 (3).jpg" alt="프로필 사진">
                        <p>디자이너 이름</p>
                        <p>예약 날짜</p>
                    </div>
                    <textarea>고객 후기</textarea>
                </div>
                <button class="review-edit">수정하기</button>
            </section>
    	</div>
    </main>
    <footer>

    </footer>
>>>>>>> origin/develop
</body>