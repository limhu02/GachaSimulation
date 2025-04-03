<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>계정 중복 확인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 30px;
        }
        input[type="text"] {
            padding: 5px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"], input[type="button"] {
            padding: 5px 10px;
            margin: 5px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
        }
        input[type="button"] {
            background-color: #008CBA;
            color: white;
        }
    </style>
</head>
<body>

<h2>계정 중복 확인</h2>

<!-- 중복 검사 폼 -->
<form action="/entry/idcheck.html">
    계 정 : <input type="text" name="USER_ID" value="${ID }" required />
    <input type="submit" value="중복 검사" />
</form>

<!-- 검사 결과 처리 -->
<c:choose>
    <c:when test="${DUP == 'NO' }">
        <p style="color: green;"><strong>${ID}</strong>는 사용 가능합니다.</p>
        <input type="button" value="사용" onclick="idOk('${ID}')" />
    </c:when>
    <c:otherwise>
        <p style="color: red;"><strong>${ID}</strong>는 이미 사용 중입니다.</p>
        <script type="text/javascript">
            if (window.opener && !window.opener.closed) {
                var parentDoc = window.opener.document;
                var userIdField = parentDoc.querySelector("input[name='userId']");
                if (userIdField) {
                    userIdField.value = "";
                }
            }
        </script>
    </c:otherwise>
</c:choose>

<script type="text/javascript">
function idOk(userId) {
    if (!window.opener || window.opener.closed) {
        alert("부모 창이 닫혀 있거나 접근할 수 없습니다.");
        return;
    }

    var parentDoc = window.opener.document;

    // **ID 입력 필드 찾기 및 값 설정**
    var userIdInput = parentDoc.querySelector("input[name='userId']");
    if (userIdInput) {
        userIdInput.value = userId;
        userIdInput.readOnly = true; // 수정 불가 처리
    } else {
        alert("부모 창에서 ID 입력 필드를 찾을 수 없습니다.");
        console.error("부모 창 요소들:", parentDoc.body.innerHTML); // 디버깅용 로그 출력
        return;
    }

    // **중복 확인 완료 상태 값 설정**
    var idCheckedInput = parentDoc.querySelector("input[name='idChecked']");
    if (idCheckedInput) {
        idCheckedInput.value = "yes";
    }

    window.close(); // 팝업 창 닫기
}
</script>

</body>
</html>
