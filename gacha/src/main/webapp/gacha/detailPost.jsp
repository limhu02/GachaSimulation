<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background-color: white; }
        .post-container { width: 80%; margin: 40px auto; text-align: left; border: 1px solid #ddd; padding: 20px; }
        .post-title input, .post-content textarea { width: 100%; padding: 5px; font-size: 16px; }
        .post-title { font-size: 24px; font-weight: bold; margin-bottom: 10px; }
        .post-info { display: flex; justify-content: space-between; font-size: 14px; color: gray; margin-bottom: 10px; }
        .post-content { border-top: 1px solid #ddd; padding-top: 15px; min-height: 150px; }
        .post-image { text-align: center; margin-top: 15px; }
        .post-image img { max-width: 100%; height: auto; border-radius: 8px; border: 1px solid #ddd; }
        .buttons { margin-top: 15px; }
        .buttons button { padding: 8px 12px; border: none; cursor: pointer; margin-right: 5px; }
        .edit-btn { background-color: blue; color: white; }
        .delete-btn { background-color: red; color: white; }
    </style>
</head>
<body>

<div class="post-container">
    <form id="postForm" action="/board/updatePost.html" method="post">
        <input type="hidden" name="postId" value="${postId}">

        <!-- ✅ 제목 -->
        <div class="post-title">
            <c:choose>
                <c:when test="${sessionScope.user_id == post.writerId}">
                    <input type="text" name="title" value="${post.title}">
                </c:when>
                <c:otherwise>
                    ${post.title}
                </c:otherwise>
            </c:choose>
        </div>

        <div class="post-info">
            <span>작성자: <b>${post.writerId}</b></span>
            <span>작성일: ${post.writeDate}</span>
            <span>추천: ${post.good} | 비추천: ${post.bad}</span>
        </div>

        <!-- ✅ 이미지 표시 -->
        <c:if test="${not empty post.imageName}">
    		<div class="post-image">
       			 <img src="/upload/${post.imageName}" alt="게시글 이미지">
    		</div>
		</c:if>

        <!-- ✅ 내용 -->
        <div class="post-content">
            <c:choose>
                <c:when test="${sessionScope.user_id == post.writerId}">
                    <textarea name="content" rows="10">${post.content}</textarea>
                </c:when>
                <c:otherwise>
                    ${post.content}
                </c:otherwise>
            </c:choose>
        </div>

        <!-- ✅ 버튼 표시 조건 -->
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

    <!-- 댓글 작성 버튼 -->
    <button onclick="location.href='/board/comment.html?postId=${postId}'">댓글</button>
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
