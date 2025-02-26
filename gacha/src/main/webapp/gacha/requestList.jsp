<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청/질문 게시판</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        text-align: center;
        background-color: white;
    }

    .board-container {
        width: 60%;
        margin: 40px auto;
        text-align: left;
    }

    .board-title {
        font-size: 28px;
        font-weight: bold;
        text-align: center;
        margin-bottom: 10px;
    }

    .search-container {
        display: flex;
        justify-content: center;
        margin-bottom: 10px;
    }

    .search-container input {
        width: 250px;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .search-container button {
        padding: 8px 12px;
        border: none;
        background-color: #5bc0de;
        color: white;
        cursor: pointer;
        margin-left: 5px;
        border-radius: 4px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: center;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    .pagination {
        margin-top: 15px;
        text-align: center;
    }

    .pagination a {
        margin: 0 3px;
        padding: 8px 12px;
        border: 1px solid #ccc;
        text-decoration: none;
        color: black;
        border-radius: 4px;
    }

    .pagination a.active {
        background-color: #5bc0de;
        color: white;
    }

    .write-btn {
        display: block;
        width: 150px;
        padding: 12px;
        margin: 15px auto;
        background-color: #337ab7;
        color: white;
        text-align: center;
        font-size: 16px;
        font-weight: bold;
        text-decoration: none;
        border-radius: 6px;
    }

    .write-btn:hover {
        background-color: #286090;
    }
</style>
</head>
<body>

<div class="board-container">
    <div class="board-title">
        <h2>요청/질문 게시판</h2>
    </div>

    <!-- 검색창 -->
    <div class="search-container">
        <form action="/board/requestList.html" method="get">
            <input type="text" name="searchKeyword" value="${searchKeyword}" placeholder="글 제목을 입력하세요.">
            <button type="submit">검색</button>
            <a href="/board/requestList.html"><button type="button">초기화</button></a>
        </form>
    </div>

    <!-- 게시글 테이블 -->
    <table>
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자 ID</th>
            <th>작성일</th>
        </tr>

        <c:choose>
            <c:when test="${empty postList}">
                <tr>
                    <td colspan="4">게시글이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="post" items="${postList}">
                    <tr>
                        <td>${post.postId}</td>
                        <td><a href="/board/detail.html?postId=${post.postId}">${post.title}</a></td>
                        <td>${post.writerId}</td>
                        <td>${post.writeDate}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </table>

    <!-- 페이지네이션 -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="/board/requestList.html?pageNo=${currentPage - 1}&searchKeyword=${searchKeyword}">[이전]</a>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="i">
            <a href="/board/requestList.html?pageNo=${i}&searchKeyword=${searchKeyword}" class="${currentPage == i ? 'active' : ''}">${i}</a>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="/board/requestList.html?pageNo=${currentPage + 1}&searchKeyword=${searchKeyword}">[다음]</a>
        </c:if>
    </div>

    <!-- 게시글 쓰기 버튼 -->
    <a href="/board/write.html" class="write-btn">게시글 쓰기</a>
</div>

</body>
</html>
