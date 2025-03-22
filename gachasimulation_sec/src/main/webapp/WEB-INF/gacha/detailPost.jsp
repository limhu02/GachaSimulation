<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
            background-color: #ffffff;
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
        

/* 댓글 스타일 */
        .comments-container {
            margin-top: 30px;
            text-align: left;
        }

        .comment {
            background: #f8f8f8;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
        }

        .comment-header {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            color: gray;
            margin-bottom: 5px;
        }

        .comment-body {
            font-size: 16px;
            color: #333;
        }

        .comment-actions {
            margin-top: 5px;
            text-align: right;
        }

        .comment-actions button {
            background: none;
            border: none;
            color: blue;
            cursor: pointer;
            font-size: 12px;
            margin-left: 5px;
        }

        .comment-actions button:hover {
            text-decoration: underline;
        }

        /* 댓글 입력 폼 */
        .comment-form {
            margin-top: 20px;
            text-align: left;
        }

        .comment-form textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
        }

        .comment-form button {
            margin-top: 5px;
            padding: 8px 12px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
        }

        .comment-form button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

	<!-- 현재 로그인한 사용자가 게시글 작성자인지 비교하는 값 -->
  <c:set var="isWriter" value="${post.writerId == pageContext.request.userPrincipal.name}" />
  

<div class="post-container">
<sec:authentication property="principal" var="user"/>
            
    <form id="postForm" action="/board/updatePost.html" method="post" enctype="multipart/form-data">
        <input type="hidden" name="postId" value="${postId}">

        <!-- 제목 -->
        <div class="post-title">
            <label>제목</label>
            
          
           
            <sec:authorize access="hasRole('ADMIN')">
            <input type="text" name="title" value="${post.title}">
            </sec:authorize>
            <!-- sec:authorize 안에서 el 사용이 불가능 하므로 작성자와 현재 로그인한 id가 같은지에 대한 비교 결과값을 writer 변수로 받아서 조건문으로 체크-->
            <c:if test="${isWriter}">
            <input type="text" name="title" value="${post.title}">
            </c:if>
            ${post.title}

        </div>

        <!-- 게시글 정보 -->
        <div class="post-info">
            <a href="/board/userDetail.html?user_id=${post.writerId }"><span>작성자: <b>${post.writerId}</b></span></a>
            <span>작성일: ${post.writeDate}</span>
           
        </div>

        <!-- 이미지 표시 및 수정 -->
        <c:if test="${not empty post.imageName}">
            <div class="post-image">
                <img src="${pageContext.request.contextPath}/upload/${post.imageName}" alt="게시글 이미지">
            </div>
        </c:if>
        <sec:authorize access="hasRole('ADMIN')">
            <div class="image-upload">
                <label>이미지 변경:</label>
                <input type="file" name="image">
            </div>
        </sec:authorize>
        
        <c:if test="${isWriter}">
          <div class="image-upload">
                <label>이미지 변경:</label>
                <input type="file" name="image">
            </div>
        </c:if>

        <!-- 내용 -->
        <div class="post-content">
            <label>내용</label>
            <sec:authorize access="hasRole('ADMIN')">
            	<textarea name="content" rows="10">${post.content}</textarea>
            </sec:authorize>
            
            <c:if test="${isWriter}">
            <textarea name="content" rows="10">${post.content}</textarea>
            </c:if>
           
            	 ${post.content}
          
        </div>

        <!-- 수정 및 삭제 버튼 -->
        
        <div class="buttons">
           <sec:authorize access="hasRole('ADMIN')">
                <button type="submit" class="edit-btn">수정</button>
                <button type="button" class="delete-btn" onclick="deletePost(${postId})">삭제</button>
            </sec:authorize>
            <c:if test="${isWriter}">
           		 <button type="submit" class="edit-btn">수정</button>
                <button type="button" class="delete-btn" onclick="deletePost(${postId})">삭제</button>
            </c:if>
        </div>
    </form>

    <!-- 댓글 입력 폼 -->
    <div class="comment-form">
        <form action="/comment/write" method="post">
            <input type="hidden" name="post_id" value="${post.postId}">
            <textarea name="content" rows="3" placeholder="댓글을 입력하세요..." required></textarea>
            <button type="submit">댓글 작성</button>
        </form>
    </div>

    <!-- 댓글 목록 -->
    <div class="comments-container">
        <h2>댓글</h2>
        <c:if test="${not empty comment}">
            <c:forEach var="comment" items="${comment}">
                <div class="comment">
                    <div class="comment-header">
                        <strong>${comment.writer}</strong>
                        <span>${comment.write_date}</span>
                    </div>
                    <div class="comment-body">${comment.content}</div>
                    <div class="comment-actions">
                  <!-- 현재 로그인한 사용자가 댓글 작성자인지 비교하는 값 -->
				  <c:set var="isCommentWriter" value="${comment.writer == pageContext.request.userPrincipal.name}" />
                        <sec:authorize access="hasRole('ADMIN')">
                            <button onclick="updateComment(${comment.code})">수정</button>
                            <button onclick="deleteComment(${comment.code},${comment.post_id})">삭제</button>
                        </sec:authorize>
                        <c:if test="${isCommentWriter}">
                        	<button onclick="updateComment(${comment.code})">수정</button>
                            <button onclick="deleteComment(${comment.code},${comment.post_id})">삭제</button>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty comment}">
            <p>댓글이 없습니다.</p>
        </c:if>
    </div>
