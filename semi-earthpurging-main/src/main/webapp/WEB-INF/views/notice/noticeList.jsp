<%@page import="java.util.ArrayList"%>
<%@page import="com.earthpurging.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    	String pageNavi = (String)request.getAttribute("pageNavi");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>줍줍줍</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/news.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title"><span class="page-title1">쓰</span>담소식</div>
		<div class="notice-navi-wrap">
			<div class="navi-wrap">
				<div><a href="#">공지사항</a></div>
				<div><a href="/FAQ.do">FAQ</a></div>
				<div><a href="/inquiryFrm.do">문의하기</a></div>
			</div>
		</div>
		<table class="tbl" id="notice_tbl">
			<tr class="tr-2 tr-a" id="tr-2">
				<th style="width: 10%">NO</th>
				<th style="width: 45%">제목</th>
				<th style="width: 15%">글쓴이</th>
				<th style="width: 20%">작성시간</th>
				<th style="width: 10%">조회수</th>
			</tr>
			<%for(Notice n:list) {%>
			<tr class="tr-1">
				<td><%=n.getNoticeNo() %></td>
				<td>
					<a href="/noticeView.do?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle() %></a>
				</td>
				<td><%=n.getNoticeWriter() %></td>
				<td><%=n.getRegDate() %></td>
				<td><%=n.getReadCount() %></td>
			</tr>
			<%} %>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<%if(m != null && m.getMemberLevel()==1) {%>
				<td><a class="noticeWriteBtn" href="noticeWriteFrm.do">글쓰기</a></td>
				<%} %>
			</tr>
		</table>
		<div id ="pageNavi"><%=pageNavi %></div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>