<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>뽑기 결과</title>
    <style>
        /* ✅ 결과 컨테이너 */
        .result-container {
            display: grid;
            gap: 15px;
            margin-top: 20px;
            justify-content: center;
            width: 100%;
            max-width: 1500px;
            margin-left: auto;
            margin-right: auto;
        }

        /* ✅ 아이템 박스 */
        .item-box {
            border: 2px solid #333;
            padding: 20px;
            text-align: center;
            width: 750px;
            background: #f9f9f9;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out;
        }

        /* ✅ 호버 효과 */
        .item-box:hover {
            transform: scale(1.02);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }

        .item-box img {
            width: 500px;
            height: 500px;
            border-radius: 10px;
            object-fit: cover;
            margin-bottom: 20px;
        }

        .item-number {
            font-weight: bold;
            color: red;
        }

        /* ✅ 버튼 공통 스타일 */
        .button-container {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .btn {
            padding: 12px 24px;
            font-size: 18px;
            font-weight: bold;
            color: #fff;
            text-decoration: none;
            border-radius: 8px;
            transition: transform 0.2s, box-shadow 0.2s;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* ✅ 정산하기 버튼 */
        .btn-calculate {
            background: linear-gradient(135deg, #28a745, #218838);
        }

        .btn-calculate:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(40, 167, 69, 0.5);
        }

        /* ✅ 다시 뽑기 버튼 */
        .btn-retry {
            background: linear-gradient(135deg, #007bff, #0056b3);
        }

        .btn-retry:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 123, 255, 0.5);
        }

        /* ✅ 페이지 타이틀 */
        h2 {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            margin-top: 20px;
            color: #333;
        }

    </style>
</head>
<body>

    <h2>뽑기 결과</h2>

    <div class="result-container">
        <div class="item-box">
            <img alt="" src="${pageContext.request.contextPath}/itemImage/${item.image }"/>
            <h2>${item.name}</h2>
            <h4>확률: <fmt:formatNumber value="${item.probability * 100}" pattern="#.##"/>%</h4>
        </div>
    </div>

    <!-- ✅ 버튼 영역 -->
    <div class="button-container">
    <a href="../gacha/gacha1.html?code=${code}" class="btn btn-retry">다시 뽑기</a>
        <a href="../gacha/result.html" class="btn btn-calculate">정산하기</a>
        
    </div>

</body>
</html>
