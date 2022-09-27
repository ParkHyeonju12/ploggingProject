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
    <link rel="stylesheet" href="/css/FAQ.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title">쓰<span class="page-title2">담</span>소식</div>
		<div class="notice-navi-wrap">
			<div class="navi-wrap">
				<div><a href="/noticeList.do?reqPage=1">공지사항</a></div>
				<div><a href="/FAQ.do">FAQ</a></div>
				<div><a href="/inquiryFrm.do">문의하기</a></div>
			</div>
		</div>
		<div class="FAQ-wrap5">
			<ul>
				<li>
					<div class="question-icon5 que-icon">
						<span>Q</span>
						<span class="faq-font">어린이 또는 청소년의 참여가 가능한가요?</span>
						<img src="/img/news/arrowDown.png">
					</div>
					<p class="question-content5">
					가능합니다. 다만 보호자 동행하에 안전하게 쓰담 활동을 진행해주시기 바랍니다.
					</p>
				</li>
			</ul>
		</div>
		<div class="FAQ-wrap4">
			<ul>
				<li>
					<div class="question-icon4 que-icon">
						<span>Q</span>
						<span class="faq-font">쓰담달리기를 할 때 유의해야할 점이 있나요?</span>
						<img src="/img/news/arrowDown.png">
					</div>
					<p class="question-content4">
					코로나19 방역수칙을 준수하여 반드시 마스크를 착용하여 주시고, 가능한 1인 개별 활동으로 진행해주세요. 개인의 부주의로 안전문제가 발생할 경우, 주최 측에서는 책임지지 않습니다.
					</p>
				</li>
			</ul>
		</div>
		<div class="FAQ-wrap">
			<ul>
				<li>
					<div class="question-icon que-icon">
						<span>Q</span>
						<span class="faq-font">신청은 혼자 했는데 활동을 친구 또는 가족과 했습니다. 쓰담 기록지를 모두 제출하면 인정되나요?</span>
						<img src="/img/news/arrowDown.png">
					</div>
					<p class="question-content">
					사전신청을 한 인원에 한해서만 기록지 제출이 인정됩니다. 참여자 개별 사전 신청 바랍니다.
					</p>
				</li>
			</ul>
		</div>
		<div class="FAQ-wrap2">
			<ul>
				<li>
					<div class="question-icon2 que-icon">
						<span>Q</span>
						<span class="faq-font">참가신청만 하면 봉사시간이 인증되나요?</span>
						<img src="/img/news/arrowDown.png">
					</div>
					<p class="question-content2">
					아니요, 활동 후 반드시 쓰담 기록지를 제출해주셔야 합니다.
					</p>
				</li>
			</ul>
		</div>
		<div class="FAQ-wrap3">
			<ul>
				<li>
					<div class="question-icon3 que-icon">
						<span>Q</span>
						<span class="faq-font">쓰담 달리기 후 쓰레기는 어떻게 처리하나요?</span>
						<img src="/img/news/arrowDown.png">
					</div>
					<p class="question-content3">
					쓰담기록지 작성을 위해 쓰레기의 종류와 수량을 파악한 뒤, 분리배출 해주시기 바랍니다. 부패되거나 형태가 변형된 쓰레기는 일반쓰레기로 버려주세요.
					</p>
				</li>
			</ul>
		</div>
	</div>
	
	<script>
		$(".question-icon>img").on("click",function(){
			if($(this).parent().hasClass("active")) {
				$(this).parent().removeClass("active");
				$(this).parent().next().css("height","0px").css("padding-top","");
				$(".question-icon>img").attr("src","/img//news/arrowDown.png");
			} else {
				$(this).parent().addClass("active");
				$(this).parent().next().css("height","60px").css("padding-top","35px");
				$(".question-icon>img").attr("src","/img//news/arrowUp.png");
			}
		});
		$(".question-icon2>img").on("click",function(){
			if($(this).parent().hasClass("active")) {
				$(this).parent().removeClass("active");
				$(this).parent().next().css("height","0px").css("padding-top","");
				$(".question-icon2>img").attr("src","/img//news/arrowDown.png");
			} else {
				$(this).parent().addClass("active");
				$(this).parent().next().css("height","60px").css("padding-top","35px");
				$(".question-icon2>img").attr("src","/img//news/arrowUp.png");
			}
		});
		$(".question-icon3>img").on("click",function(){
			if($(this).parent().hasClass("active")) {
				$(this).parent().removeClass("active");
				$(this).parent().next().css("height","0px").css("padding-top","");
				$(".question-icon3>img").attr("src","/img//news/arrowDown.png");
			} else {
				$(this).parent().addClass("active");
				$(this).parent().next().css("height","60px").css("padding-top","35px");
				$(".question-icon3>img").attr("src","/img//news/arrowUp.png");
			}
		});
		$(".question-icon4>img").on("click",function(){
			if($(this).parent().hasClass("active")) {
				$(this).parent().removeClass("active");
				$(this).parent().next().css("height","0px").css("padding-top","");
				$(".question-icon4>img").attr("src","/img//news/arrowDown.png");
			} else {
				$(this).parent().addClass("active");
				$(this).parent().next().css("height","60px").css("padding-top","35px");
				$(".question-icon4>img").attr("src","/img//news/arrowUp.png");
			}
		});
		$(".question-icon5>img").on("click",function(){
			if($(this).parent().hasClass("active")) {
				$(this).parent().removeClass("active");
				$(this).parent().next().css("height","0px").css("padding-top","");
				$(".question-icon5>img").attr("src","/img//news/arrowDown.png");
			} else {
				$(this).parent().addClass("active");
				$(this).parent().next().css("height","60px").css("padding-top","35px");
				$(".question-icon5>img").attr("src","/img//news/arrowUp.png");
			}
		});
		
		
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>