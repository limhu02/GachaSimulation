<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 수정</title>
    <style>
        /* 전체 배경 */
        body {
            margin: 0;
            padding: 0;
            background-color: #ffffff; 
            font-family: 'Arial', sans-serif;
        }

        /* 메인 컨테이너 */
        .mypage-container {
            max-width: 500px;
            margin: 0;
            padding: 40px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: fadeIn 0.5s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            margin-bottom: 30px;
            font-size: 28px;
            color: #333;
        }

        /* 프로필 이미지 */
        .profile-image-container {
            margin-bottom: 20px;
        }

        .profile-image {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #337ab7;
            background-color: #f5f5f5;
        }
        
	/* ✅ 프로필 스타일 */
	.profile {
    	display: flex;
    	flex-direction: column;
    	align-items: center;
    	margin-bottom: 20px;
	}

	/* ✅ 프로필 이미지 스타일 */
	.profile-img {
    	width: 120px;
    	height: 120px;
    	border-radius: 50%;
    	object-fit: cover;
    	border: 3px solid #337ab7;
    	background-color: #f5f5f5;
   		margin-bottom: 10px;
	}

        /* 입력 그룹 */
        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .input-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #555;
        }

        .input-group input[type="text"],
        .input-group input[type="file"] {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        .input-group input[type="text"]:focus,
        .input-group input[type="file"]:focus {
            border-color: #337ab7;
            outline: none;
        }

        /* 버튼 영역 */
        .buttons {
            margin-top: 30px;
            display: flex;
            justify-content: space-between;
        }

        .buttons button,
        .buttons a {
            flex: 1;
            padding: 12px 0;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s, transform 0.2s;
            margin: 0 5px;
        }

        .save-btn {
            background-color: #337ab7;
            color: #fff;
        }

        .save-btn:hover {
            background-color: #286090;
            transform: translateY(-2px);
        }

        .cancel-btn {
            background-color: #ddd;
            color: #333;
        }

        .cancel-btn:hover {
            background-color: #bbb;
            transform: translateY(-2px);
        }

        /* 반응형 */
        @media (max-width: 600px) {
            .mypage-container {
                margin: 20px;
                padding: 20px;
            }

            .buttons {
                flex-direction: column;
            }

            .buttons button,
            .buttons a {
                margin: 5px 0;
            }
        }
    </style>
</head>
<body>

<div class="mypage-container">
    <h2>마이페이지 수정</h2>

    <!-- 프로필 이미지 -->
    <div class="profile-image-container">
       <c:choose>
                <c:when test="${not empty userInfo.profile_image}">
                    <img class="profile-img" src="${pageContext.request.contextPath}/userprofile/${userInfo.profile_image}" alt="프로필 사진">
                </c:when>
                <c:otherwise>
                	<!-- 이미지 설정하지 전에는 기본 프로필 이미지 출력 -->
                    <img class="profile-img" src="${pageContext.request.contextPath}/userprofile/Default-Profile.png" alt="기본 프로필">
                </c:otherwise>
            </c:choose>
    </div>

    <!-- 마이페이지 수정 폼 -->
    <form action="${pageContext.request.contextPath}/mypage/update.html" method="post" enctype="multipart/form-data">
        <div class="input-group">
            <label for="user_id">아이디</label>
            <input type="text" id="user_id" value="${userInfo.user_id}" readonly>
        </div>

        <div class="input-group">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" value="${userInfo.name}">
        </div>

        <div class="input-group">
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" value="${userInfo.email}">
        </div>

        <div class="input-group">
            <label for="profile_image">프로필 사진 변경</label>
            <input type="file" id="profile_image" name="profile_image" accept="image/*">
        </div>

        <div class="buttons">
            <button type="submit" class="save-btn">수정 완료</button>
            <a href="${pageContext.request.contextPath}/board/mypage.html" class="cancel-btn">취소</a>
        </div>
    </form>
</div>

</body>
</html>
