<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.square-box {
    aspect-ratio: 1 / 1;
    background-color: #bfdbfe; /* bg-blue-200 */
    padding: 1.5rem; /* p-6 */
    display: flex;
    align-items: center;
    justify-content: center;
    outline: none;
    transition: background-color 0.3s; /* Smooth background color transition */
    border-radius: 0.375rem; /* rounded */
    text-decoration: none; /* 새로 추가된 스타일: 링크 밑줄 제거 */
}
/* grid-container 가운데 정렬 */
.grid-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr); /*한줄당 2개씩 배치*/
    gap: 1rem;
    justify-content: center; /* 가운데 정렬 */
    align-items: center; /* 가운데 정렬 */
    margin: auto; /* 자동 마진으로 중앙 정렬 */
    padding: 2rem; /* 양쪽 여백 추가 */
    text-align: center;
}

</style>
</head>
<body>

<div class="container">
    <div class="grid-container">
    <c:forEach var="game" items="${gameList }">
        <a href="../gacha?game=${game }" class="square-box">
            <div class="text-center">
                <h2 class="text-xl font-semibold">${game}</h2>
            </div>
        </a>
    </c:forEach>
    </div>
</div>
</body>
</html>