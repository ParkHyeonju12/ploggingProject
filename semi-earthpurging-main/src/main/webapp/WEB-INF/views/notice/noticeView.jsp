<%@page import="java.util.ArrayList"%>
<%@page import="com.earthpurging.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Notice n = (Notice)request.getAttribute("n");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="/css/newsView.css">
	<style>
		#noticeView th{background:var(--point-color-blue)}
	</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content" style="margin:20px auto 100px";>
		<div class="page-title">쓰담 공지사항</div>
		<table class="tbl" id="noticeView">
			<tr>
				<th colspan="6" class="th"><%=n.getNoticeTitle() %></th>
			</tr>
			<tr>
				<th class="th">작성자</th>
				<td><%=n.getNoticeWriter() %></td>
				<th class="th">조회수</th>
				<td><%=n.getReadCount() %></td>
				<th class="th">작성일</th>
				<td><%=n.getRegDate() %></td>
			</tr>
			<tr>
				<th class="th">첨부파일</th>
				<td colspan="5">
				<%if(n.getFilename() != null) {%>
				<img src="/img/file.png" width="16px">
				<a href="/noticefileDown.do?noticeNo=<%=n.getNoticeNo() %>"><%=n.getFilename() %></a>
				<%} %>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<div id="noticeContent"><%=n.getNoticeContent() %></div>
				</td>
			</tr>
			<tr>
				<%if(m != null && m.getMemberLevel() == 1) {%>
				<th colspan="6">
					<a class="btn updateBtn1" href="/noticeUpdateFrm.do?noticeNo=<%=n.getNoticeNo()%>">수정</a>
					<button class="btn delBtn" onclick="noticeDelete(<%=n.getNoticeNo()%>);">삭제</button>
				</th>
				<%} %>
			</tr>
		</table>
	</div>
	<script>
		function noticeDelete(noticeNo) {
			if(confirm("공지사항을 삭제하시겠습니까?")){
				location.href="/noticeDelete.do?noticeNo="+noticeNo;
			}
		}
		
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>