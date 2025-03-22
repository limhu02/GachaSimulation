<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<!DOCTYPE html>
<html>
<head>
    <title>Gacha 게시판</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<header>
    <div class="top-bar">
        <div class="site-logo" onclick="location.href='/index/index.html'">
            천장연구소
        </div>
        <nav class="menu-bar">
            <ul class="menu">
                <li><a href="/board/priceList.html">자랑 게시판</a></li>
                <li><a href="/board/failList.html">폭망 게시판</a></li>
                <li><a href="/board/requestList.html">요청/질문 게시판</a></li>
                <li><a href="/board/simulation.html">시뮬레이션</a></li>
                <li><a href="/board/mypage.html">마이페이지</a></li>

                <!-- 관리자만 가입자 목록을 볼 수 있도록 설정 -->
                <sec:authorize access="hasRole('ADMIN')">
                    <li><a href="/admin/userlist.html">가입자 목록</a></li>
                </sec:authorize>
            </ul>
        </nav>

        <div class="auth-section">
            <sec:authorize access="isAuthenticated()">
                <span>☆ <sec:authentication property="principal.username"/>님 ☆</span>
                <a href="/login/logout.html" class="logout-btn">로그아웃</a>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
                <a href="/login/loginsec.html" class="auth-btn">로그인/회원가입</a>
            </sec:authorize>
        </div>
    </div>
</header>

<main>
    <c:choose>
        <c:when test="${not empty BODY}">
            <jsp:include page="${BODY}" />
        </c:when>
        <c:otherwise>
            <div class="welcome-message">원하시는 게시판을 선택해주세요.</div>
        </c:otherwise>
    </c:choose>
</main>

</body>
</html>
