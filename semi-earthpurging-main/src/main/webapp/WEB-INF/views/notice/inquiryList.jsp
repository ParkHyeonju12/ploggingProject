<%@page import="com.earthpurging.notice.model.vo.Inquiry"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	ArrayList<Inquiry> list = (ArrayList<Inquiry>)request.getAttribute("list");
    	String pageNavi = (String)request.getAttribute("pageNavi");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/news.css">
    <link rel="stylesheet" href="/css/inquiry.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="notice-navi-wrap">
			<div class="navi-wrap">
				<div><a href="/noticeList.do?reqPage=1">공지사항</a></div>
				<div><a href="/FAQ.do">FAQ</a></div>
				<div><a href="/inquiryFrm.do">문의하기</a></div>
			</div>
		</div>
		<div class="inquiry-wrap">
			<span><a href="/inquiryFrm.do">1:1문의</a></span>
			<span><a href="/inquiryList.do?reqPage=1">문의사항 조회</a></span>
		</div>
		<table class="tbl" id="inquiry-tbl">
			<tr>
				<th style="width:15%">답변상태</th>
				<th style="width:40%">제목</th>
				<th style="width:20%">글쓴이</th>
				<th style="width:25%">작성시간</th>
			</tr>
			<%for(Inquiry inq : list) {%>
			<tr>
				
				<td><%=inq.getIs_answer() %></td>
				<td><a href="/inquiryView.do?inquiryNo=<%=inq.getInquiry_no() %>"><%=inq.getInquiry_title() %></a></td>
				<td><%=inq.getInquiry_writer() %></td>
				<td><%=inq.getInquiry_enroll_date() %></td>
			</tr>
			<%} %>
		</table>
		<div id="pageNavi"><%=pageNavi %></div>
	</div>
	
	
	
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>