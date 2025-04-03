<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴 완료</title>
    <style>
        .deleted-container {
            max-width: 600px;
            margin: 100px auto;
            padding: 30px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 10px;
            background: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #E74C3C;
        }
        p {
            font-size: 16px;
            margin-top: 20px;
            color: #555;
        }
        .home-btn {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            font-size: 16px;
            text-decoration: none;
            background-color: #3498DB;
            color: white;
            border-radius: 5px;
        }
        .home-btn:hover {
            background-color: #2980B9;
        }
    </style>
</head>
<body>

<div class="deleted-container">
    <h2>회원 탈퇴 완료</h2>
    <p>회원 탈퇴가 정상적으로 처리되었습니다.</p>
    <p>그동안 이용해주셔서 감사합니다.</p>
    <a href="${pageContext.request.contextPath}/" class="home-btn">홈으로 이동</a>
</div>

</body>
</html>
