<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>뽑기 결과</title>
    <style>
        .result-container {
    display: grid;
    grid-template-columns: repeat(5, minmax(150px, 1fr)); /* 한 줄에 5개 */
    gap: 15px;
    margin-top: 20px;
    justify-content: center;
    width: 100%;
    max-width: 800px; /* 필요에 따라 조정 */
    margin-left: auto;
    margin-right: auto;
}

.item-box {
    border: 2px solid black;
    padding: 10px;
    text-align: center;
    width: 150px;
}

        .item-box img {
            width: 100px;
            height: 100px;
        }
        .item-number {
            font-weight: bold;
            color: red;
        }
    </style>
</head>
<body>

    <h2>뽑기 결과</h2>

    <div class="result-container">
    <c:if test="${empty itemList}">
    <p>뽑힌 아이템이 없습니다.</p>
</c:if>
        <c:forEach var="item" items="${itemList}" varStatus="loop">
            <div class="item-box">
                <p class="item-number">${loop.index + 1}번째</p>
              <img alt="" src="${pageContext.request.contextPath}/itemImage/${item.image }"/>
                <p>${item.name}</p>
               <p>확률: <fmt:formatNumber value="${item.probability * 100}" pattern="#.##"/>%</p>
            </div>
        </c:forEach>
    </div>
    <div align="center">
    <a href="../gacha/result.html">정산하기</a>
    </div>

    <a href="/gacha/gacha10.html?code=${code}">다시 뽑기</a>

</body>
</html>
