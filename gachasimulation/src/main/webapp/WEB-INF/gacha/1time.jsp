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
    gap: 15px;
    margin-top: 20px;
    justify-content: center;
    width: 100%;
    max-width: 1500px; /* 필요에 따라 조정 */
    margin-left: auto;
    margin-right: auto;
}

.item-box {
    border: 2px solid black;
    padding: 10px;
    text-align: center;
    width: 750px;
}

        .item-box img {
            width: 500px;
            height: 500px;
        }
        .item-number {
            font-weight: bold;
            color: red;
        }
    </style>
</head>
<body>

    <div align="center"><h2>뽑기 결과</h2></div>

    <div class="result-container">
   
           <div class="item-box">
             <img alt="" src="${pageContext.request.contextPath}/itemImage/${item.image }"/>
               <h2>${item.name}</h2>
              <h4>확률: <fmt:formatNumber value="${item.probability * 100}" pattern="#.##"/>%</h4>
           </div>
    </div>
    <div align="center">
    <a href="../gacha/result.html">정산하기</a>
    <a href="../gacha/gacha1?code=${code}">다시 뽑기</a>
    </div>

    

</body>
</html>
