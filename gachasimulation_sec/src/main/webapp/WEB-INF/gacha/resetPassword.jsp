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

        /* 입력 필드 스타일 */
        .input-box {
            width: calc(100% - 30px);
            padding: 12px;
            border: 1px solid #ccc;
            font-size: 16px;
            outline: none;
            margin-bottom: 15px;
            border-radius: 5px;
        }

        .input-box:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        /* 버튼 스타일 */
        .btn {
            padding: 10px 15px;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            cursor: pointer;
            border: none;
            display: block;
            width: 100%;
            max-width: 150px;
            margin: 10px auto;
        }

        .btn-primary {
            background-color: #007bff; /* 파란색 */
            color: white;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 10px;
        }

        .btn-tologin {
            background-color: #28a745; /* 초록색 */
            color: white;
        }

        .btn-tologin:hover {
            background-color: #218838;
        }

        .btn-secondary {
            background-color: #ccc;
            color: #333;
        }

        .btn-secondary:hover {
            background-color: #bbb;
        }
    </style>
</head>
<body>

    <div class="result-container">
        <h2>새 비밀번호 입력</h2>
        <form action="/login/setpwd.html" method="post">
        	<input type="hidden" name="userId" value="${userId}"> 
            <input type="password" name="pwd" class="input-box" placeholder="새 비밀번호 입력" required/>
            <button type="submit" class="btn btn-primary">비밀번호 변경</button>
            <div class="btn-container">
                <a href="<%=request.getContextPath()%>/login/login.html" class="btn btn-tologin">로그인 화면</a>
                <a href="<%=request.getContextPath()%>/index/index.html" class="btn btn-secondary">메인 페이지</a>
            </div>
        </form>
    </div>

</body>
</html>
