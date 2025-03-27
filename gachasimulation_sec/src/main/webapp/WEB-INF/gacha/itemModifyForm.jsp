<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이템 정보(관리자)</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
        }

        h3 {
            margin-bottom: 25px;
            color: #333;
            font-size: 24px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 14px 10px;
            border-bottom: 1px solid #eee;
            text-align: left;
        }

        th {
            width: 30%;
            background-color: #fafafa;
            color: #333;
            font-weight: 600;
        }

        input[type="text"],
        input[type="number"],
        input[type="file"] {
            width: 95%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            background-color: #fdfdfd;
        }

        input[readonly] {
            background-color: #f5f5f5;
        }

        /* 버튼 한 줄 배치 */
        .button-row {
            margin-top: 30px;
            display: flex;
            justify-content: center;  /* 가운데 정렬 */
            gap: 10px;                /* 버튼 간격 */
        }

        .common-button {
            padding: 12px 24px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 100px;
        }

        .edit-button {
            background-color: #3498db;
            color: #ffffff;
        }

        .edit-button:hover {
            background-color: #2c80b4;
        }

        .delete-button {
            background-color: #e74c3c;
            color: #ffffff;
        }

        .delete-button:hover {
            background-color: #c0392b;
        }

        .back-button {
            background-color: #7f8c8d;
            color: #ffffff;
        }

        .back-button:hover {
            background-color: #606c76;
        }

        .error-text {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 5px;
        }
    </style>
</head>
<body>

<div class="container">
    <h3>아이템 정보 (관리자)</h3>

    <form:form modelAttribute="item" method="post" action="../item/update.html" enctype="multipart/form-data">
    		 <input type="hidden" name="code" value="${item.code}" />
            <input type="hidden" name="image" value="${item.image}" />
    
        <table>
           
            <tr>
                <th>아이템</th>
                <td><form:input path="name"/></td>
            </tr>

            <tr>
                <th>소속 게임</th>
                <td>${box.game}</td>
            </tr>

            <tr>
                <th>출현 상자</th>
                <td>${item.box_code}</td>
            </tr>

            <tr>
                <th>등급</th>
                <td><form:input path="rate" /></td>
            </tr>

            <tr>
                <th>확률</th>
                <td><form:input path="probability" /></td>
            </tr>

            <tr>
                <th>이미지</th>
                <td>
                    <input type="file" name="imagefile" />
                    <div class="error-text"><form:errors path="imagefile" /></div>
                </td>
            </tr>
        </table>

        <!-- 버튼 3개를 같은 줄에 배치 -->
        <div class="button-row">
            <!-- 수정 버튼 -->
            <input type="submit" class="common-button edit-button" value="수정" />

            <!-- 삭제 버튼: 별도 form 으로 감싸지 않고 버튼으로 변경 (JS로 submit) -->
            <button type="button" class="common-button delete-button" onclick="deleteItem()">삭제</button>

            <!-- 목록으로 돌아가기 -->
            <a href="../item/itemList.html" class="common-button back-button">목록</a>
        </div>
    </form:form>

    <!-- 별도 삭제 폼 (JS에서 trigger됨) -->
    <form id="deleteForm" action="../item/delete.html" method="post" style="display: none;">
        <input type="hidden" name="code" value="${item.code}" />
    </form>
</div>

<script type="text/javascript">
    function deleteItem() {
        if (confirm("정말로 삭제하시겠습니까?")) {
            document.getElementById('deleteForm').submit();
        }
    }
</script>

</body>
</html>
