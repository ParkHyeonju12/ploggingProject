<%@ page import="java.util.ArrayList" %>
<%@ page import="com.earthpurging.chellenge.model.vo.Chellenge" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    ArrayList<Chellenge> list = (ArrayList<Chellenge>) request.getAttribute("list");
    String pageNavi = (String)request.getAttribute("pageNavi");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자페이지 - 챌린지관리</title>
    <link rel="stylesheet" href="/css/style-mypage-admin.css">
    <style>
        #pageNavi{
            margin-top:30px;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    <!-- content -->
    <div class="page-content">

        <div class="content-wrap flex">
            <%@include file="adminSide.jsp"%>
            <div class="content-container">
                <div class="content-title">
                    <h1>챌린지관리</h1>
                </div>
                <div class="content-body" style="">
                    <ul class="challenge-list">
                        <%for(Chellenge clg : list){%>

                        <li <%if(clg.getPermission()=='Y'){%>class="is-active"<%}%>>
                            <h5><%=clg.getNickname()%>님의 퀘스트 완료 신청</h5>
                            <dl><dt>신청일</dt><dd><%=clg.getQuestDate()%></dd><dt>지역</dt><dd><%=clg.getQuestArea().split("/")[1].split(":")[1]%></dd></dl>
                            <div class="collapse" id="detail<%=clg.getQuestNO()%>">
                                <div class="collapse-body">
                                    <h6>인증샷</h6>
                                    <div class="challenge-img">
                                        <img src="/upload/chellenge/<%=clg.getPhotopath()%>" alt="">
                                    </div>
                                    <h6>신청품목</h6>
                                    <table class="tbl challenge-tbl" width="300">
                                        <colgroup>
                                            <col width="10%">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>종류</th>
                                            <th>캔류</th>
                                            <th>유리류</th>
                                            <th>종이류</th>
                                            <th>페트류</th>
                                            <th>기타/일반</th>
                                            <th>비닐류</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <th>개수</th>
                                            <td><%=clg.getQuestCan()%></td>
                                            <td><%=clg.getQuestGlass()%></td>
                                            <td><%=clg.getQuestPaper()%></td>
                                            <td><%=clg.getQuestPla()%></td>
                                            <td><%=clg.getQuestTabacoo()%></td>
                                            <td><%=clg.getQuestWrapper()%></td>
                                        </tr>
                                        <tr>
                                            <th>총점</th>
                                            <td><%=clg.getQuestCan()*3%></td>
                                            <td><%=clg.getQuestGlass()*2%></td>
                                            <td><%=clg.getQuestPaper()*2%></td>
                                            <td><%=clg.getQuestPla()*3%></td>
                                            <td><%=clg.getQuestTabacoo()%></td>
                                            <td><%=clg.getQuestWrapper()%></td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" style="border:0;text-align:right;">총점  <span style="color:var(--main-bg-color);font-weight:800;font-size:18px;"><%=clg.getQuestPoint()%></span></td>
                                        </tr>
                                        </tbody>

                                    </table>
                                    <%if(clg.getPermission() == 'N'){%>
                                    <div class="btn-group">
<%--                                        <input type="hidden" id="testPoint" value="<%=clg.getQuestPoint()%>">--%>
                                        <button type="button" class="btn bc2 f-bold btn-update" data-update-target="<%=clg.getQuestNO()%>">승인</button>
                                        <button type="button" class="btn bc6 f-bold">거절</button>
                                    </div>
                                    <%}%>
                                </div>
                            </div>

                            <button type="button" class="btn bc2" data-toggle="collapse" data-target="#detail<%=clg.getQuestNO()%>">상세보기</button>

                        </li>

                        <%}%>
                        <%--<li>
                            <h5>김광섭님의 퀘스트 완료 신청</h5>
                            <dl><dt>신청일</dt><dd>2022.10.01</dd><dt>지역</dt><dd>서울</dd></dl>

                            <div class="collapse" id="detail2">
                                <div class="collapse-body">
                                    <h6>인증샷</h6>
                                    <div class="challenge-img">
                                        <img src="img/img-banner-donation.jpeg" alt="">
                                    </div>
                                    <h6>신청품목</h6>
                                    <table class="tbl challenge-tbl" width="300">
                                        <colgroup>
                                            <col width="10%">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>종류</th>
                                            <th>캔류</th>
                                            <th>유리류</th>
                                            <th>종이류</th>
                                            <th>페트류</th>
                                            <th>기타/일반</th>
                                            <th>비닐류</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <th>개수</th>
                                            <td>2</td>
                                            <td>1</td>
                                            <td>0</td>
                                            <td>1</td>
                                            <td>1</td>
                                            <td>0</td>
                                        </tr>
                                        <tr>
                                            <th>총점</th>
                                            <td>6</td>
                                            <td>3</td>
                                            <td>0</td>
                                            <td>2</td>
                                            <td>1</td>
                                            <td>0</td>
                                        </tr>
                                        </tbody>

                                    </table>
                                    <div class="btn-group">
                                        <button type="button" class="btn bc2 f-bold">승인</button>
                                        <button type="button" class="btn bc6 f-bold">거절</button>
                                    </div>
                                </div>
                            </div>

                            <button type="button" class="btn bc2" data-toggle="collapse" data-target="#detail2">상세보기</button>

                        </li>--%>
                    </ul>

                    <div id="pageNavi"><%=pageNavi %></div>
                </div>
            </div>
        </div>
    </div>
    <!-- // content -->
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
    <script src="/js/sideMenu.js"></script>
    <script>

        const collapseBtn = document.querySelectorAll("[data-toggle='collapse']");

        collapseBtn.forEach(function(item, index) {
            item.addEventListener("click", function() {

                const collapseTarget = document.querySelector(this.dataset.target);
                const collapseBody = collapseTarget.querySelector(".collapse-body");
                const bodyHeight = collapseBody.offsetHeight;

                if(collapseTarget.classList.contains("active")) {
                    this.innerText = "상세보기";
                    collapseTarget.classList.remove("active");
                    collapseTarget.style.height = 0 +"px";
                } else {
                    this.innerText = "간략히";
                    collapseTarget.classList.add("active");
                    collapseTarget.style.height = bodyHeight+"px";
                }
            })
        })


        $(document).ready(function() {

            $(".btn-update").on("click", function(){
                const questNo = this.dataset.updateTarget;
                //const updatePoint = this.dataset.updatePoint;
                // console.log(questNo);

                $.ajax({
                    url :"/ajaxUpdateMemberPoint.do",
                    type : "post",
                    // async: false,
                    data : {questNo:questNo},
                    success : function(data) {

                        // console.log(data)
                        if(data>0) {
                            window.location = "/adminChallenge.do?reqPage=1";
                        } else {
                            alert("삭제실패")
                        }
                    }
                })

            })

        })
    </script>
</div>
</body>
</html>
