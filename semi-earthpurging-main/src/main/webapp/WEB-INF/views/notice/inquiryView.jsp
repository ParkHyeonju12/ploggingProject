<%@page import="java.util.ArrayList"%>
<%@page import="com.earthpurging.notice.model.vo.InquiryComment"%>
<%@page import="com.earthpurging.notice.model.vo.Inquiry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Inquiry inq = (Inquiry)request.getAttribute("inq");
    	
    	ArrayList<InquiryComment> commentList = (ArrayList<InquiryComment>)request.getAttribute("commentList");
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
		<div class="page-title">문의사항</div>
		<table class="tbl" id="inquiryView">
			<tr>
				<th class="th">NO</th>
				<td><%=inq.getInquiry_no() %></td>
				<th class="th">제목</th>
				<td colspan="3"><%=inq.getInquiry_title() %></td>
			</tr>
			<tr>
				<th class="th">유형</th>
				<td><%=inq.getInquiry_type() %></td>
				<th class="th">작성자</th>
				<td colspan="3"><%=inq.getInquiry_writer() %></td>
			</tr>
			<tr>
				
				<th class="th">작성일</th>
				<td colspan="4"><%=inq.getInquiry_enroll_date() %></td>
			</tr>
			<tr>
				<th colspan="6"><%=inq.getInquirer_email() %></th>
			</tr>
			<tr>
				<td colspan="6">
					<div id="inquiry-content"><%=inq.getInquiry_content() %></div>
				</td>
			</tr>
			<tr>
				<th colspan="6">
				<%if(m != null && m.getMemberName().equals(inq.getInquiry_writer())) {%>
					<a class="btn inq-updateBtn" href="/inquiryUpdateFrm.do?inquiryNo=<%=inq.getInquiry_no()%>">수정</a>
					<button class="btn delBtn" onclick="inquiryDelete(<%=inq.getInquiry_no() %>);">삭제</button>
				<%} %>
				</th>
			</tr>
		</table>
		<%if(m!=null && m.getMemberLevel()==1) {%>
		<div class="inputCommentBox">
			<form action="/insertComment.do" method="post">
				<ul>
					<li>
						<div>RECOMMENT</div>
					</li>
					<li>
						<input type="hidden" name="icWriter" value="<%=m.getNickname() %>">
						<input type="hidden" name="inquiryRef" value="<%=inq.getInquiry_no()%>">
						
						<textarea class="input-form" name="icContent" id="comment-form"></textarea>
					</li>
					<li>
						<button type="submit" class="btn commentBtn">등록</button>
					</li>
				</ul>
			</form>
		</div>
		<%} %>
		<div class="commentBox">
			<%for(InquiryComment ic : commentList) {%>
			<ul class="posting-comment">
				<li>
					<span class="material-icons">account_box</span>
				</li>
				<li>
					<p class="comment-info">
						<span><%=ic.getIcWriter() %></span>
						<span name="icDate"><%=ic.getIcDate() %></span>
					</p>
					<p class="comment-content"><%=ic.getIcContent() %></p>
					<textarea name="icContent" class="input-form" style="min-height: 96px; display: none;"><%=ic.getIcContent() %></textarea>
					<p class="comment-link">
						<%if(m != null) {%>
							<%if(m.getNickname().equals(ic.getIcWriter())) {%>
								<a href="javascript:void(0)" onclick="modifyComment(this, <%=ic.getIcNo()%>,<%=inq.getInquiry_no()%>);">수정</a>
								<a href="javascript:void(0)" onclick="deleteComment(this, <%=ic.getIcNo()%>,<%=inq.getInquiry_no()%>);">삭제</a>
							<%} %>
						<%} %>
					</p>
				</li>
			</ul>
			<%} %>
		</div>
	</div>
	<script>
		function inquiryDelete(inquiryNo) {
			if(confirm("문의사항을 삭제하시겠습니까?")) {
				location.href="/inquiryDelete.do?inquiryNo="+inquiryNo;
			}
		}
		function modifyComment(obj,icNo,inquiryNo) {
			$(obj).parent().prev().show(); //textarea 화면에보여줌
			$(obj).parent().prev().prev().hide(); //내용을 보여주던 p태그
			//수정 -> 수정완료
			$(obj).text("수정완료");
			$(obj).attr("onclick","modifyComplete(this,"+icNo+","+inquiryNo+")");
			//삭제 -> 수정취소
			$(obj).next().text("수정취소");
			$(obj).next().attr("onclick","modifyCancel(this,"+icNo+","+inquiryNo+")");
			//답글달기버튼 숨김
			$(obj).next().next().hide();
		}
		function modifyCancel(obj,icNo,inquiryNo) {
			$(obj).parent().prev().hide(); //textarea 숨김
			$(obj).parent().prev().prev().show(); //기존 댓글 보여줌
			//수정완료 -> 수정
			$(obj).prev().text("수정");
			$(obj).prev().attr("onclick","modifyComment(this,"+icNo+","+inquiryNo+")");
			//수정취소 -> 삭제
			$(obj).text("삭제");
			$(obj).attr("onclick","deleteComment(this,"+icNo+","+inquiryNo+")");
			//답글달기 버튼 보여줌
			$(obj).next().show();
		}
		function modifyComplete(obj,icNo,inquiryNo){
			//form태그를 생성해서 전송
			//1. form태그생성
			const form = $("<form action='/inquiryCommentUpdate.do' method='post'></form>");
			//2. input태그 생성(ncNo)
			const icInput = $("<input type='text' name='icNo'>");
			//ncNo값 세팅
			icInput.val(icNo);
			//form태그에 추가
			form.append(icInput);
			//3. input태그 생성(noticeNo)
			const inquiryInput = $("<input type='text' name='inquiryNo'>");
			inquiryInput.val(inquiryNo);
			form.append(inquiryInput);
			//4. textarea
			const icContent = $(obj).parent().prev();
			form.append(icContent);
			//body태그에 생성한 form태그를 추가
			$("body").append(form);
			//form태그 전송
			form.submit();
		}
		function deleteComment(obj,icNo,inquiryNo) {
			if(confirm("댓글을 삭제하시겠습니까?")){
				location.href="/deleteInquiryComment.do?icNo="+icNo+"&inquiryNo="+inquiryNo;
			}
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>