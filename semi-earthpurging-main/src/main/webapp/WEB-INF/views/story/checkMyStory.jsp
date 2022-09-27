<%@page import="com.earthpurging.story.model.vo.Story"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	ArrayList<Story> list =(ArrayList<Story>)request.getAttribute("list");
  		String pageNavi = (String)request.getAttribute("pageNavi");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="/css/PhotoStory.css">

<style>
	#pageNavi{
		margin: 30px;
		textalign : center;
	}
	.story-box{
    width: 320px;
    height : 460px;
    padding: 0px;
    float: left;
    margin: 0 auto;
    text-align: center;
    
	}
	.modal-top>span:hover{
    cursor: pointer;
	}
	#story-nickname{
	font-size: 22px;
    font-weight: 800;
    color: var(--main-bg-color);
	}
	#storyWriter{
	font-size: 18px;
    font-weight: 800;
    color: var(--main-bg-color);
	}
	.read-count{
	display: flex;
	align-items: center;
	}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="page-content">
    	<div class="story-title">
        	<h1>PHOTO STORY</h1>
            <% if(m!= null) {%>
            <div>
            	<a href="/storyWriteFrm.do" class="btn bc3">후기쓰기</a>
            	<a href="/storyList.do?reqPage=1" class="btn bc3">전체글확인</a>
            </div>
            
            <%}else {%>
            <div><a href="/common/signinFrm.jsp" class="btn bc3">후기쓰기</a></div>
            <%} %>
        </div>
        <div class="mid-content">
            <div class="story-menu">
            	<ul>
               		<li><a ref="/storyList.do?reqPage=1">PHOTO STORY</a></li>
                    <%--<li><a ref="#">COMMUNITY</a></li> --%>
               	</ul>
           	</div> 
            <div class="story-wrap">
              	<div class="storylist"> 
              	<%for(Story s : list) { %>
                	<div class="story-box" data-idx="<%=s.getStoryNo()%>">
                        <div class="photo-box">
                       	<!--예시이미지-->
                       	
                        <a href="#"><img src="/upload/story/<%=s.getPhotoPath() %>"></a>
                   		</div>
                       	<div class="like-box">
							<span id="storyWriter"><%=s.getNickname() %></span>
							<div class="read-count">
                            <span class="material-symbols-outlined">visibility</span>
                            <%=s.getStoryReadCount() %>							
							</div>
                        </div> 
                        <div class="story-text">
                       		<a href="#상세페이지"><span><%=s.getStoryContent() %></span></a>
                        </div>
                       
						<% if(m != null) {%> 
						    <% if(m.getMemberNo()== s.getStoryWriter()){ %>                  
                        	<div class="pix-area">
                            	<a href="/storyUpdateFrm.do?storyNo=<%=s.getStoryNo()%>" class="btn bc2">수정</a>
                            	<a href="/storyDelete.do?storyNo=<%= s.getStoryNo()%> "class="btn bc2">삭제</a>
                        	</div> 
                        	<%}else if(m.getMemberLevel() == 1) { %>
                        	<div class="pix-area">
                            	<a href="/storyDelete.do?storyNo=<%= s.getStoryNo()%> "class="btn bc2">삭제</a>
                        	</div> 
                        	<%}else {%>
                        		<div class="pix-area" display="hidden"></div>
                        	<%} %>
                        <%}else{ %>
                        <div class="pix-area" display="hidden"></div>
                        <%} %>
                	</div>
      			<%} %>
                </div>
           	</div>
      	</div>
        <div id="pageNavi"><%=pageNavi %></div>
        
        <div class="story-modal">
                <div class="modal-wrap" style="margin-top:0">
                    <div class="modal-top">
                        <h1><span id="story-nickname"></span>님의 PHOTO STORY</h1>
                        <span class="material-symbols-outlined" id="modal-close">close</span>
                    </div>
                    <div class="modal-mid">
                        <div class="modal-photo" id="modal-photo">
                            <img id="story-img" src=""><br>
                            <span id="read-count"></span>
                            <span id="reg-date"></span>
                        </div>
                        <div class="modal-text">
                            <span id="modal-text"></span>
                        </div>
                    </div>
                    <div class="story-comment">
                        <ul class="posting-comment">
                            <li>
                                <p class="comment-info">
                                    <span id="sc-writer"></span>
                                    <span id="sc-date"></span>
                                </p>
                                <p class="comment-content"></p>                
                            </li>
                        </ul>
                    </div>
                    <%if(m!=null){ %>
                    <div class="input-comment-box">
                      	<ul>
                           <li>
                               	<input type="hidden" name="scWriter" id="hiddenWriter"value="<%=m.getMemberNo()%>">
                                <input type="hidden" name="storyRef" id="storyRef"value="">
                                <input type="hidden" name="scRef" id="hiddenScRef" value="0"><%--대댓글용 댓글번호 --%>
                                <textarea class="input-form" name="scContent" id="hiddenScContent"></textarea>
                           </li>
                           <li>
                                <button type="button" id="commentBtn"class="btn bc5 bs4">댓글달기</button>
                           </li>
                        </ul>
                    </div>
                    <%} %>
            </div>
    </div>s
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
	
	const nickname = $("#story-nickname");
	const img = $("#story-img");
	const storyContent = $("#modal-text");
	const storyReadCount = $("#read-count");
	const storyRegDate = $("#reg-date");
	const storyRef = $("#storyRef");
	const scWriter = $("#sc-writer");
	const scDate = $("#sc-date");
	const scContent = $(".comment-content");
	
	
	/*상세페이지 닫기*/ 
	$("#modal-close").on("click",function(){
	    $(".story-modal").css("display","none");
	    nickname.empty();
	    img.attr("str","");
	    storyContent.empty();
	    storyReadCount.empty();
	    storyRegDate.empty();
	    storyRef.attr("value","");
	    scWriter.empty();
	    scDate.empty();
	    scContent.empty();
	    
	    
	});

	/*상세페이지 띄우기*/
	$(".story-box",).on("click",function(){
		
	    $(".story-modal").css("display","flex");
	});
	
	
	$(".story-box").on("click",function(){
		const storyIdx = $(this).attr("data-idx");
		console.log(storyIdx);
		
		$.ajax({
			url: "/storyView.do",
			type: "get",
			data: {storyNo : storyIdx},
			//async : false,
			dataType : "json",//json타입인 것을 명시 2(servlet에서 명시하거나 jsp에서 명시)
			success: function(data){
				console.log(data);
				if(data == null){
					//.append("회원 정보를 조회할 수 없습니다.");
				}else{
					nickname.append(data.s.nickname);
					img.attr("src","/upload/story/"+data.s.photoPath);
					storyContent.append(data.s.storyContent);
					storyReadCount.append("조회수 : "+data.s.storyReadCount);
					storyRegDate.append(data.s.storyRegDate);
					storyRef.attr("value",data.s.storyNo);
					
					const storyComment = $(".story-modal .story-comment");
					storyComment.empty();
					
					for(let i=0;i<data.scList.length;i++){
						
						let html = '';
						
						html += '<ul class="posting-comment">';
						html += '<li>';
                        html += '<p class="comment-info">';
                        html += '   <span id="sc-writer">' + data.scList[i].scNickname + '</span>';
                        html += '   <span id="sc-date">'+ data.scList[i].scDate +'</span>';
                        html += '</p>';
                        html += '<p class="comment-content">' + data.scList[i].scContent + '</p>';          
                    	html += '</li>';
                    	html += '</ul>';
                    	storyComment.append(html);
						
               			
					}
					
					//result.append("이름 : "+data.memberName+"<br>");
					//result.append("전화번호 : "+data.memberPhone+"<br>");
					
				
				}
			},
			error: function(){
				console.log("정보조회실패");
			}
		})
	});
	
	$("#commentBtn").on("click",function(){
		const scWriter = $("#hiddenWriter").val();
		const scRef = $("#hiddenScRef").val();
		const scContent = $("#hiddenScContent").val();
		const storyRef = $("#storyRef").val();
		
		$.ajax({
			url: "/insertStComment.do",
			type: "get",
			data: {scWriter:scWriter, scRef:scRef, scContent:scContent, storyRef:storyRef},
			dataType: "json",
			//async:false,
			success: function(data){
				console.log(data);
				
				const storyComment = $(".story-modal .story-comment");
				storyComment.empty();
				
				if(data.length > 0) {
					for( let i=0; i<data.length;i++){
						let html = '';
						
						html += '<ul class="posting-comment">';
						html += '<li>';
                        html += '<p class="comment-info">';
                        html += '   <span id="sc-writer">' + data[i].scNickname + '</span>';
                        html += '   <span id="sc-date">'+ data[i].scDate +'</span>';
                        html += '</p>';
                        html += '<p class="comment-content">' + data[i].scContent + '</p>';          
                    	html += '</li>';
                    	html += '</ul>';
                    	
                    	storyComment.append(html);
						
						}
					}
		
			}
		});
	});
	
	</script>
</body>
</html>