<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 모달 배경 *//* 모달 배경 */
.modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* 어두운 배경 */
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
}

/* 모달 본체 */
.modal-content {
    background: white;
    width: 600px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
    overflow: hidden;
}

/* 모달 헤더 */
.modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px;
    background: #f5f5f5;
    border-bottom: 1px solid #ddd;
    font-weight: bold;
}

/* 닫기 버튼 */
.modal-close {
    background: none;
    border: none;
    font-size: 18px;
    cursor: pointer;
}

/* 모달 바디 */
.modal-body {
    padding: 20px;
}

/* 테이블 스타일 */
.modal-table {
    width: 100%;
    border-collapse: collapse;
}

/* 왼쪽 셀 스타일 (작성자, 내용) */
.modal-table td:first-child {
    width: 20%;
    background: #f5f5f5; /* 회색 배경 */
    font-weight: bold;
    text-align: left;
    padding: 10px;
    border: 1px solid #ddd;
}

/* 오른쪽 셀 스타일 (입력 필드) */
.modal-table td:last-child {
    width: 80%;
    padding: 10px;
    border: 1px solid #ddd;
}

/* 입력 필드 스타일 */
.modal-table input,
.modal-table textarea {
    width: 100%;
    max-width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box; 
}

/* 버튼 컨테이너 */
.modal-footer {
    display: flex;
    justify-content: center;
    padding: 10px;
    background: #f5f5f5;
    border-top: 1px solid #ddd;
}

/* 버튼 스타일 */
.modal-footer button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    margin: 0 5px;
}

.modal-footer .btn-update {
    background: skyblue;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
}


</style>
</head>
<body>
<div class="modal-overlay" id="commentModal">
    <div class="modal-content">
        <form:form modelAttribute="comment" action="/comment/updateResult.html" method="post" onsubmit="close()">  
        <div class="modal-header">
            <span>댓글 수정</span><font color="red"><form:errors path="content"/></font>
        </div>
     
        <input type="hidden" name="code" value="${comment.code}" >
        <input type="hidden" name="postId" value="${comment.post_id }"/>
        <div class="modal-body">
            <table class="modal-table">
                <tr>
                    <td>작성자</td>
                    <td>${comment.writer}</td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><form:textarea path="content" rows="10"/></td>
                </tr>
            </table>
        </div>	
        <div class="modal-footer">
            <input type="submit" class="btn-update" value="수정"/>
        </div>
     </form:form>
           
    </div>
    
</div>

	
<script type="text/javascript">
function close() {
	// 폼 submit 처리
    let form = document.getElementById('commentForm');
    form.submit();

    // 부모 창에 submit 완료 메시지 전달
    window.parent.postMessage('submitComplete', '*');
}
</script>

</body>
</html>