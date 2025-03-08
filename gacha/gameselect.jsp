<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가챠 선택</title>

    <!-- ✅ 외부 CSS 파일 추가 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/gameselect.css">
</head>
<body>

    <!-- ✅ 헤더 -->
    <div class="header">
        <div class="title">${game}</div>
        <button class="info-button">아이템 정보 확인하기</button>
    </div>

    <!-- ✅ 2x2 가챠 선택 레이아웃 -->
    <div class="container">
        <div class="grid-container">
            <c:forEach var="gameBox" items="${boxList}" begin="0" end="3"> <!-- ✅ 4개만 출력 -->
                <div class="box">
                    <p>${gameBox.name} 뽑기<br>(가격: ${gameBox.price}원)</p>
                    <div class="buttons">
                        <button class="draw-button">1회 뽑기</button>
                        <a href="/gacha/gacha10?code=${gameBox.code}">
                            <button class="draw-button">10회 뽑기</button>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- ✅ 뒤로가기 버튼 -->
    <div class="bottom-container">
        <button class="back-button" onclick="window.history.back();">뒤로가기</button>
    </div>

</body>
</html>
