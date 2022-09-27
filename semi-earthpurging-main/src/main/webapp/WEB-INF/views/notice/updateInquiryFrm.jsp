<%@page import="com.earthpurging.notice.model.vo.Inquiry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Inquiry inq = (Inquiry)request.getAttribute("inq");
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
	<div class="page-content" id="page-content">
		<div class="page-title" id="updateInquiryTitle">문의사항 수정</div>
		<form action="/inquiryUpdate.do" method="post" enctype="multipart/form-data">
			<table class="tbl" id="inquiryUpdateFrm">
				<tr>
					<td>
						<select name="inquiry-type">
							<%if(inq.getInquiry_type().equals("후원문의")) {%>
							<option name="donation" value="후원문의">후원문의</option>
							<option name="quest" value="챌린지문의">챌린지문의</option>
							<option name="goods" value="상품문의">상품문의</option>
							
							<%}else if(inq.getInquiry_type().equals("챌린지문의")) {%>
							<option name="quest" value="챌린지문의">챌린지문의</option>
							<option name="donation" value="후원문의">후원문의</option>
							<option name="goods" value="상품문의">상품문의</option>
							
							<%}else {%>
							<option name="goods" value="상품문의">상품문의</option>
							<option name="quest" value="챌린지문의">챌린지문의</option>
							<option name="donation" value="후원문의">후원문의</option>
							<%} %>
						</select>
					</td>
					<th class="th">첨부파일</th>
					
					<input type="hidden" name="status" value="stay">	
					<td>
						<%if(inq.getInquiry_filepath() != null) {%>
							<img src="/img/file.png" width="16px" class="delFile">
							<span class="delFile"><%=inq.getInquiry_filepath() %></span>
							<button type="button" class="btn bc1 delFile">삭제</button>
							<input type="file" name="upfile" style="display: none;">
							<input type="hidden" name="oldFilepath" value="<%=inq.getInquiry_filepath() %>">
						<%}else { %>
							<input type="file" name="upfile">
						<%} %>
					</td>
					<th class="th">이름</th>
					<td><%=inq.getInquiry_writer() %></td>
					<input type="hidden" name="inquirer" value="<%=inq.getInquiry_writer() %>">
				</tr>
				<tr>
					<td><%=inq.getInquirer_email() %></td>
					<input type="hidden" name="inquiryEmail" value="<%=inq.getInquirer_email() %>">
					<th class="th">제목</th>
					<td>
						<input type="text" name="inquiryTitle" class="input-form" value="<%=inq.getInquiry_title() %>">
					</td>
					<th class="th">NO</th>
					<td><%=inq.getInquiry_no() %></td>
					<input type="hidden" name="inquiryNo" value="<%=inq.getInquiry_no() %>">
				</tr>
				<tr>
					<td colspan="5">
						<textarea class="input-form" name="inquiryContent" id="inquiry-content"><%=inq.getInquiry_content() %></textarea>
					</td>
				</tr>
				<tr>
					<th colspan="5">
						<button type="submit" class="btn updateBtn">수정완료</button>
					</th>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>