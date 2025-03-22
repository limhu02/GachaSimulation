<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Gacha Simulation</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 10px;
            text-align: center;
            position: relative; /* 버튼 배치를 위해 추가 */
        }

        .title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .admin-buttons {
            position: absolute;
            height: 40px;
            top: 10px;
            right: -200px; /* 우측에 배치 (조정 가능) */
            display: flex;
            flex-direction: column;
            gap: 10px; /* 버튼 간 간격 */
        }

        .admin-buttons a button {
            width: 180px;
            padding: 10px 15px;
            background-color: #343a40;
            color: #fff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .admin-buttons a button:hover {
            background-color: #495057;
            transform: translateY(-2px);
        }

        .simulation-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 40px;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .info-button {
            margin-top: 20px;
            padding: 12px 24px;
            background: #337ab7;
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
            position: relative;
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

        .delete-button {
            margin-top: 10px;
            padding: 8px 16px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.2s, box-shadow 0.2s;
        }

        .delete-button:hover {
            background-color: #b02a37;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        @media (max-width: 768px) {
            .grid-container {
                grid-template-columns: 1fr;
            }

            .admin-buttons {
                position: static;
                margin: 20px auto 0;
                flex-direction: row;
                justify-content: center;
            }

            .admin-buttons a button {
                width: auto;
                margin: 0 5px;
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

    <div class="container">

        <!-- ✅ 관리자 버튼 우측 상단 고정 -->
        <sec:authorize access="hasRole('ADMIN')">
        
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
        </sec:authorize>

        <h1 class="title">🎮 게임을 선택하세요!</h1>

        <div class="grid-container">
            <c:forEach var="game" items="${gameList}">
                <div class="square-box">
                    <a href="${pageContext.request.contextPath}/gacha?game=${game.name}" style="text-decoration: none; color: inherit;">
                        <c:choose>
                            <c:when test="${game.image != null}">
                                <img src="${pageContext.request.contextPath}/gameImage/${game.image}" alt="${game.name}" class="game-image">
                            </c:when>
                            <c:otherwise>
                                <div class="game-image" style="display: flex; align-items: center; justify-content: center; color: #aaa;">
                                    <img src="/gameImage/questionmark.png" alt="${game.name}" class="game-image">
                                </div>
                            </c:otherwise>
                        </c:choose>

                        <div class="game-title">${game.name}</div>
                    </a>

                    <!-- ✅ 관리자 계정일 경우에만 삭제 버튼 출력 -->
                    <sec:authorize access="hasRole('ADMIN')">
    					<button class="delete-button" onclick="confirmDelete('${game.name}')">게임 삭제</button>
					</sec:authorize>
                </div>
            </c:forEach>
        </div>

        <a href="${pageContext.request.contextPath}/item/itemList.html">
            <button class="info-button">전체 아이템 정보 확인하기</button>
        </a>
    </div>
<script type="text/javascript">
    function confirmDelete(gameName) {
        if (confirm("정말로 '" + gameName + "' 게임을 삭제하시겠습니까?")) {
            // 확인 누르면 삭제 요청 이동
            window.location.href = "/game/deleteGame.html?gameName=" + encodeURIComponent(gameName);
        }
        // 아니면 아무 동작 없음
    }
</script>
</body>
</html>
