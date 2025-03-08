<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입 완료</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            text-align: center;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 100px auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
        }

        p {
            font-size: 16px;
            color: #555;
        }

        .btn-container {
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            border-radius: 6px;
            transition: 0.3s;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>🎉 회원가입 완료!</h2>
    <p>회원가입이 정상적으로 완료되었습니다.</p>

    <div class="btn-container">
        <a href="/login/login.html" class="btn btn-primary">🔑 로그인</a>
        <a href="/index/index.html" class="btn btn-secondary">🏠 홈으로 이동</a>
    </div>
</div>

</body>
</html>

