
<%@page import="com.earthpurging.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		Member m = (Member)session.getAttribute("m");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- 구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    
    <!-- jquery -->
    <script src="/js/jquery-3.6.0.js"></script>
    <!-- 기본 CSS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/default.css"/>
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/footer.css" />
    <link rel="stylesheet" href="/css/storyWriteFrm.css">
    
    <!-- 기본 js -->
    <script src="/js/default.js"></script>
    <script src="/js/sweetalert.min.js"></script>
</head>
<body>
	<header>
        <div class="upload-header">
            <div class="logo-img">
                <a href="/"><img src="img/common/logo-plogging.png" style="width: 100%"></a>
            </div>
        </div>
    </header>
    
    <div class="page-content">
        <div class="storyFrm">
            <form action="/storyWrite.do" method="post" enctype="multipart/form-data" id="storyFrm">
                <table class="tbl storyWrite">
                    <tr class="tr-1">
                        <th class="td-2">이미지</th>
                        <td>
                            <input type="file" name="upfile" accept=".jpg,.png,.jpeg" onchange="loadImg(this);">
                        </td>
                    </tr>
                    <tr class="tr-1">
                        <td colspan="2">
                            <div id="story-img-viewer">
                                <img id="story-img-view" width="400px">
                            </div>
                        </td>
                    </tr>
                    <tr class="tr-1">
                        <td colspan="2">
                            <textarea name="storyContent" class="input-form"></textarea>
                        </td>
                    </tr>
                    <tr class="tr-1">
                        <th class="StoryBtn" colspan="2">
                        	<input type="hidden" name="storyWriter" value="<%=m.getMemberNo()%>">
                            <button type="submit" class="btn bc5">올리기</button>
                            <a href="/storyList.do?reqPage=1"class="btn bc5">취소하기</a>
                        </th>
                    </tr>
             
                </table>
            </form>
        </div>
    </div>
    <script src="/js/storyImg.js"></script>
</body>
</html>