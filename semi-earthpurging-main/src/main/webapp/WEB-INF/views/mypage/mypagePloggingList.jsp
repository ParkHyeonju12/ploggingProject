<%@ page import="com.earthpurging.mypage.model.vo.Crew" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    ArrayList<Crew> list = (ArrayList<Crew>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지 - 플로깅신청내역</title>
    <link rel="stylesheet" href="/css/style-mypage-admin.css">
</head>
<body>
    <div class="wrapper">
        <%@include file="/WEB-INF/views/common/header.jsp" %>
        <!-- content -->
        <div class="page-content">

            <div class="content-wrap flex">
                <%@include file="mypageSide.jsp"%>
                <div class="content-container">
                    <div class="content-title">
                        <h1>플로깅 신청내역</h1>
                        <p>오늘도 열심히 푸르깅!</p>
                    </div>
                    <div class="content-body">
                        <ul class="plogging-list">
                            <%for(Crew c : list) {%>
                            <li>
                                <h3><%=c.getCrewKind()%></h3>
                                <div>
                                    <dl><dt>신청일자</dt><dd>-</dd></dl>
                                    <dl>
                                        <dt>장소</dt>
                                        <dd><%=c.getCrewPlace()%></dd>
                                    </dl>
                                    <div class="btn-group">
                                        <a href="/plogging.do" class="btn bc3">자세히 보기</a>
                                        <a href="/cancelPlogging.do?crewNo=<%=c.getCrewNo()%>" class="btn bc4">신청취소</a>
                                    </div>
                                </div>
                                <div>
                                    <img src="/img/img-mypage-plogging.png" alt="">
                                </div>
                            </li>
                            <%}%>
                            <%--
                            <li>
                                <h3>힙한 지구인의 달리기</h3>
                                <div>
                                    <dl><dt>신청일자</dt><dd>2022-10-10</dd></dl>
                                    <dl>
                                        <dt>장소</dt>
                                        <dd>당산 kh정보교육원 스타벅스 앞</dd>
                                    </dl>
                                    <div class="btn-group">
                                        <a href="" class="btn bc3">자세히 보기</a>
                                        <a href="" class="btn bc4">신청취소</a>
                                    </div>
                                </div>
                                <div>
                                    <img src="img/img-plogging-01.png" alt="">
                                </div>
                            </li>
                            --%>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
        <!-- // content -->
        <%@include file="/WEB-INF/views/common/footer.jsp" %>
        <script src="/js/sideMenu.js"></script>
    </div>
</body>
</html>
