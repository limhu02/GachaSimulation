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

    <!-- ✅ 뽑기 결과 제목 (가운데 정렬) -->
    <h2 class="page-title">뽑기 결과</h2>

    <div class="result-container">
        <c:if test="${empty itemList}">
            <p>뽑힌 아이템이 없습니다.</p>
        </c:if>
        <c:forEach var="item" items="${itemList}" varStatus="loop">
    <c:set var="probability" value="${item.probability * 100}" /> <!-- 확률 계산 -->
    <c:set var="boxClass" value="item-box" /> <!-- 기본 클래스 설정 -->

    <!-- ✅ 7% 이하 → rare-item (빨간색) -->
    <c:if test="${probability <= 7}">
        <c:set var="boxClass" value="item-box rare-item" />
    </c:if>

    <!-- ✅ 10% 이상 → high-item (파란색) -->
    <c:if test="${probability >= 10}">
        <c:set var="boxClass" value="item-box high-item" />
    </c:if>

    <div class="${boxClass}">
        <p class="item-number">${loop.index + 1}번째</p>
        <img alt="" src="${pageContext.request.contextPath}/itemImage/${item.image }"/>
        <p>${item.name}</p>
        <p>확률: <fmt:formatNumber value="${probability}" pattern="#.##"/>%</p>
    </div>
</c:forEach>
    </div>

    <!-- ✅ 버튼 컨테이너 (하단 배치) -->
    <div class="result-buttons">
        <a href="/gacha" class="retry-button">다시 뽑기</a>
        <a href="../gacha/result.html" class="calculate-button">정산하기</a>
    </div>

</body>
</html>
