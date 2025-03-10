<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>뽑기 결과</title>

    <!-- ✅ 외부 CSS 추가 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/10time.css">
</head>
<body>

    <h2 class="page-title">뽑기 결과</h2>

    <div class="result-container">
        <c:if test="${empty itemList}">
            <p>뽑힌 아이템이 없습니다.</p>
        </c:if>

        <c:forEach var="item" items="${itemList}" varStatus="loop">
            <div class="item-box">
                <p class="item-number">${loop.index + 1}번째</p>
                <img alt="" src="${pageContext.request.contextPath}/itemImage/${item.image}" />
                <p>${item.name}</p>
                <p>확률: <fmt:formatNumber value="${item.probability * 100}" pattern="#.##"/>%</p>
            </div>
        </c:forEach>
    </div>

    <div class="result-buttons">
        <a href="${pageContext.request.contextPath}/gacha/gacha10.html?code=${code}" class="retry-button">다시 뽑기</a>
        <a href="${pageContext.request.contextPath}/gacha/result.html" class="calculate-button">정산하기</a>
    </div>

</body>
</html>
