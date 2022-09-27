<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="page-title">쓰담<span class="page-title3">소식</span></div>
		<div class="notice-navi-wrap">
			<div class="navi-wrap">
				<div><a href="/noticeList.do?reqPage=1">공지사항</a></div>
				<div><a href="/FAQ.do">FAQ</a></div>
				<div><a href="#">문의하기</a></div>
			</div>
		</div>
		<div class="inquiryFrm-wrap">
			<span><a href="#">1:1문의</a></span>
			<span><a href="/inquiryList.do?reqPage=1">문의사항 조회</a></span>
			<div class="one-to-one">
				<div class="inquiry-title">
					<div>상품/배송 등 쇼핑 관련 문의는 고객센터에서 요청해주세요.</div>
				</div>
				<form action="/inquiry.do" method="post" enctype="multipart/form-data">
					<table class="inquiry-tbl" id="inquiryWrite">
						<tr>
							<th class="th">문의유형</th>
							<td>
								<select name="inquiry-type" class="inquiry-type">
									<option name ="type" value="문의유형">문의유형</option>
									<option name="donation" value="후원문의">후원문의</option>
									<option name="quest" value="챌린지문의">챌린지문의</option>
									<option name="goods" value="상품문의">상품문의</option>
								</select>
							</td>
						</tr>
						<tr>
							<th class="th">문의자 이름</th>
							<td>
								<input type="text" name="inquirer" id="inqName">
							</td>
						</tr>
						<tr>
							<th class="th">문의자 이메일</th>
							<td>
								<input type="text" name="inquirerEmail" id="inqEmail">
							</td>
						</tr>
						<tr>
							<th class="th">문의제목</th>
							<td>
								<input type="text" name="inquiryTitle" id="inqTitle">
							</td>
						</tr>
						<tr>
							<th class="th">문의내용</th>
							<td>
								<textarea class="input-form" name="inquiryContent" id="inqContent"></textarea>
							</td>
						</tr>
						
							
							<input type="hidden" name="upfile">
						
						<tr>
							<td colspan="2">
								<div>
									<input type="checkbox" name="agree" class="infoChk">개인정보 수집 및 이용동의 *
								</div>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<button type="" class="btn writeBtn" id="writeBtn">제출하기</button>
							</th>
						</tr>	
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<script>
		$("#writeBtn").on("click", function(e){
			if($(".inquiry-type").val() == '문의유형'){
				alert("문의유형을 선택해주세요.");
				e.preventDefault();
				return;
			}else {
				if($("#inqName").val() == ''){
					alert("이름을 작성해주세요.");
					e.preventDefault();
					return;
				}else {
					if($("#inqEmail").val() == ''){
						alert("이메일을 작성해주세요.");
						e.preventDefault();
						return;
					}else {
						if($("#inqTitle").val() == ''){
							alert("문의 제목을 작성해주세요.");
							e.preventDefault();
							return;
						}else {
							if($("#inqContent").val() == ''){
								alert("문의할 내용을 작성해주세요.");
								e.preventDefault();
								return;
							}else {
								
							}
						}
					}
				}

			}		
			if($(".infoChk").is(":checked")){
			  $('#writeBtn').prop("type", "submit");
			}else{
			  $('#writeBtn').prop("type", "button");
			  alert("개인정보 수집이용에 동의해주세요.");
			}
	
		});
		
		
		
	</script>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>