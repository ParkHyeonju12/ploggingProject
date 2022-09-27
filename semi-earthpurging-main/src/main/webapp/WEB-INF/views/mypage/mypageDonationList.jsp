<%@ page import="java.util.ArrayList" %>
<%@ page import="com.earthpurging.donation.model.vo.Donation" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    ArrayList<Donation> list = (ArrayList<Donation>) request.getAttribute("list");
    DecimalFormat formatter = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지 - 후원내역</title>
    <link rel="stylesheet" href="/css/style-mypage-admin.css">
</head>
<body>
    <div class="wrapper">
        <%@include file="/WEB-INF/views/common/header.jsp" %>
        <!-- content -->
        <div class="page-content mypage-list">
            <div class="content-wrap flex">
                <%@include file="mypageSide.jsp"%>
                <div class="content-container">
                    <div class="content-title">
                        <h1>후원내역</h1>
                        <p>오늘도 열심히 푸르깅!</p>
                    </div>
                    <div class="content-body">
                        <table class="tbl tbl-hover">
                            <colgroup>
                                <col width="15%">
                                <col width="15%">
                                <col width="15%">
                            </colgroup>
                            <tbody>
                            <tr class="tr-5">
                                <th>날짜</th>
                                <th>종류</th>
                                <th>후원자</th>
                                <th>결제수단</th>
                                <th>후원금액</th>
                                <!-- <th></th> -->
                            </tr>
                            <%for(Donation d : list){%>
                            <%if(d.getMemberId().equals(m.getMemberId())){%>
                            <tr class="">
                                <td><%=d.getPayDate()%></td>
                                <td>일시후원</td>
                                <td><%=d.getDonationName()%></td>
                                <td>-</td>
                                <td><%=formatter.format(d.getDonationAmount())%></td>
                            </tr>
                            <%}%>
                            <%}%>

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
