<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        .add-item-btn-container {
            position: fixed;
            bottom: 30px;
            right: 30px;
            display: flex;
            gap: 10px;
        }

        .add-item-btn, .edit-item-btn, .delete-item-btn {
            color: #fff;
            padding: 12px 20px;
            border-radius: 50px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            transition: background-color 0.2s;
        }

        .add-item-btn { background-color: #28a745; }
        .add-item-btn:hover { background-color: #218838; }

        .edit-item-btn { background-color: #fd7e14; }
        .edit-item-btn:hover { background-color: #e56a0b; }

        .delete-item-btn { background-color: #dc3545; }
        .delete-item-btn:hover { background-color: #c82333; }
    </style>
</head>
<body>

<div class="container">
    <a href="${pageContext.request.contextPath}/board/simulation.html" class="game-list-button">게임목록</a>
    <h3>아이템 목록</h3>
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
</div>
<c:if test="${sessionScope.user_id=='admin'}">
    <div class="add-item-btn-container">
        <a href="../item/inputgame.html">
            <button class="edit-item-btn">게임 입력</button>
        </a>
        <a href="../item/inputItembox.html">
            <button class="delete-item-btn">아이템 상자 입력</button>
        </a>
        <a href="../item/input.html">
            <button class="add-item-btn">아이템 입력</button>
        </a>
        
    </div>
</c:if>
</body>
</html>
