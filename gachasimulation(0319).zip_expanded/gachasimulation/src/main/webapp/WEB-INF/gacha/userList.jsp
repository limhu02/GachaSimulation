<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>(관리자) 가입자 목록</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/board.css">
</head>
<body>

<div class="board-container">
    <div class="board-title">
        <h2>가입자 목록</h2>
    </div>

    <!-- 검색창 -->
    <div class="search-container">
        <form action="/admin/userlist.html" method="get">
            <input type="text" name="searchKeyword" value="${searchKeyword}" placeholder="ID를 입력하세요.">
            <button type="submit">검색</button>
            <a href="/admin/userlist.html"><button type="button">초기화</button></a>
        </form>
    </div>

    <br/>

    <!-- 사용자 목록 테이블 -->
    <form id="deleteForm" action="/admin/deleteSelectedUsers.html" method="post">
        <table>
            <tr>
                <th><input type="checkbox" id="checkAll"></th> <!-- 전체 선택 -->
                <th>ID</th>
                <th>이름</th>
                <th>가입일</th>
            </tr>

            <c:choose>
                <c:when test="${empty userlist}">
                    <tr>
                        <td colspan="4">가입자가 없습니다.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="user" items="${userlist}">
                        <tr>
                            <td><input type="checkbox" name="user_id" value="${user.user_id}"></td>
                            <td>${user.user_id}</td>
                            <td><a href="/admin/userdetail.html?user_id=${user.user_id}">${user.name}</a></td>
                            <td>${user.reg_date}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </table>

        <br/>
		   <!-- 전체 삭제 버튼 -->
    <button type="submit"  class="write-btn2" onclick="return confirmDelete()">선택한 회원 삭제</button>
    </form>

    <br/>

    <!-- 페이지네이션 -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="/admin/userlist.html?pageNo=${currentPage - 1}">[이전]</a>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="i">
            <a href="/admin/userlist.html?pageNo=${i}" class="${currentPage == i ? 'active' : ''}">${i}</a>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="/admin/userlist.html?pageNo=${currentPage + 1}">[다음]</a>
        </c:if>
    </div>

    <br/><br/>
 
</div>

<script>
// 전체 선택 체크박스 기능
document.getElementById("checkAll").addEventListener("click", function () {
    let checkboxes = document.querySelectorAll("input[name='user_id']");
    checkboxes.forEach(checkbox => checkbox.checked = this.checked);
});

// 선택 삭제 확인창
function confirmDelete() {
    let checkboxes = document.querySelectorAll("input[name='user_id']:checked");
    
    if (checkboxes.length === 0) {
        alert("삭제할 사용자를 선택하세요.");
        return false; // 폼 제출 막기
    }

    return confirm("선택한 가입자들을 삭제하시겠습니까?"); // "확인" 시 true, "취소" 시 false 반환
}
    
    
</script>

</body>
</html>
