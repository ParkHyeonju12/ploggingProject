<%@page import="com.earthpurging.index.model.vo.ChellengeMemberData"%>
<%@page import="com.earthpurging.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		Member m = (Member)session.getAttribute("m");
    	ChellengeMemberData cmd = (ChellengeMemberData)session.getAttribute("cmd"); 
	%>
    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- header -->
<header>
    <div class="header-container">
        <div class="header-top">
            <div class="header-logo">
                <a href="/"><img src="/img/common/logo-plogging.png" alt="plogging"></a>
            </div>
            <div class="header-center">
                <a href="/"><img src="/img/common/img-main-title.png" alt=""></a>
            </div>
            <div class="header-button">
                <a href="/common/donation.jsp" >지구쓰담 후원하기</a>
            </div>
        </div>
        <div class="header-bottom">
            <ul class="header-menu">
                <li><a href="/mainPage.do?reqPage=1">줍깅 캠페인</a></li>
                <li><a href="/chellengeFrm.do?reqPage=1">쓰담위크 퀘스트</a></li>
                <li><a href="/storyList.do?reqPage=1">쓰담 스토리</a></li>
                <li><a href="/noticeList.do?reqPage=1">쓰담 소식</a></li>
                <li><a href="/plogging.do">진행중인 플로깅</a></li>
                <%if(m!=null && m.getMemberLevel() == 1) {%>
                <li><a href="/admin.do">관리자</a></li>
                <%}%>
            </ul>
            <ul class="util-menu">
                <%if(m!=null){%>
                <li><a href="/mypage.do"><%=m.getNickname()%></a></li>
                <li><a href="/logout.do">로그아웃</a></li>
                <%} else {%>
                <li><a href="/common/signinFrm.jsp">로그인/회원가입</a></li>
                <%}%>
            </ul>
        </div>
    </div>
</header>
<!-- // header -->