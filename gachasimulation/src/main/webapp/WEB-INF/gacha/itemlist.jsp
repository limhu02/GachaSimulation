<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이템 목록</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        /* admin 버튼 하단 고정 스타일 */
        .admin-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 40px;
        }

        .admin-buttons a button {
            padding: 12px 24px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            color: #fff;
        }

        .admin-buttons a button:nth-child(1) { background-color: #007bff; }
        .admin-buttons a button:nth-child(1):hover { background-color: #0056b3; }

        .admin-buttons a button:nth-child(2) { background-color: #fd7e14; }
        .admin-buttons a button:nth-child(2):hover { background-color: #e56a0b; }

        .admin-buttons a button:nth-child(3) { background-color: #28a745; }
        .admin-buttons a button:nth-child(3):hover { background-color: #218838; }

        /* 기존 스타일 유지 */
        .search-form {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-form input[type="text"] {
            padding: 10px;
            width: 250px;
            border-radius: 6px;
            border: 1px solid #ccc;
            margin-right: 10px;
        }

        .search-form input[type="submit"] {
            padding: 10px 20px;
            border-radius: 6px;
            border: none;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .search-form input[type="submit"]:hover {
            background-color: #0056b3;
        }

        h3 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .game-list-button {
            position: absolute;
            top: 30px;
            right: 30px;
            padding: 12px 24px;
            background-color: #17a2b8;
            color: #fff;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s, transform 0.2s;
        }

        .game-list-button:hover {
            background-color: #138496;
            transform: scale(1.05);
        }

        .page-info {
            text-align: right;
            margin-bottom: 10px;
            color: #666;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        table th, table td {
            padding: 15px;
            border-bottom: 1px solid #eee;
        }

        table th {
            background-color: #007bff;
            color: white;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        .pagination {
            text-align: center;
            margin-top: 30px;
        }

        .pagination a {
            display: inline-block;
            margin: 0 5px;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            color: #333;
            text-decoration: none;
            transition: background-color 0.2s;
        }

        .pagination a:hover {
            background-color: #007bff;
            color: #fff;
        }

        .pagination .current {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <a href="${pageContext.request.contextPath}/board/simulation.html" class="game-list-button">게임목록으로 돌아가기</a>
    <h3>전체 아이템 목록</h3>

    <!-- 검색 폼 -->
    <div class="search-form">
        <form action="../item/namesearch.html" method="post">
            아이템 검색 :
            <input type="text" name="name" placeholder="아이템 이름을 입력하세요"/>
            <input type="submit" value="검색"/>
        </form>
    </div>

    <div class="page-info">
        ${startRow + 1} ~ ${endRow - 1} / ${total}
    </div>

    <table>
        <thead>
            <tr>
                <th>코드</th>
                <th>이름</th>
                <th>소속 게임</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty item.game}">
                    <c:forEach var="item" items="${itemlist}">
                        <tr>
                            <td>${item.item_code}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${sessionScope.user_id == 'admin'}">
                                        <a href="../item/detailAdmin.html?CODE=${item.item_code}">${item.item_name}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="../item/detail.html?CODE=${item.item_code}">${item.item_name}</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${item.box_game}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:forEach var="item" items="${itemlist}">
                        <tr>
                            <td>${item.item_code}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${sessionScope.user_id == 'admin'}">
                                        <a href="../item/detailAdmin.html?CODE=${item.item_code}">${item.item_name}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="../item/detail.html?CODE=${item.item_code}">${item.item_name}</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${item.box_game}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>

    <div class="pagination">
        <c:set var="pageCount" value="${pageCount}" />
        <c:set var="currentPage" value="${currentPage}" />
        <c:set var="startPage" value="${currentPage - (currentPage % 10 == 0 ? 10 : (currentPage % 10)) + 1}" />
        <c:set var="endPage" value="${startPage + 9}" />
        <c:if test="${endPage > pageCount}">
            <c:set var="endPage" value="${pageCount}" />
        </c:if>
        <c:if test="${startPage > 10}">
            <a href="../item/itemList.html?PAGE_NUM=${startPage - 1}">[이전]</a>
        </c:if>
        <c:forEach begin="${startPage}" end="${endPage}" var="i">
            <a href="../item/itemList.html?PAGE_NUM=${i}" class="${currentPage == i ? 'current' : ''}">${i}</a>
        </c:forEach>
        <c:if test="${endPage < pageCount}">
            <a href="../item/itemList.html?PAGE_NUM=${endPage + 1}">[다음]</a>
        </c:if>
    </div>

    <!-- ✅ 관리자용 버튼 하단에 배치 -->
    <c:if test="${sessionScope.user_id=='admin'}">
        <div class="admin-buttons">
            <a href="../item/inputgame.html">
                <button>게임 입력</button>
            </a>
            <a href="../item/inputItembox.html">
                <button>아이템 상자 입력</button>
            </a>
            <a href="../item/input.html">
                <button>아이템 입력</button>
            </a>
        </div>
    </c:if>

</div>

</body>
</html>
