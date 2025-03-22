<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>이미지 게시글 상세보기</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 600px;
        margin: 50px auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    h3 {
        margin-bottom: 20px;
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    table th, table td {
        padding: 15px;
        border-bottom: 1px solid #eee;
        font-size: 16px;
    }

    table th {
        background-color: #007bff;
        color: white;
    }

    table tr:last-child td {
        border-bottom: none;
    }

    img {
        border-radius: 10px;
        margin-top: 10px;
    }

    .button-group {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin-top: 20px;
    }

    .btn {
        padding: 10px 20px;
        border-radius: 6px;
        text-decoration: none;
        font-weight: bold;
        font-size: 14px;
        cursor: pointer;
        transition: transform 0.2s, box-shadow 0.2s;
        color: white;
        border: none;
        background-color: #007bff;
    }

    .btn:hover {
        transform: scale(1.05);
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
    }

</style>
</head>
<body>

<div class="container">
    <h3>아이템 상세보기</h3>

    <table>
        <tr><th>아이템</th><td>${item.name}</td></tr>
        <tr><th>소속 게임</th><td>${box.game}</td></tr>
        <tr><th>출현 상자</th><td>${box.name}</td></tr>
        <tr><th>등급</th><td>${item.rate}</td></tr>
        <tr><th>확률</th><td>${item.probability} %</td></tr>
        <tr>
            <td colspan="2">
                <img alt="${item.name}" src="${pageContext.request.contextPath}/itemImage/${item.image}"
                    width="250" height="200" />
            </td>
        </tr>
    </table>

    <div class="button-group">
        <a href="../item/itemList.html" class="btn">목록</a>
    </div>
</div>

</body>
</html>
