<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산 결과</title>

<style>
/* ✅ 정산 결과 컨테이너 */
.result-container {
    text-align: center;
    margin: 50px auto;
    width: 90%;
    max-width: 500px;
    background: #ffffff;
    padding: 30px 20px;
    border-radius: 12px;
    box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
    font-family: 'Arial', sans-serif;
}

/* ✅ 정산 결과 제목 */
.result-title {
    font-size: 26px;
    font-weight: bold;
    margin-bottom: 25px;
    color: #333333;
}

/* ✅ 결과 테이블 스타일 */
.result-table {
    width: 100%;
    border-collapse: collapse;
}

.result-table th, .result-table td {
    padding: 15px 10px;
    border: 1px solid #e0e0e0;
    text-align: center;
    font-size: 16px;
}

.result-table th {
    background-color: #3498db; /* 메인 파란색 */
    color: #ffffff;
}

.result-table td {
    background-color: #f8f9fa; /* 연한 회색 */
    color: #333333;
}

/* ✅ 돌아가기 버튼 (길이 자동 조정) */
.back-button {
    display: inline-block;
    padding: 12px 20px; /* 글씨에 맞게 패딩 조정 */
    margin-top: 25px;
    background: #3498db;
    color: white;
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    border-radius: 8px;
    transition: all 0.3s ease-in-out;
    box-shadow: 0px 4px 10px rgba(52, 152, 219, 0.3);
}

.back-button:hover {
    background: #2c80b4;
    transform: scale(1.05);
    box-shadow: 0px 6px 15px rgba(52, 152, 219, 0.5);
}
</style>

</head>
<body>

<div class="result-container">
    <h3 class="result-title">정산 결과</h3>

    <table class="result-table">
        <tr><th>뽑기 실행 횟수</th><td>${result.count}</td></tr>
        <tr><th>총 소모 비용</th><td>${result.totalpurchase} 원</td></tr>
        <tr><th>고등급 아이템 출현 비율</th><td>판당 ${result.highitemrate}</td></tr>
    </table>

    <!-- ✅ 돌아가기 버튼 -->
    <a href="/gacha/gotoGameList.html" class="back-button">게임 목록으로 돌아가기</a>
</div>

</body>
</html>
