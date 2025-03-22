<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가입자 정보 수정</title>
    <style>
        /* 전체 페이지 스타일 */
        .mypage-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #f9f9f9;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
        }

        /* 입력 필드 스타일 */
        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .input-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .input-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* 프로필 이미지 스타일 */
        .profile-image-container {
            margin-bottom: 20px;
        }

        .profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #ccc;
        }

        /* 버튼 스타일 */
        .buttons {
            margin-top: 20px;
        }

        .buttons button,
        .buttons a {
            display: inline-block;
            padding: 10px 15px;
            margin: 5px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .save-btn {
            background-color: #4CAF50;
            color: white;
        }

        .cancel-btn {
            background-color: #ccc;
            color: black;
        }

        .save-btn:hover {
            background-color: #45a049;
        }

        .cancel-btn:hover {
            background-color: #bbb;
        }
    </style>
</head>
<body>

<div class="mypage-container">
    <h2>가입자 정보 수정</h2>

    <!-- 프로필 이미지 -->
    <div class="profile-image-container">
        <img src="${pageContext.request.contextPath}/upload/${userInfo.profile_image}" 
             alt="기본 프로필" class="profile-image">
    </div>

    <!-- 가입자 정보 수정 폼 -->
    <form action="${pageContext.request.contextPath}/admin/update.html" method="post" enctype="multipart/form-data">
        <div class="input-group">
            <label>ID</label>
            <input type="text" name="user_id" value="${userInfo.user_id}" readonly>
        </div>
        <div class="input-group">
            <label>이름</label>
            <input type="text" name="name" value="${userInfo.name}">
        </div>
        <div class="input-group">
            <label>이메일</label>
            <input type="text" name="email" value="${userInfo.email}">
        </div>
        <div class="input-group">
            <label>프로필 사진 변경</label>
            <input type="file" name="profile_image" accept="image/*">
        </div>
        <div class="input-group">
            <label>계정 권한 수정</label>
             <select id="auth" name="auth">
      			  <option value="ROLE_MEMBER">일반 회원</option>
       				 <option value="ROLE_ADMIN">관리자</option>
   			 </select>
        </div>
        

        <div class="buttons">
            <button type="submit" class="save-btn">수정 완료</button>
            <button  type="button" class="cancel-btn" onclick="window.history.back();">취소</button>
        </div>
    </form>
</div>

</body>
</html>
