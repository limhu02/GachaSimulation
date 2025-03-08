<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>결과 페이지</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            text-align: center;
            background-color: #f4f4f4;
        }

        /* 컨테이너 스타일 */
        .result-container {
            width: 400px;
            margin: 100px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        /* 제목 스타일 */
        h2 {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        /* 결과 메시지 스타일 */
        .result-message {
            font-size: 18px;
            color: #333;
            margin-bottom: 20px;
        }

        /* 버튼 스타일 */
        .btn {
            display: inline-block;
            padding: 10px 15px;
            margin-top: 10px;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #4CAF50;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #45a049;
        }

        .btn-secondary {
            background-color: #ccc;
            color: #333;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #bbb;
        }
    </style>
</head>
<body>

    <div class="result-container">
        <h2>결과 확인</h2>
        
        <p class="result-message">
            <%= request.getAttribute("message") != null ? request.getAttribute("message") : "결과를 찾을 수 없습니다." %>
        </p>

        <a href="<%=request.getContextPath()%>/login/login.html" class="btn btn-primary">로그인 화면으로 이동</a>
        <a href="<%=request.getContextPath()%>/index/index.html" class="btn btn-secondary">메인 페이지</a>
    </div>

</body>
</html>
