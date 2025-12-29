<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <header>
      
    </header>
    <main>
    	<div class="inner">
            <section class="left">
                <jsp:include page="/mypage_user/main.jsp"/>
            </section>
            <section class="right">
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
                        <p>아이디</p>
                        <p>비밀번호</p>
                        <p>이름</p>
                        <p>생년월일</p>
                        <p>이메일</p>
                        <p>전화번호</p>
                        <div class="button-wrap">
                            <button>남</button>
                            <button>여</button>
                        </div>
                    </div>
                </div>
            <a class="edit">회원정보 수정</a>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_user/css/info.css">
    <title>마이페이지_회원용_회원정보</title>
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
                        <p>아이디</p>
                        <p>비밀번호</p>
                        <p>이름</p>
                        <p>생년월일</p>
                        <p>이메일</p>
                        <p>전화번호</p>
                        <div class="button-wrap">
                            <button>남</button>
                            <button>여</button>
                        </div>
                    </div>
                </div>
            <a class="edit">회원정보 수정</a>
            </section>
            
    	</div>
    </main>
    <footer>

    </footer>
>>>>>>> origin/develop
</body>