<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이템 박스 삭제 실패</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 100px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
            text-align: center;
        }

        h1 {
            color: #dc3545;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            margin-bottom: 30px;
        }

        .common-button {
            min-width: 150px;
            height: 45px;
            padding: 0 20px;
            font-size: 14px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            transition: background-color 0.3s ease, box-shadow 0.2s ease;
            margin: 0 10px;
        }

        .back-button {
            background-color: #6c757d;
            color: #fff;
        }

        .back-button:hover {
            background-color: #5a6268;
        }

        .go-itemlist-button {
            background-color: #007bff;
            color: #fff;
        }

        .go-itemlist-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>아이템 박스 삭제 실패</h1>
    <p>
        해당 박스에 <strong>${itemCount}</strong>개의 아이템이 존재하여 삭제할 수 없습니다.<br>
        먼저 아이템을 삭제한 후 다시 시도해주세요.
    </p>

    <div>
        <!-- 아이템 리스트로 이동 (해당 박스 코드에 연결) -->
        <a href="${pageContext.request.contextPath}/item/itemList.html?box_code=${boxCode}" class="common-button go-itemlist-button">
            아이템 목록으로 이동
        </a>

        <!-- 이전 페이지로 돌아가기 -->
        <button type="button" class="common-button back-button" onclick="window.history.back();">뒤로가기</button>
    </div>
</div>

</body>
</html>
