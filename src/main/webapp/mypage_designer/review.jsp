<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layout/common.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_designer/css/side-left.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_designer/css/calendar.css">
<title>예약 스케줄</title>
	<style>
	main {
    min-height: 100vh;
    width: 1060px;
    max-width: 100%;
    display: flex;
    align-items: center;
}
.inner {
    width: 970px;
    max-width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 0 45px;
    gap: 100px;
    /* min-height: 100vh; */
}
	.left {
    width: 315px;
    max-width: 100%;
}
.right {
    display: inline-flex;
    width: 555px;
    max-width: 100%;
    justify-content: center;
    gap: 3rem;
    flex-direction: column;
}
	</style>
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
<!-- calendar body -->
<div class="calendar-body">
  <!-- 요일 줄 -->
  <div class="calendar-row weekday-row">
    <div class="weekday">Mon</div>
    <div class="weekday">Tue</div>
    <div class="weekday">Wed</div>
    <div class="weekday">Thu</div>
    <div class="weekday">Fri</div>
    <div class="weekday">Sat</div>
    <div class="weekday">Sun</div>
  </div>

  <!-- 1주 -->
  <div class="calendar-row week-row">
    <div class="picker-cell is-muted"><div class="value">25</div></div>
    <div class="picker-cell is-muted"><div class="value">26</div></div>
    <div class="picker-cell is-muted"><div class="value">27</div></div>
    <div class="picker-cell is-muted"><div class="value">28</div></div>
    <div class="picker-cell is-muted"><div class="value">29</div></div>
    <div class="picker-cell"><div class="value">1</div></div>
    <div class="picker-cell"><div class="value">2</div></div>
  </div>

  <!-- 2주 -->
  <div class="calendar-row week-row">
    <div class="picker-cell"><div class="value">3</div></div>
    <div class="picker-cell"><div class="value">4</div></div>
    <div class="picker-cell"><div class="value">5</div></div>
    <div class="picker-cell"><div class="value">6</div></div>
    <div class="picker-cell"><div class="value">7</div></div>
    <div class="picker-cell"><div class="value">8</div></div>
    <div class="picker-cell"><div class="value">9</div></div>
  </div>

  <!-- 3주 -->
  <div class="calendar-row week-row">
    <div class="picker-cell"><div class="value">10</div></div>
    <div class="picker-cell"><div class="value">11</div></div>
    <div class="picker-cell"><div class="value">12</div></div>
    <div class="picker-cell"><div class="value">13</div></div>
    <div class="picker-cell"><div class="value">14</div></div>
    <div class="picker-cell is-outline-primary"><div class="value">15</div></div>
    <div class="picker-cell"><div class="value">16</div></div>
  </div>

  <!-- 4주 -->
  <div class="calendar-row week-row">
    <div class="picker-cell"><div class="value">17</div></div>
    <div class="picker-cell"><div class="value">18</div></div>
    <div class="picker-cell"><div class="value">19</div></div>
    <div class="picker-cell"><div class="value">20</div></div>
    <div class="picker-cell"><div class="value">21</div></div>
    <div class="picker-cell"><div class="value">22</div></div>
    <div class="picker-cell is-selected"><div class="value">23</div></div>
  </div>

  <!-- 5주 -->
  <div class="calendar-row week-row">
    <div class="picker-cell"><div class="value">24</div></div>
    <div class="picker-cell"><div class="value">25</div></div>
    <div class="picker-cell"><div class="value">26</div></div>
    <div class="picker-cell"><div class="value">27</div></div>
    <div class="picker-cell"><div class="value">28</div></div>
    <div class="picker-cell"><div class="value">29</div></div>
    <div class="picker-cell"><div class="value">30</div></div>
  </div>

  <!-- 6주 -->
  <div class="calendar-row week-row">
    <div class="picker-cell"><div class="value">31</div></div>
    <div class="picker-cell is-muted"><div class="value">1</div></div>
    <div class="picker-cell is-muted"><div class="value">2</div></div>
    <div class="picker-cell is-muted"><div class="value">3</div></div>
    <div class="picker-cell is-muted"><div class="value">4</div></div>
    <div class="picker-cell is-muted"><div class="value">5</div></div>
    <div class="picker-cell is-muted"><div class="value">6</div></div>
  </div>
</div>

		
			</section>
		</div>
	</main>
	<header>
		<jsp:include page="${pageContext.request.contextPath}/layout/footer.jsp" />
	</header>
	
</body>
</html>