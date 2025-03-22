<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가챠 박스 선택</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
        }

        .title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        /* ✅ 초록색 버튼: 아이템 정보 확인하기 */
        .info-button {
            padding: 12px 24px;
            background: #28a745; /* 초록색 */
            color: white;
            border: none;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: transform 0.2s, box-shadow 0.2s;
            margin-left: 10px;
        }

        /* ✅ 빨간색 버튼: 아이템 박스 관리 */
        .manage-button {
            padding: 12px 24px;
            background: #dc3545; /* 빨간색 */
            color: white;
            border: none;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: transform 0.2s, box-shadow 0.2s;
            margin-left: 10px;
        }

        /* ✅ 버튼 hover 효과 */
        .info-button:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 10px rgba(40, 167, 69, 0.3);
            background: #218838;
        }

        .manage-button:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 10px rgba(220, 53, 69, 0.3);
            background: #c82333;
        }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
        }

        .game-intro {
            text-align: center;
            margin-bottom: 40px;
        }

        .game-intro h2 {
            font-size: 28px;
            color: #333;
            margin-bottom: 10px;
        }

        .game-intro p {
            font-size: 16px;
            color: #666;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            justify-items: center;
        }

        .box {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            transition: transform 0.2s, box-shadow 0.2s;
            width: 100%;
            max-width: 300px;
        }

        .box:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .box img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
            background-color: #eee;
        }

        .box p {
            font-size: 18px;
            font-weight: bold;
            margin: 10px 0;
        }

        .box .price {
            color: #999;
            font-size: 14px;
        }

        .buttons {
            margin-top: auto;
            display: flex;
            justify-content: space-between;
            width: 100%;
            gap: 10px;
        }

        .draw-button {
            flex: 1;
            padding: 10px 0;
            font-size: 14px;
            border-radius: 6px;
            cursor: pointer;
            border: none;
            color: white;
            font-weight: bold;
            transition: background-color 0.2s, transform 0.2s;
        }

        .draw-button:first-child {
            background-color: #ff6600;
        }

        .draw-button:last-child {
            background-color: #0066ff;
        }

        .draw-button:hover {
            transform: scale(1.05);
        }

        .bottom-container {
            display: flex;
            justify-content: center;
            margin: 50px 0;
        }

        .back-button {
            padding: 15px 30px;
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .back-button:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }
    </style>
</head>

<body>

    <!-- ✅ 헤더 영역 -->
    <div class="header">
        <a href="${pageContext.request.contextPath}/board/simulation.html" style="text-decoration: none;">
        	<div class="title">${game}</div>
   		</a>
        
        <div>
            <!-- 아이템 정보 확인하기 버튼 (초록색) -->
            <a href="${pageContext.request.contextPath}/item/itemList.html?game=${game}">
                <button class="info-button">아이템 정보 확인하기</button>
            </a>

            <!-- 아이템 박스 관리 버튼 (빨간색) - 관리자만 노출 -->
            <sec:authorize access="hasRole('ADMIN')">
            	<a href="${pageContext.request.contextPath}/item/itemBoxManage.html?game=${game}">
                    <button class="manage-button">아이템 박스 관리</button>
                </a>
            </sec:authorize>
                
            
        </div>
    </div>

    <!-- ✅ 게임 설명 영역 -->
    <div class="container">
        <div class="game-intro">
            <h2>${game}</h2>
            <p>가챠 박스를 선택하고 아이템을 뽑아보세요!</p>
        </div>

        <!-- ✅ 가챠 박스 리스트 -->
        <div class="grid-container">
            <c:forEach var="gameBox" items="${boxList}">
                <div class="box">
                    <!-- ✅ 박스 이미지 -->
                    <img src="${pageContext.request.contextPath}/boxImage/${gameBox.image}" alt="${gameBox.name}">

                    <!-- ✅ 박스 이름 -->
                    <p>${gameBox.name} 뽑기</p>
                    <div class="price">(가격: ${gameBox.price}원)</div>

                    <!-- ✅ 뽑기 버튼 -->
                    <div class="buttons">
                        <a href="${pageContext.request.contextPath}/gacha/gacha1.html?code=${gameBox.code}">
                            <button class="draw-button">1회 뽑기</button>
                        </a>
                        <a href="${pageContext.request.contextPath}/gacha/gacha10.html?code=${gameBox.code}">
                            <button class="draw-button">10회 뽑기</button>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</body>
</html>
