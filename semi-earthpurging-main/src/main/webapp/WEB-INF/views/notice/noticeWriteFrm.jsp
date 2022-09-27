<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/newsWrite.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title">공지사항 작성</div>
		<form action="/noticeWrite.do" method="post" enctype="multipart/form-data">
			<table class="tbl" id="noticeWrite">
				<tr>
					<th class="th">제목</th>
					<td colspan="3">
						<input type="text" name="noticeTitle" class="input-form">
					</td>
				</tr>
				<tr>
					<th class="th">작성자</th>
					<td>
					<%=m.getNickname() %>
					<input type="hidden" name="noticeWriter" value="<%=m.getNickname() %>">
					</td>
					<th class="th">첨부파일</th>
					<td><input type="file" name="upfile"></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea name="noticeContent" class="input-form"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<button type="submit" class="writeBtn">공지사항 작성</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>