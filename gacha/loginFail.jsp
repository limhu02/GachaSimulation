<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인 실패</title>
    <style>
        /* 로그인 실패 페이지 스타일 */
        .login-fail-container {
            width: 400px;
            margin: 150px auto;
            padding: 30px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .login-fail-container h2 {
            font-size: 24px;
            color: #d32f2f;
            margin-bottom: 10px;
        }

        .login-fail-container p {
            font-size: 16px;
            color: #666;
            margin-bottom: 15px;
        }

        .button-group {
            margin-top: 20px;
        }

        .retry-btn, .home-btn {
            width: 150px;
            padding: 10px;
            margin: 5px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .retry-btn {
            background-color: #f44336;
            color: white;
            border: none;
        }

        .retry-btn:hover {
            background-color: #d32f2f;
        }

        .home-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
        }

        .home-btn:hover {
            background-color: #388E3C;
        }
    </style>
</head>
<body>

    <div class="login-fail-container">
        <h2>로그인 실패</h2>
        <p>아이디 또는 비밀번호가 일치하지 않습니다.</p>
        <p>다시 시도해 주세요.</p>

        <div class="button-group">
   			<button onclick="location.href='/login/login.html'" class="retry-btn">다시 로그인</button>
    		<button onclick="location.href='/index/index.html'" class="home-btn">홈으로</button>
		</div>
    </div>

</body>
</html>

