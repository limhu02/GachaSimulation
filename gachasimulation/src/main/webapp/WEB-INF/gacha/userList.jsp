<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(관리자) 가입자 목록</title>
<!-- ✅ CSS 파일 연결 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/board.css">
</head>
<body>

<div class="board-container">
    <div class="board-title">
        <h2>가입자 목록</h2>
    </div>

    <!-- 검색창 -->
    <div class="search-container">
        <form action="/admin/search.html" method="get">
            <input type="text" name="searchKeyword" value="${searchKeyword}" placeholder="ID를 입력하세요.">
            <button type="submit">검색</button>
            <a href="/board/failList.html"><button type="button">초기화</button></a>
        </form>
    </div>
	<br/>
    <!-- 게시글 테이블 -->
    <table>
        <tr>

            <th>ID</th>
            <th>이름</th>
            <th>가입일</th>
        </tr>

        <c:choose>
            <c:when test="${empty userlist}">
                <tr>
                    <td colspan="4">가입자가 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="user" items="${userlist}">
                    <tr>
                        <td>${user.user_id}</td>
                        <td><a href="/admin/userdetail.html?user_id=${user.user_id}">${user.name}</a></td>
                        <td>${user.reg_date}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </table>
	<br/>
    <!-- 페이지네이션 -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="/admin/userlist.html?pageNo=${currentPage - 1}">[이전]</a>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="i">
            <a href="/admin/userlist.html?pageNo=${i}" class="${currentPage == i ? 'active' : ''}">${i}</a>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="/admin/userlist.html?pageNo=${currentPage + 1}">[다음]</a>
        </c:if>
    </div>
	<br/><br/>
    <!-- 게시글 쓰기 버튼 -->
    <a href="/admin/deleteAll.html" class="write-btn2">가입자 계정 삭제</a>
</div>

</body>
</html>