</div>

<script type="text/javascript">
    function deletePost(postId) {
        if (confirm("게시글과 댓글이 삭제됩니다. 정말로 삭제하시겠습니까?")) {
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
    
    function deleteComment(commentCode,postId) {
        if (confirm("정말로 댓글을 삭제하시겠습니까?")) {
            let form = document.createElement("form");
            form.method = "POST";
            form.action = "/comment/deleteComment.html";

            let input = document.createElement("input");
            input.type = "hidden";
            input.name = "code";
            input.value = commentCode;
            
            let postInput = document.createElement("input");
            postInput.type = "hidden";
            postInput.name = "postId";
            postInput.value = postId;
            form.appendChild(postInput);

            form.appendChild(input);
            document.body.appendChild(form);
            form.submit();
        }
    }
    
    function updateComment(commentId) {
        console.log("댓글 수정 버튼 클릭됨, ID:", commentId);

        // 모달이 없으면 생성
        if (!document.getElementById("commentModal")) {
            let modal = document.createElement("div");
            modal.id = "commentModal";
            modal.className = "modal";
            modal.innerHTML = `
                <div class="modal-content">
                    <span class="close" onclick="closeModal()">&times;</span>
                    <iframe id="commentFrame" src="" width="100%" height="100%" frameborder="0"></iframe>
                </div>
            `;
            document.body.appendChild(modal);

            // 스타일 추가
            let style = document.createElement("style");
            style.innerHTML = `
                .modal {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    position: fixed;
                    z-index: 1000;
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0, 0, 0, 0.5);
                }
                .modal-content {
                    width: 600px;
                    height: 400px;
                    background-color: white;
                    position: relative;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                }
                .close {
                    position: absolute;
                    top: 10px;
                    right: 15px;
                    font-size: 24px;
                    cursor: pointer;
                }
            `;
            document.head.appendChild(style);
        }

        // 모달을 띄우고 iframe URL 설정
        let iframe = document.getElementById("commentFrame");
        let modal = document.getElementById("commentModal");

        if (iframe) {
            let url = '/comment/modifyComment.html?code=' + commentId;
            console.log("iframe URL 설정:", url);
            iframe.src = url;

            // iframe에서 submit 완료 후 부모 창에 이벤트 전달
            iframe.onload = function () {
                iframe.contentWindow.postMessage('submitComplete', '*');
            };
        }

        modal.style.display = "flex";
    }

    function closeModal() {
        let modal = document.getElementById("commentModal");
        if (modal) {
            console.log("모달 닫기");
            modal.remove(); // 모달 삭제
        }
    }

    // 부모 창에서 메시지 받기 (iframe에서 전송한 메시지)
    window.addEventListener('message', function (event) {
        if (event.data === 'submitComplete') {
            console.log("iframe에서 submit 완료 메시지 받음");
            closeModal(); // 모달 닫기
            // 필요 시 페이지 리로드나 다른 작업 수행
            // location.reload(); // 페이지 새로고침
        }
    });
</script>

</body>
</html>
