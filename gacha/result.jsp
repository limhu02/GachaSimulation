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
    width: 80%;
    max-width: 600px;
    background: #ffffff;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

/* ✅ 정산 결과 제목 */
.result-title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #333;
}

/* ✅ 결과 테이블 스타일 */
.result-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}

.result-table th, .result-table td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: center;
}

.result-table th {
    background: #007bff;
    color: white;
    font-weight: bold;
}

.result-table td {
    background: #f9f9f9;
}

/* ✅ 홈으로 가기 버튼 */
.home-button {
    display: inline-block;
    padding: 12px 24px;
    margin-top: 20px;
    background: linear-gradient(135deg, #0066ff, #0099ff);
    color: white;
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    border-radius: 8px;
    transition: transform 0.2s, box-shadow 0.2s;
    box-shadow: 0px 4px 8px rgba(0, 102, 255, 0.3);
}

.home-button:hover {
    transform: scale(1.1);
    box-shadow: 0px 6px 12px rgba(0, 102, 255, 0.5);
}
</style>

</head>
<body>

<div class="result-container">
    <h3 class="result-title">정산 결과</h3>

    <table class="result-table">
        <tr><th>뽑기 실행 횟수</th><td>${result.count} 회</td></tr>
        <tr><th>총 소모 비용</th><td>${result.totalpurchase} 원</td></tr>
        <tr><th>고등급 아이템 출현 비율</th><td>판당 ${result.highitemrate} %</td></tr>
    </table>

    <!-- ✅ 홈으로 가기 버튼 추가 -->
    <a href="/" class="home-button">홈으로 가기</a>
</div>

</body>
</html>
