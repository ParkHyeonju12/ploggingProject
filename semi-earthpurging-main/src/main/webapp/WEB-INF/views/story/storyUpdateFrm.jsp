<%@page import="com.earthpurging.story.model.vo.Story"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    	Story s = (Story)request.getAttribute("s");
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
            <form action="/storyUpdate.do" method="post" enctype="multipart/form-data" id="storyFrm">
                <table class="tbl storyWrite">
                    <tr class="tr-1">
                        <th class="td-2">이미지</th>
                        <td>
                        	<input type="hidden" name="storyNo" value="<%=s.getStoryNo() %>">
                        	<input type="hidden" name="status" value="stay">
                        	
                            <% if (s.getPhotoPath() != null) { %>
                            <%--첨부파일 있을 때 --%>
                            <span class="delFile"><%=s.getPhotoPath() %></span>
                            <button type="button" class="btn bc1 delFile">삭제</button>
                            <input type="file" name="upfile" accept=".jpg,.png,.jpeg" onchange="loadImg(this);" style="display:none;">
                            <input type="hidden" name="oldPhotopath" value="<%=s.getPhotoPath() %>">
                            <%}else {%>
                            <%--첨부파일 없을 때 --%>
                            <input type="file" name="upfile" accept=".jpg,.png,.jpeg" onchange="loadImg(this);">
                            <%} %>
                  
                        </td>
                    </tr>
                    <tr class="tr-1">
                        <td colspan="2">
                            <div id="story-img-viewer">
                                <img src="/upload/story/<%=s.getPhotoPath()%>"id="story-img-view" width="400px">
                            </div>
                        </td>
                    </tr>
                    <tr class="tr-1">
                        <td colspan="2">
                            <textarea name="storyContent" class="input-form"><%=s.getStoryContent() %></textarea>
                        </td>
                    </tr>
                    <tr class="tr-1">
                        <th class="StoryBtn" colspan="2">
                            <button type="submit" class="btn bc5">수정완료</button>
                            <a href="/storyList.do?reqPage=1"class="btn bc5">취소하기</a>
                        </th>
                    </tr>
                </table>
            </form>
        </div>
    </div>
   	<script>
   		
   		$("button.delFile").on("click",function(){
   			$(".delFile").hide();
   			$("#story-img-viewer>img").attr("src","");
   			$(this).next().show();
   			$("[name=status]").val("delete");
   		});
   		
    </script>	
    <script src="/js/storyImg.js"></script>
</body>
</html>