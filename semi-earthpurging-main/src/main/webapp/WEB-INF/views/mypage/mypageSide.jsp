
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="side-menu">
    <ul>
        <li class="active"><a href="/mypage.do">메인</a></li>
        <%if(m.getMemberLevel() > 1) {%>
        <li><a href="/mypageInfo.do">나의 정보</a></li>
        <%}%>
        <li><a href="/mypageDonationList.do">후원내역</a></li>
        <li><a href="/mypagePloggingList.do">플로깅 신청내역</a></li>
    </ul>
</div>
