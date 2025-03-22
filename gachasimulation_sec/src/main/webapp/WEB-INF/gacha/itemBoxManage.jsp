<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${game} - 아이템 박스 관리</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 30px auto;
            padding: 15px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            table-layout: fixed;
        }

        th, td {
            padding: 8px 10px;
            border: 1px solid #ddd;
            text-align: center;
            vertical-align: middle;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        input.code-field,
        input.name-field,
        input.price-field {
            width: 150px;
            height: 50px;
            padding: 4px 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input.code-field {
            background-color: #f0f0f0;
            color: #333;
            text-align: center;
        }

        input.price-field {
            -moz-appearance: textfield;
            appearance: textfield;
        }

        input.price-field::-webkit-outer-spin-button,
        input.price-field::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .box-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 4px;
        }

        .common-button {
            min-width: 70px;
            height: 35px;
            padding: 0;
            font-size: 12px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            transition: background-color 0.3s ease;
            margin: 0 2px;
        }

        .edit-button {
            background-color: #007bff;
            color: #fff;
        }

        .edit-button:hover {
            background-color: #0056b3;
        }

        .delete-button {
            background-color: #dc3545;
            color: #fff;
        }

        .delete-button:hover {
            background-color: #a71d2a;
        }

        .back-button {
            background-color: #6c757d;
            color: #fff;
        }

        .back-button:hover {
            background-color: #5a6268;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 5px;
        }

        .bottom-container {
            display: flex; /* 내부 요소들을 가로로 배치 */
            justify-content: space-between; /* 양쪽 끝으로 배치 */
            align-items: center; /* 수직 중앙에 배치 */
            margin-top: 20px;
        }
        .input-box-button {
            margin-left: auto; /* 오른쪽으로 배치 */
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
    }

    .input-box-button:hover {
        background-color: #218838;
    }
    </style>
</head>
<body>

<div class="container">
    <h1>${game} - 아이템 박스 관리</h1>

    <c:if test="${param.success == 'boxDeleted'}">
        <script>alert('아이템 박스가 성공적으로 삭제되었습니다.');</script>
    </c:if>
    <c:if test="${param.error == 'boxHasItems'}">
        <script>alert('해당 박스에 아이템이 존재하여 삭제할 수 없습니다. 먼저 아이템을 삭제하세요.');</script>
    </c:if>

    <!-- 수정 및 삭제 폼 -->
    <form action="${pageContext.request.contextPath}/item/updateBox.html" method="post" enctype="multipart/form-data">
        <table>
            <thead>
                <tr>
                    <th>박스 코드</th>
                    <th>박스 이름</th>
                    <th>가격</th>
                    <th>이미지</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="box" items="${boxList}">
                    <tr>
                        <td>
                            <input type="text" class="code-field" name="code" value="${box.code}" readonly />
                        </td>
                        <td>
                            <input type="text" class="name-field" name="name" value="${box.name}" required />
                        </td>
                        <td>
                            <input type="number" class="price-field" name="price" value="${box.price}" min="0" required /> 원
                        </td>
                        <td>
                            <input type="file" class="image-field" name="image"/>
                        </td>
                        <td>
                            <div class="button-group">
                                <!-- 수정 버튼 -->
                               <button type="button" class="common-button edit-button" onclick="submitEditForm(this)">수정</button>


                                <!-- 삭제 버튼 -->
                                <button type="button" class="common-button delete-button" onclick="submitDeleteForm('${box.code}')">삭제</button>
                            </div>
                        </td>	
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </form>

    <div class="bottom-container">
    	<a href="/gacha?game=${game}"> <button type="button" class="common-button back-button">목록으로 돌아가기</button></a>
    <!--    <button type="button" class="common-button back-button" onclick="window.history.back();">뒤로가기</button> -->
     <a href="../item/inputItembox.html">
                    <button type="button" class="input-box-button">아이템 상자 입력</button>
      </a>
    </div>
    
</div>
<script>
    // 삭제 요청을 JavaScript로 처리
    function submitDeleteForm(boxCode) {
        if (!confirm("정말 삭제하시겠습니까?")) {
            return;
        }

        // 동적으로 폼을 생성
        const form = document.createElement("form");
        form.method = "post";
        form.action = '/item/deleteBox.html';

        const codeInput = document.createElement("input");
        codeInput.type = "hidden";
        codeInput.name = "code";
        codeInput.value = boxCode;

        form.appendChild(codeInput);
        document.body.appendChild(form);
        form.submit();
    }
    function submitEditForm(button) {
        const row = button.closest("tr"); // 현재 버튼이 속한 행(tr) 찾기
        const code = row.querySelector(".code-field").value;
        const name = row.querySelector(".name-field").value;
        const price = row.querySelector(".price-field").value;
        const image = row.querySelector(".image-field").files[0]; // 이미지 파일 선택

        if (!confirm("수정하시겠습니까?")) {
            return;
        }

        // 동적으로 폼을 생성
        const form = document.createElement("form");
        form.method = "post";
        form.action = '/item/updateBox.html';
        form.enctype = "multipart/form-data";  // 파일 업로드를 위해 enctype 설정

        // 입력 필드 추가
        form.appendChild(createHiddenInput("code", code));
        form.appendChild(createHiddenInput("name", name));
        form.appendChild(createHiddenInput("price", price));

        // 이미지 파일 추가
        if (image) {
            const imageInput = document.createElement("input");
            imageInput.type = "file";
            imageInput.name = "image";
            imageInput.files = row.querySelector(".image-field").files;  // 선택된 이미지 파일
            form.appendChild(imageInput);
        }

        // 폼을 동적으로 추가하고 제출
        document.body.appendChild(form);
        form.submit();
    }

    // hidden input 생성 함수
    function createHiddenInput(name, value) {
        const input = document.createElement("input");
        input.type = "hidden";
        input.name = name;
        input.value = value;
        return input;
    }

</script>

</body>
</html>
