<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            text-align: center;
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 화면 높이 꽉 채우기 */
            margin: 0;
        }

        /* 로그인 컨테이너 */
        .login-container {
            width: 450px;
            padding: 50px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        /* 제목 스타일 */
        .login-container h2 {
            font-size: 30px;
            margin-bottom: 20px;
        }

        /* 입력 필드 스타일 */
        .input-box {
            width: 100%;
            padding: 15px;
            border: none;
            border-bottom: 2px solid #ddd;
            font-size: 18px;
            outline: none;
            text-align: left;
            margin-bottom: 20px;
        }

        .input-box:focus {
            border-bottom: 2px solid #4CAF50;
        }

        /* 로그인 버튼 */
        .login-btn {
            width: 100%;
            padding: 18px;
            background-color: #4CAF50; 
            color: black;
            font-size: 20px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

        .login-btn:hover {
            background-color: #45a049;
        }

        /* 하단 링크 스타일 */
        .bottom-links {
            margin-top: 20px;
            font-size: 16px;
            display: flex;
            justify-content: center;
            gap: 20px;
            border-top: 1px solid #ddd;
            padding-top: 15px;
        }

        .bottom-links a, .home-btn {
            text-decoration: none;
            color: #666;
            font-size: 16px;
            padding: 10px 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f8f8f8;
            display: inline-block;
            font-weight: bold;
        }

        .bottom-links a:hover, .home-btn:hover {
            background-color: #eee;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>로그인</h2>
        <p>로그인 하시면 모든 서비스를 이용하실 수 있습니다.<br>
           아직 회원이 아니시라면 회원가입을 해주세요.</p>

        <form action="/login/login.html" method="post">
            <input type="text" name="user_id" class="input-box" placeholder="ID를 입력하세요" required>
            <input type="password" name="user_pwd" class="input-box" placeholder="비밀번호를 입력하세요" required>
            <button type="submit" class="login-btn">로그인</button>
        </form>

        <div class="bottom-links">
            <a href="/entry/register.html">회원가입</a>
            <a href="/login/find.html">아이디/비밀번호 찾기</a>
            <a href="/index/index.html" class="home-btn">홈으로</a>
        </div>
    </div>

</body>
</html>
