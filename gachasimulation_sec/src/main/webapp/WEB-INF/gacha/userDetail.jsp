<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <style>
        /* 📌 마이페이지 개별 스타일 (index 스타일과 충돌 방지) */
body {
    background-color: #ffffff; /* ✅ 배경색 추가 */
    margin: 0;
    padding: 0;
}

/* ✅ 마이페이지 컨테이너 스타일 */
.mypage-container {
    width: 100%;
    max-width: 800px; /* 게시판과 비슷한 크기로 조정 */
    margin: 50px auto; /* 위아래 여백 추가하여 네비게이션과 충돌 방지 */
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    text-align: center;
    min-height: 700px; /* ✅ 최소 높이 설정 */
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
    border: 3px solid #4CAF50;
    margin-bottom: 10px;
}

/* ✅ 정보 항목 */
.info-item {
    width: 40%; /* ✅ 너비 조정 */
    display: flex;
    justify-content: center; /* ✅ 중앙 정렬 */
    align-items: center;
    gap: 10px; /* ✅ 레이블과 내용 간격 */
    padding: 10px 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background: #f5f5f5; /* ✅ 연한 회색 배경 */
    font-size: 16px;
    text-align: center; /* ✅ 텍스트 중앙 정렬 */
    margin: 5px auto; /* ✅ 중앙 정렬 */
}

/* ✅ 레이블 (ID, 닉네임, 이메일 등) */
.info-item label {
    font-weight: bold;
    color: #333;
}

/* ✅ 정보 텍스트 */
.info-item span {
    font-weight: normal;
}

/* ✅ 버튼 컨테이너 */
.buttons {
    display: flex;
    flex-direction: column; /* ✅ 버튼을 세로로 배치 */
    align-items: center; /* ✅ 중앙 정렬 */
    margin-top: 20px;
    gap: 10px; /* ✅ 버튼 간격 추가 */
}

/* ✅ 버튼 공통 스타일 */
.edit-btn, .delete-btn {
    width: 180px;/* ✅ 버튼 크기 조정 */
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 20px;
    text-align: center;
    text-decoration: none; /* ✅ a 태그 버튼 스타일 유지 */
    display: block; /* ✅ 블록 요소로 만들어 개별 배치 */
    margin: 10px auto; /* ✅ 중앙 정렬 */
}

/* ✅ 수정 버튼 */
.edit-btn {
    background: #FFA500;
    color: white;
}

.edit-btn:hover {
    background: #e69500;
}

/* ✅ 삭제 버튼 */
.delete-btn {
    background: #E74C3C;
    color: white;
}

.delete-btn:hover {
    background: #c0392b;
}

    </style>
</head>
<body>
    <div class="mypage-container">
        <h2>계정 정보</h2>

        <div class="profile">
            <!-- 프로필 사진 -->
            <c:choose>
                <c:when test="${not empty userInfo.profile_image}">
                    <img class="profile-img" src="${pageContext.request.contextPath}/userprofile/${userInfo.profile_image}" alt="프로필 사진">
                </c:when>
                <c:otherwise>
                	<!-- 이미지 설정하지 전에는 기본 프로필 이미지 출력 -->
                    <img class="profile-img" src="/userprofile/Default-Profile.png" alt="기본 프로필">
                </c:otherwise>
            </c:choose>
        </div>

        <div class="info-item">
            <label>[ID]</label>
            <span>${userInfo.user_id}</span>
        </div>
        <br/>
        <div class="info-item">
            <label>[이름]</label>
            <span>${userInfo.name}</span>
        </div>
        <br/>
        <div class="info-item">
            <label>[이메일]</label>
            <span>${userInfo.email}</span>
        </div>
        <br/>
        <div class="info-item">
            <label>[가입 일시]</label>
            <span>${userInfo.reg_date}</span>
        </div>
        <br/>
        <div class="info-item">
            <label>[현재 사용자 권한]</label>
            <c:choose>
            	<c:when test="${auth=='ROLE_ADMIN' }">
            	 <span>관리자</span>
            	</c:when>
            	<c:when test="${auth=='ROLE_MEMBER' }">
            	 <span>일반 사용자</span>
            	</c:when>
            	<c:otherwise>
            	<span><font color="red">권한 없음</font></span>
            	</c:otherwise>
            </c:choose>
           
        </div>
        <br/>
        
	<sec:authorize access="hasRole('ADMIN')">
	 <div class="buttons">
    		<form id="editForm" action="${pageContext.request.contextPath}/admin/useredit.html" method="post">
      		    <input type="hidden" name="user_id" value="${userInfo.user_id}">
        		<button type="submit" class="edit-btn">회원 정보 수정</button>
    		</form>

    		<button type="button" class="delete-btn" onclick="confirmDelete('${userInfo.user_id}')">회원 삭제</button>
	</div>
	</sec:authorize>
       
		</div>  
		
<script>
function confirmDelete(userId) {
    if (confirm("계정을 삭제하시겠습니까?")) {
       
        const form = document.createElement("form");
        form.method = "POST";
        form.action = "${pageContext.request.contextPath}/admin/userdeleteresult.html"; // 삭제 요청 URL

        // hidden input 생성하여 userId 추가
        const input = document.createElement("input");
        input.type = "hidden";
        input.name = "userId";  // 서버에서 받을 파라미터 이름
        input.value = userId;

        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();  // POST 요청 전송
    }
}
</script>
 
</body>
</html>
