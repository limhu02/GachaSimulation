<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>(관리자) 아이템 등록</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 80px auto;
            background: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.05);
        }

        h3 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            vertical-align: middle;
            text-align: left;
            padding: 12px 0;
            font-size: 14px;
        }

        table th {
            width: 140px;
            color: #555;
        }

        table td {
            width: calc(100% - 140px);
        }

        /* ✅ 기본 입력 필드 */
        input[type="text"],
        input[type="file"],
        select {
            width: 100%;
            padding: 10px 12px;
            border-radius: 6px;
            border: 1px solid #ddd;
            font-size: 14px;
            box-sizing: border-box;
            background-color: #fafafa;
        }

        /* ✅ 출현 확률과 등급 필드는 더 짧게! */
        .small-input {
            width: 120px !important;
            padding: 10px 12px;
            font-size: 14px;
        }

        .error-text {
            color: red;
            font-size: 12px;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        button, input[type="submit"], a.btn {
            flex: 1;
            padding: 12px;
            font-size: 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-align: center;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .submit-btn {
            background-color: #007bff;
            color: #fff;
            margin-right: 10px;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }

        .cancel-btn {
            background-color: #9b111e;
            color: #fff;
        }

        .cancel-btn:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<div class="container">
    <h3>아이템 등록 (관리자 전용)</h3>

    <form:form action="../item/inputResult.html" method="post" enctype="multipart/form-data" modelAttribute="item" name="itemFrm">
        <table>
            <tr>
                <th>아이템 코드</th>
                <td>
                    <form:input path="code" />
                    <div class="error-text"><form:errors path="code" /></div>
                </td>
            </tr>
            <tr>
                <th>아이템 이름</th>
                <td>
                    <form:input path="name" />
                    <div class="error-text"><form:errors path="name" /></div>
                </td>
            </tr>
            <tr>
                <th>이미지 업로드</th>
                <td>
                    <input type="file" name="imagefile" />
                    <div class="error-text"><form:errors path="imagefile" /></div>
                </td>
            </tr>
            <tr>
                <th>출현 상자</th>
                <td>
                    <form:select path="box_code">
                        <c:forEach var="box" items="${boxlist}">
                            <form:option value="${box.code}">${box.name}</form:option>
                        </c:forEach>
                    </form:select>
                </td>
            </tr>
            <tr>
                <th>출현 확률 (%)</th>
                <td>
                    <form:input path="probability" cssClass="small-input" />
                    <div class="error-text"><form:errors path="probability" /></div>
                </td>
            </tr>
            <tr>
                <th>등급</th>
                <td>
                    <form:input path="rate" cssClass="small-input" />
                    <div class="error-text"><form:errors path="rate" /></div>
                </td>
            </tr>
        </table>

        <div class="button-group">
            <input type="submit" value="등록하기" class="submit-btn" />

            <!-- ✅ 취소 버튼은 아이템 목록으로 이동 -->
            <a href="${pageContext.request.contextPath}/item/itemList.html" class="cancel-btn btn">취 소</a>
        </div>
    </form:form>
</div>

</body>
</html>
