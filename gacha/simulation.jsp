<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gacha Simulation</title>

<!-- ✅ 외부 CSS 파일 추가 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simulation.css">

</head>
<body>

<div class="container">
    <h1 class="title">✨ Gacha Simulation ✨</h1> <!-- ✅ 타이틀 추가 -->

    <div class="grid-container">
        <c:forEach var="game" items="${gameList}" begin="0" end="3"> <!-- ✅ 4개만 출력 -->
            <a href="../gacha?game=${game}" class="square-box">
                <div class="text-center">
                    <h2>${game}</h2>
                </div>
            </a>
        </c:forEach>
    </div>
</div>

</body>
</html>
