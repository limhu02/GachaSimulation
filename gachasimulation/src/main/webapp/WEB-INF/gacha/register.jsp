<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
    /* 전체 페이지 스타일 */
    body {
        font-family: 'Arial', sans-serif;
        text-align: center;
        background-color: #ffffff;
    }

    /* 컨테이너 스타일 */
    .register-container {
        width: 400px;
        margin: 50px auto;
        padding: 30px;
        border: 1px solid #ddd;
        border-radius: 10px;
        background-color: #fff;
        box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    }

    /* 제목 스타일 */
    h3 {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    /* 입력 필드 스타일 */
    .input-box {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid green;
        border-radius: 5px;
        font-size: 16px;
        text-align: center;
        box-sizing: border-box;
    }

    /* ID 입력 필드와 중복 체크 버튼을 같은 줄에 배치 */
    .id-input-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .id-input-box {
        width: 70%; /* ID 입력 필드 너비 줄임 */
    }

    .check-btn {
        width: 25%; /* 중복 확인 버튼 너비 조정 */
        padding: 12px;
        background-color: orange;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        margin-left: 5px;
    }

    .check-btn:hover {
        background-color: darkorange;
    }

    /* 가입하기 & 취소 버튼 */
    .button-group {
        display: flex;
        justify-content: center;
        margin-top: 20px;
        gap: 10px;
    }

    .submit-btn {
        width: 70%;
        padding: 14px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
    }

    .submit-btn:hover {
        background-color: #45a049;
    }

    .cancel-btn {
        width: 20%;
        padding: 14px;
        background-color: white;
        color: orange;
        border: 1px solid orange;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
    }

    .cancel-btn:hover {
        background-color: #FDEDEC;
    }
</style>
</head>
<body>

    <div class="register-container">
        <h3>회원가입</h3>

        <form action="/entry/register.html" method="post" name="frm"
            onsubmit="return check();">

            <input type="hidden" name="idChecked" value="" />

            <div class="id-input-container">
                <input type="text" name="userId" class="input-box id-input-box" placeholder="ID를 입력하세요" required>
                <button type="button" class="check-btn" onclick="idCheck();">중복 확인</button>
            </div>

            <input type="password" name="userPwd" class="input-box" placeholder="비밀번호를 입력하세요" required>
            <input type="password" name="confirmPwd" class="input-box" placeholder="비밀번호 확인" required>
            <input type="text" name="name" class="input-box" placeholder="이름을 입력하세요" required>
            <input type="email" name="email" class="input-box" placeholder="이메일을 입력하세요" required>

            <div class="button-group">
                <button type="submit" class="submit-btn">가입하기</button>
                <button type="button" class="cancel-btn" onclick="history.back();">취 소</button>
            </div>

        </form>
    </div>

    <script type="text/javascript">
        function check() {
            if (document.frm.userPwd.value !== document.frm.confirmPwd.value) {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            }
        }

        function idCheck() {
            var userId = document.frm.userId.value;
            if (userId === '') {
                alert("아이디를 입력하세요.");
                document.frm.userId.focus();
                return false;
            }

            var url = "/entry/idcheck.html?USER_ID=" + encodeURIComponent(userId);
            window.open(url, "_blank_", "width=450,height=200");
        }
    </script>

</body>
</html>
