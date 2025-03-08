<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <style>
        /* ✅ 전체 페이지 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            text-align: center;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* ✅ 게시글 컨테이너 */
		.post-container {
    		width: 70%;
    		max-width: 800px;
    		background: white;
    		padding: 30px;
    		border-radius: 12px;
    		box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    		text-align: left;
    		min-height: auto; /* ✅ 자동 높이 적용 */
    		overflow: hidden; /* ✅ 넘치는 부분 숨기기 */
    		margin-top: 20px; /* ✅ 네비게이션 바와 일정한 간격 유지 */
		}

        /* ✅ 제목 입력 칸 */
        .post-title {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
            padding: 10px;
            border-bottom: 2px solid #ddd;
        }

        .post-title label {
            width: 100px; /* ✅ 제목 레이블 크기 설정 */
            font-weight: bold;
        }

        .post-title input {
            flex-grow: 1; /* ✅ 입력칸이 가득 차도록 설정 */
            padding: 10px;
            font-size: 20px;
            border: 2px solid #ddd;
            border-radius: 6px;
        }

        /* ✅ 게시글 정보 */
        .post-info {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            color: gray;
            margin: 15px 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }

        /* ✅ 이미지 스타일 */
		.post-image {
		    text-align: center;
		    margin: 20px auto;
		    max-width: 100%;
		    min-height: 320px; /* ✅ 최소 높이 설정 (이미지가 없어도 공간 유지) */
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    border: 1px solid #ddd; /* ✅ 이미지 없을 때 공백이 이상해 보이지 않도록 테두리 추가 */
		    background: #f9f9f9; /* ✅ 기본 배경 추가 */
		}
		
		.post-image img {
		    max-width: 100%;
		    max-height: 300px; /* ✅ 이미지 최대 크기 제한 */
		    width: auto;
		    height: auto;
		    object-fit: contain;
		    border-radius: 8px;
		    border: 1px solid #ddd;
		    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
		}
        /* ✅ 이미지가 없을 경우 */
    	.no-image {
        	font-size: 14px;
        	color: gray;
        	text-align: center;
   	 		font-weight: bold;
    	}
        /* ✅ 이미지 업로드 부분 */
    	.image-upload {
        	margin-top: 10px;
        	text-align: center; /* ✅ 가운데 정렬 */
    	}

        /* ✅ 게시글 내용 스타일 */
        .post-content {
            display: flex;
            align-items: center;
            font-size: 16px;
            line-height: 1.6;
            text-align: left;
            padding: 10px;
            border-radius: 6px;
            background: #f9f9f9;
            border: 1px solid #ddd;
            margin-top: 10px;
            min-height: 200;
        }

        .post-content label {
            width: 100px; /* ✅ 내용 레이블 크기 설정 */
            font-weight: bold;
        }

        .post-content textarea {
            flex-grow: 1;
            width: 100%;
            height: 200px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 6px;
            resize: vertical; /* ✅ 세로 조정 가능 */
        }

        /* ✅ 버튼 컨테이너 */
        .buttons {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        /* ✅ 버튼 스타일 */
        .buttons button {
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            border-radius: 6px;
            transition: all 0.3s ease-in-out;
        }

        /* 수정 버튼 */
        .edit-btn {
            background-color: #007bff;
            color: white;
        }

        .edit-btn:hover {
            background-color: #0056b3;
        }

        /* 삭제 버튼 */
        .delete-btn {
            background-color: #dc3545;
            color: white;
        }

        .delete-btn:hover {
            background-color: #b02a37;
        }

        /* ✅ 반응형 스타일 */
        @media screen and (max-width: 768px) {
            .post-container {
                width: 90%;
                padding: 20px;
            }

            .post-info {
                flex-direction: column;
                align-items: center;
                gap: 5px;
            }

            .buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>

<div class="post-container">
    <form id="postForm" action="/board/updatePost.html" method="post" enctype="multipart/form-data">
        <input type="hidden" name="postId" value="${postId}">

        <!-- ✅ 제목 -->
        <div class="post-title">
            <label>제목</label>
            <c:choose>
                <c:when test="${sessionScope.user_id == post.writerId}">
                    <input type="text" name="title" value="${post.title}">
                </c:when>
                <c:otherwise>
                    ${post.title}
                </c:otherwise>
            </c:choose>
        </div>

        <!-- ✅ 게시글 정보 -->
        <div class="post-info">
            <span>작성자: <b>${post.writerId}</b></span>
            <span>작성일: ${post.writeDate}</span>
            <span>추천: ${post.good} | 비추천: ${post.bad}</span>
        </div>

        <!-- ✅ 이미지 표시 및 수정 -->
        <div class="post-image">
            <c:choose>
        		<c:when test="${not empty post.imageName}">
                	<img src="${pageContext.request.contextPath}/upload/${post.imageName}" alt="게시글 이미지">
            	</c:when>
            	<c:otherwise>
            		<p class="no-image">이미지가 없습니다.</p>
        		</c:otherwise>
			</c:choose>
		</div>
            <c:if test="${sessionScope.user_id == post.writerId}">
                <div class="image-upload">
            		<label>이미지 변경:</label>
            	<input type="file" name="image">
        		</div>
            </c:if>

        <!-- ✅ 내용 -->
        <div class="post-content">
            <label>내용</label>
            <c:choose>
                <c:when test="${sessionScope.user_id == post.writerId}">
                    <textarea name="content" rows="10">${post.content}</textarea>
                </c:when>
                <c:otherwise>
                    ${post.content}
                </c:otherwise>
            </c:choose>
        </div>

        <!-- ✅ 수정 및 삭제 버튼 -->
        <div class="buttons">
            <c:if test="${sessionScope.user_id == post.writerId}">
                <button type="submit" class="edit-btn">수정</button>
                <button type="button" class="delete-btn" onclick="deletePost(${postId})">삭제</button>
            </c:if>
            <c:if test="${sessionScope.user_id == 'admin' && sessionScope.user_id != post.writerId}">
                <button type="button" class="delete-btn" onclick="deletePost(${postId})">삭제</button>
            </c:if>
        </div>
    </form>
</div>

<script>
    function deletePost(postId) {
        if (confirm("정말로 삭제하시겠습니까?")) {
            let form = document.createElement("form");
            form.method = "POST";
            form.action = "/board/deletePost.html";

            let input = document.createElement("input");
            input.type = "hidden";
            input.name = "postId";
            input.value = postId;

            form.appendChild(input);
            document.body.appendChild(form);
            form.submit();
        }
    }
</script>

</body>
</html>
