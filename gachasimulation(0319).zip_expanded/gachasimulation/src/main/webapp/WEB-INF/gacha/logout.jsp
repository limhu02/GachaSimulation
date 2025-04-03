<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession();
    sessionObj.invalidate(); // 세션 종료
    response.sendRedirect("index.jsp"); // 로그아웃 후 메인 페이지로 이동
%>
