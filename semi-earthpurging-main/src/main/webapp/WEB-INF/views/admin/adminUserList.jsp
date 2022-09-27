<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
    String pageNavi = (String) request.getAttribute("pageNavi");

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 - 회원관리</title>
    <link rel="stylesheet" href="/css/style-mypage-admin.css">
    <style>
        #pageNavi{margin-top:50px;}
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
                    <h1>회원관리</h1>
                </div>
                <div class="content-body" style="padding-left:0;padding-right:0;">

                    <table class="tbl tbl-hover user-tbl">

                        <tbody>
                        <tr class="tr-5">
                            <th>이름</th>
                            <th>아이디</th>
                            <th>전화번호</th>
                            <th>이메일</th>
                            <th>주소</th>
                            <th></th>
                            <!-- <th></th> -->
                        </tr>
                        <%for(Member member : list ) {%>
                        <tr class="">
                            <td><%=member.getMemberName()%></td>
                            <td><%=member.getMemberId()%></td>
                            <td><%=member.getMemberPhone()%></td>
                            <td><%=member.getMemberEmail()%></td>
                            <td><%=member.getMemberAddr()%></td>
                            <td><%--<button type="button" class="btn bc2" data-target="<%=member.getMemberNo()%>" onclick="deleteMember(this)">삭제</button>--%></td>
                        </tr>
                        <%}%>

                        </tbody>
                    </table>
                    <div id="pageNavi"><%=pageNavi %></div>
                </div>
            </div>
        </div>
    </div>
    <!-- // content -->
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
    <script src="/js/sideMenu.js"></script>
    <script src="/js/sweetalert.min.js"></script>
    <script>
        function deleteMember(el) {
            const targetNo = el.dataset.target;

            swal({
                title: "회원을 삭제하시겠습니까?",
                text: "",
                icon: "warning",
                buttons: true,
                dangerMode: true,
                buttons: ["취소", "삭제하기"],

            }).then((willDelete) => {
                if (willDelete) {
                    //window.location = "/adminDeleteMember.do?reqPage=1&memberNo=" + targetNo;

                    $.ajax({
                        url :"/adminDeleteMember.do",
                        type : "post",
                        //async: false,
                        data : {memberNo:targetNo},
                        success : function(data) {

                            console.log(data)
                            if(data>0) {
                                window.location = "/adminUserList.do?reqPage=1";
                            } else {
                                alert("삭제실패")
                            }
                        }
                    })

                }
            });
        }
    </script>
</div>
</body>
</html>
