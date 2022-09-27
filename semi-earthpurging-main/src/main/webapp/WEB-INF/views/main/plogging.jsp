<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <link href="http://fonts.cdnfonts.com/css/dunggeunmo" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/index_content.css">
    <link rel="stylesheet" href="/css/index_button.css">
    
    <link rel="stylesheet" href="/css/plogging_content.css">

<title>지구푸르깅</title>
</head>
<body>
	<div class="wrapper">
		<%@include file="/WEB-INF/views/common/header.jsp" %>
		
        <!-- content -->
        <div class="page-content">
            <div class="page-open-content">
                <div class="page-open-title">현재 진행 중인 플로깅</div>
                <div class="open-left">
                    <div class="open-img"><img src="/img/common/plogging1.jpg" alt=""></div>
                    <a href="/plogging1.do"><div class="open-btn">참여하기</div></a>
                </div>
                <div class="open-right">
                    <div class="open-img"><img src="/img/index/ploggings_img2.png" alt=""></div>
                    <a href="/plogging2.do"><div class="open-btn">참여하기</div></a>
                </div>
            </div>
        </div>
		<!-- // content -->
		
		<%@include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
<!-- script Line -->
    <script>
    </script>
    <!-- End script Line -->
</body>
</html>