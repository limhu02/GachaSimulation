<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>아이디 / 비밀번호 찾기</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            text-align: center;
            background-color: #ffffff;
        }

        /* 컨테이너 스타일 */
        .container {
            display: flex;
            justify-content: center;
            gap: 60px;
            margin-top: 80px;
            flex-wrap: wrap; /* 작은 화면에서 줄바꿈 */
        }

        .box {
            width: 400px;
            padding: 30px;
            border: 3px solid black;
            border-radius: 12px;
            background-color: #fff;
            box-shadow: 4px 4px 15px rgba(0, 0, 0, 0.2);
        }

        /* 제목 스타일 */
        h2 {
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* 입력 필드 스타일 */
        .input-box {
            width: 100%;
            padding: 14px;
            margin: 12px 0;
            border: 2px solid #4CAF50;
            border-radius: 8px;
            font-size: 18px;
            text-align: center;
            box-sizing: border-box;
        }

        /* 버튼 스타일 */
        .submit-btn {
            width: 100%;
            padding: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 20px;
            cursor: pointer;
            margin-top: 12px;
        }

        .submit-btn:hover {
            background-color: #45a049;
        }

        /* 취소 버튼 스타일 */
        .cancel-btn {
            width: 250px;
            padding: 16px;
            background-color: #ccc;
            color: black;
            border: none;
            border-radius: 8px;
            font-size: 20px;
            cursor: pointer;
            margin-top: 30px;
        }

        .cancel-btn:hover {
            background-color: #bbb;
        }

        /* 버튼 컨테이너 (하단 중앙 정렬) */
        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
                gap: 40px;
            }

            .cancel-btn {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <!-- 아이디 찾기 -->
        <div class="box">
            <h2>아이디 찾기</h2>
            <form action="/login/find_id.html" method="post">
                <input type="email" name="email" class="input-box" placeholder="이메일을 입력하세요" required>
                <input type="text" name="name" class="input-box" placeholder="닉네임을 입력하세요" required>
                <button type="submit" class="submit-btn">ID 찾기</button>
            </form>
        </div>

        <!-- 비밀번호 찾기 -->
        <div class="box">
            <h2>비밀번호 찾기</h2>
            <form action="/login/find_pwd.html" method="post">
            	<input type="text" name="user_id" class="input-box" placeholder="ID를 입력하세요" required>
                <input type="text" name="name" class="input-box" placeholder="닉네임을 입력하세요" required>
                <input type="email" name="email" class="input-box" placeholder="이메일을 입력하세요" required>
                <button type="submit" class="submit-btn">비밀번호 찾기</button>
            </form>
        </div>
    </div>

    <!-- 취소 버튼 (두 박스 하단 중앙) -->
    <div class="button-container">
        <button type="button" class="cancel-btn" onclick="history.back();">취소</button>
    </div>

</body>
</html>
