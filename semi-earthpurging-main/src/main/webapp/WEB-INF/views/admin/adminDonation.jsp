<%@ page import="java.util.ArrayList" %>
<%@ page import="com.earthpurging.donation.model.vo.Donation" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    ArrayList<Donation> list = (ArrayList<Donation>) request.getAttribute("list");
    int totalDonation = (int) request.getAttribute("totalDonation");
    DecimalFormat formatter = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자페이지 - 후원관리</title>
    <link rel="stylesheet" href="/css/style-mypage-admin.css">
    <style>
        .btn:disabled{
            opacity: .5;
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
                    <h1>후원관리</h1>
                </div>
                <div class="content-body" style="padding-left:0;padding-right:0;">

                    <table class="tbl tbl-hover user-tbl">
                        <colgroup>
                            <col width="auto">
                            <col width="auto">
                            <col width="auto">
                            <col width="auto">
                            <col width="15%">
                        </colgroup>
                        <tbody>
                        <tr class="tr-5">
                            <th>신청자</th>
                            <th>아이디</th>
                            <th>전화번호</th>
                            <th>후원금액</th>
                            <th></th>
                        </tr>
                        <%for(Donation d : list) {%>
                        <tr class="">
                            <td><%=d.getDonationName()%></td>
                            <td><%=d.getMemberId()%></td>
                            <td><%=d.getDonationPhone()%></td>
                            <td class="td-amount"><%=formatter.format(d.getDonationAmount())%></td>
                            <td><button type="button" class="btn bc4" onclick="alert('준비중입니다.')">취소</button></td>
                        </tr>
                        <%}%>

                        <tr class="row-total">
                            <td colspan="4">
                                <dl>
                                    <dt>총 금액</dt>
                                    <dd><%=formatter.format(totalDonation)%> <span>원</span></dd>
                                </dl>
                            </td>
                            <td></td>
                        </tr>
                        </tbody>
                    </table>
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
