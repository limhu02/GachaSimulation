<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Gacha Simulation</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 10px;
            text-align: center;
        }

        /* Title 스타일 */
        .title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }
.header {
    display: flex;
    align-items: center;
    justify-content: space-between; /* 좌우 끝으로 정렬 */
    padding: 20px 40px;
    background-color: #fff;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.title2 {
    font-size: 24px;
    font-weight: bold;
    color: #333;
}

.info-button {
    margin-left: auto; /* 자동으로 오른쪽 정렬 */
    padding: 12px 24px;
    background: #ff6600;
    color: white;
    border: none;
    font-weight: bold;
    border-radius: 6px;
    cursor: pointer;
    font-size: 16px;
    transition: transform 0.2s, box-shadow 0.2s;
}

.info-button:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}


        /* Grid 스타일 */
        .grid-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            justify-items: center;
            padding: 0 10px;
        }

        .square-box {
            width: 100%;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            text-decoration: none;
            color: #333;
            transition: transform 0.2s, box-shadow 0.2s;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 15px;
        }

        .square-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            background-color: #f0f8ff;
        }

        .game-image {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 10px;
            background-color: #eee;
        }

        .game-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-top: 5px;
        }

        @media (max-width: 768px) {
            .grid-container {
                grid-template-columns: 1fr;
            }

            .game-image {
                height: 180px;
            }

            .game-title {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="title2">${game}</div>
        <a href="${pageContext.request.contextPath}/item/itemList.html">
            <button class="info-button">전체 아이템 정보 확인하기</button>
        </a>
    
</div>
    <!-- Main content -->
    <div class="container">
        <h1 class="title">🎮 게임을 선택하세요!</h1>

        <div class="grid-container">
            <c:forEach var="game" items="${gameList}">
                <a href="${pageContext.request.contextPath}/gacha?game=${game.name}" class="square-box">
                    <!-- 게임 이미지 처리 -->
                    <c:choose>
                        <c:when test="${game.image != null}">
                            <img src="${pageContext.request.contextPath}/gameImage/${game.image}" alt="${game}" class="game-image">
                        </c:when>
                        <c:otherwise>
                            <div class="game-image" style="display: flex; align-items: center; justify-content: center; color: #aaa;">
                                <img src="${pageContext.request.contextPath}/gameImage/questionmark.png" alt="${game}" class="game-image">
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <div class="game-title">${game.name}</div>
                </a>
            </c:forEach>
        </div>
    </div>
</body>
</html>
