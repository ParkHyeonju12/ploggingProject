<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>줍줍줍</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/default.css">

</head>
<body>
	<div class="wrapper">
		<%@include file="/WEB-INF/views/common/header.jsp" %>
		<div class="page-content">
			<form action="/signin.do" method="post">
				<div class="input-wrap">
					<label for="signId">아이디</label>
					<input type="text" name="signId" class="signId" id="signId">
				</div>
				<div class="input-wrap">
					<label for="signId">비밀번호</label>
					<input type="password" name="signPw" class="signPw" id="signPw">
				</div>
				<button type="submit" class="submit-btn">로그인</button>
			</form>
		</div>
		<%@include file="/WEB-INF/views/common/footer.jsp" %>
	</div>

</body>
</html>