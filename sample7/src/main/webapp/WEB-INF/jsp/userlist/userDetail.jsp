<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table.member {width:40%; text-align: center;'}
</style>
</head>
<body>
<div align="center">
<h2>회 원 정 보</h2>

<table border="1" class="member">
<tr><th>계 정</th><td>${user.userId }</td></tr>
<tr><th>이 름</th><td>${user.userName }</td></tr>
<tr><th>주 소</th><td>${user.address }</td></tr>
<tr><th>이메일</th><td>${user.email }</td></tr>
<tr><th>생 일</th><td>${user.birthday }</td></tr>
<tr><th>직 업</th><td>${user.job }</td></tr>
</table></form><br/><br/><a href="userList.html">목록으로</a>
</div>
<script type="text/javascript">
function check(frm){
	if(frm.PWD.value == ''){alert("암호를 입력하세요."); frm.PWD.focus(); return false;	}
	if(frm.ADDR.value == ''){alert("주소를 입력하세요.");frm.ADDR.focus(); return false;}
	if(frm.PHONE.value==''){alert("전화번호를 입력하세요.");frm.PHONE.focus();return false;}
	if(frm.GRADE.value==''){
		alert("등급을 입력하세요."); frm.GRADE.focus(); return false;
	}else {
		if(isNaN(frm.GRADE.value)){
			alert("등급은 숫자로 입력하세요."); frm.GRADE.focus(); return false;
		}else {
			var grade = parseInt(frm.GRADE.value);
			if(grade > 2 || grade < 0){
				alert("등급은 0과 2사이로 입력하세요."); frm.GRADE.focus(); return false;
			}
		}
	}
	if( ! confirm("정말로 변경하시겠습니까?")) return false;
}
</script>
</body>
</html>














