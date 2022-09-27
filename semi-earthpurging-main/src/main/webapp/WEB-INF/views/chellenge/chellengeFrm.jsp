<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

  <%Member member = (Member) session.getAttribute("m"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쓰담위크 퀘스트</title>
<link rel="stylesheet" href="/css/chellenge.css">
</head>
<body>
<div class="wrapper">
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    <!-- content -->
    <div class="page-content">
    <% if(m!= null) {%>
    <a href="/quest1Frm.do">
	 <img src="/img/img/지구쓰담.png">
    </a>
     <%}else {%>
     <a href="/common/signinFrm.jsp">
	 <img src="/img/img/지구쓰담.png">
    </a>
      <%} %>
    </div>
    <!-- // content -->
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</body>
</html>
