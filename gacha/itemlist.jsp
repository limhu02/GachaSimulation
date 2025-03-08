<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>상품 목록</h3>
<table>
	<tr><td align="center">
		<form action="../item/search.html" method="post">
		상품 검색 : <input type="text" name="NAME"/>
		<input type="submit" value="검색"/>
		</form>
	</td></tr>
</table>
<table>
	<tr><td align="right">${startRow + 1}~${endRow -1}/${total }</td></tr>
</table>
<table border="1" style="text-align: center; position: relative;" >
	<tr><th>코드</th><th>이름</th><th>소속 게임</th>
		</tr>
	<c:forEach var="item" items="${itemlist}">
		<tr><td>${item.item_code }</td>
			<td>
				<c:choose>
					<c:when test="${sessionScope.loginUser =='admin' }">
					<a href="../item/detailAdmin.html?CODE=${item.item_code }">${item.item_name }</a>
					</c:when>
					<c:otherwise>
					<a href="../item/detail.html?CODE=${item.item_code }">${item.item_name }</a>
					</c:otherwise>
				</c:choose>
				
			
			</td>
			<td>${item.box_game }</td>
			
		
		</tr>
	</c:forEach>
	<div align="right">
	
	</div>
	
		
</table>
  <div style="position: absolute; bottom: 10px; right: 10px;">
        <a href="@{'/' + ${boardName} + '/write'}">
            <button type="button" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
                게시물 작성
            </button>
        </a>
    </div>
<br/>

<c:set var="pageCount" value="${pageCount }"/>
<c:set var="currentPage" value="${ currentPage}"/>
<c:set var="startPage" 
	value="${currentPage - (currentPage % 10 == 0 ? 10 : (currentPage % 10)) + 1}"/>
<c:set var="endPage" value="${startPage + 9}"/>
<c:if test="${endPage > pageCount}">
	<c:set var="endPage" value="${pageCount}"/>
</c:if>
<c:if test="${startPage > 10}">
	<a href="../item/itemList.html?PAGE_NUM=${startPage - 1}">[이전]</a>
</c:if>
<c:forEach begin="${startPage}" end="${endPage}" var="i">
	<c:if test="${currentPage == i}"><font size="6"></c:if>
	<a href="../item/itemList.html?PAGE_NUM=${ i }">${ i }</a>
	<c:if test="${currentPage == i}"></font></c:if>
</c:forEach>
<c:if test="${endPage < pageCount}">
	<a href="../item/itemList.html?PAGE_NUM=${endPage + 1 }">[다음]</a>
</c:if>
</div>
</body>
</html>










