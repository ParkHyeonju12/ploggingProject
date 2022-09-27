<%@page import="com.earthpurging.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	Member member = (Member)session.getAttribute("m");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쓰담위크</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/css/quest3.css">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.stepBth{
	color: #fff;
	font-family: DungGeunMo;
}
.button_su_inner{
  display: flex;
  justify-content: center;
} 
</style>
</head>
<body>
<div id="quick">
    <a class="kakao_btn" href="http://pf.kakao.com/_HxcUhb" target="_blank"><img src="/img/img/kakao.png" alt="카카오톡"></a>;
    <div class="top_btn1"><a href="/"><img src="/img/img/plog_logo.png" class="plog_logo"></a></div>
    <div class="top_btn"><p>↑<br>TOP</p></div>
  </div>
  <div id="step">
    <div class="sub_wrapper">

      <div class="top_title">
        <div class="border2">
          <div class="border3">
            <div class="top">
              <img src="/img/img/bumb_left.gif" alt="폭탄" class="bumb1">
              <h5>STEP 02</h5>
              <img src="/img/img/bumb_right.gif" alt="폭탄" class="bumb2">
            </div>
            <div class="bt">
              <img src="/img/img/sub_title.png" alt="쓰담기록">
            </div>
          </div>
        </div>
      </div>
      <!-- form -->
        <form id="inqForm" name="inqForm" method="post" action="/quest4.do" >
            <input type="hidden" name="step" value="2">
           <input type="hidden" name="memberNO" value="<%=member.getMemberNo()%>">
      <div class="form_wrap">
        <div class="form_title">
          힙한<span class="yellow"><img src="/img/img/star.png" alt="별"></span>지구인의 정보
        </div>

        <!--------------------------------------->
        <div class="form_box">
          <div class="flag_title">
            <p class="org">이름</p>
            <p class="shadow">이름</p>
          </div>

          <div class="form_cont">
            <input type="text" id="p_name" name="p_name" class="input_grey h100" placeholder="이름을 입력해 주세요." autocomplete="OFF">
          </div>

        </div>
        <!--------------------------------------->
        <div class="form_box">
          <div class="flag_title">
            <p class="org">연락처</p>
            <p class="shadow">연락처</p>
          </div>

          <div class="form_cont">
            <input type="tel" id="p_tel" name="p_tel"  onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" class="input_grey h100" placeholder="연락처를 입력해 주세요. 예시)010-1234-5678" autocomplete="OFF">
          </div>

        </div>
        <!--------------------------------------->
        <div class="form_box">
          <div class="flag_title">
            <p class="org">이메일</p>
            <p class="shadow">이메일</p>
          </div>

          <div class="form_cont">
            <input type="email" id="p_email" name="p_email" class="input_grey h100" placeholder="이메일을 입력해 주세요. 예시)hoo@naver.com"  autocomplete="OFF">
          </div>  

        </div>
        <!--------------------------------------->
        <div class="form_box address_box">
          <div class="flex">
            <div class="flex">
              <div class="flag_title ft2">
                <p class="org">주소</p>
                <p class="shadow">주소</p>
              </div>
              <div class="fff">(미입력시 보상 아이템을 전달할 수 없어요)</div>
            </div>
          </div>

          
          <div class="form_cont">
              <textarea  id="p_addr" name="p_addr2" type="text" class="input_grey h100 mt40" placeholder="주소를 입력해 주세요."></textarea>
          </div>

        </div>
        <!--------------------------------------->
        <div class="person_chk">
          <div class="flex flex1">
            <label for="person_chk" class="flag_title ft">
              <p class="org">개인정보 수집 및 이용 동의</p>
              <p class="shadow">개인정보 수집 및 이용 동의</p>
            </label>
            <input type="checkbox" class="check_box" id="person_chk">
          </div>
          <div class="person_detail">자세히 보기</div>
        </div>
        <!--------------------------------------->
        <div class="form_bt">
          <div class="button_su">
            <span class="su_button_circle"></span>
            <div id="endStep" class="button_su_inner">
              <button  type="submit" class="button_text_container nextBtn stepBth" >
                <span>쓰담기록<br>제출하기</span><span class="yellow">▶</span>
              </button>
            </div>
          </div>

        </div>
        <!--------------------------------------->
      </div>
        </form>
    </div>
  </div>

  <!-- 개인정보 동의 팝업 -->
  <div class="popup_bg"></div>
  <div class="popup personal_pop noto">
    <div class="x_btn"><span class="zwicon-close">X</span></div>
    <div class="cont">
      <환경재단>('https://ssudamweek.kr/'이하 '쓰담위크 퀘스트')는 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다. <br><br>

      제1조(개인정보의 처리목적)<br>
      <환경재단>(이)가 개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.<br>
        1. 개인정보 파일명 : 쓰담위크 퀘스트<br>
        개인정보의 처리목적 : 리워드발송<br>
        수집방법 : 홈페이지, 참여이벤트<br>
        보유근거 : 사용자의 개인정보처리방침 동의<br>
        보유기간 : 최대1개월(지체없이 파기)<br><br>

        제2조(정보주체와 법정대리인의 권리·의무 및 그 행사방법)<br>
        ① 정보주체는 환경재단에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.<br>
        ② 제1항에 따른 권리 행사는환경재단에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 환경재단은(는) 이에 대해 지체 없이 조치하겠습니다.<br>
        ③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.<br>
        ④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.<br>
        ⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.<br>
        ⑥ 환경재단은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.<br><br>

        제3조(처리하는 개인정보의 항목 작성)<br>
        ① <환경재단>은(는) 다음의 개인정보 항목을 처리하고 있습니다.<br>
          1. <쓰담서울 퀘스트><br>
            필수항목 : 이름, 연락처, 이메일<br>
            선택항목 : 주소<br><br>

        제4조(개인정보의 파기)<br>
        ① <환경재단> 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.<br>
        ② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.<br>
        1. 법령 근거 : 개인정보보호법 시행령 제 16조<br>
        2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜<br><br>

        ③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.<br>
        1. 파기절차<br>
        <환경재단> 은(는) 파기 사유가 발생한 개인정보를 선정하고, <환경재단> 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.<br>
        2. 파기방법<br>
        전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.<br><br>

        제5조(개인정보의 안전성 확보 조치)<br>
        <환경재단> 은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.
        1. 개인정보 취급 직원의 최소화 및 교육<br>
        개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.<br>
        2. 개인정보에 대한 접근 제한<br>
        개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.<br><br>

        제6조(개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항)<br>
        환경재단는 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용하지 않습니다.<br><br>

        제7조 (개인정보 보호책임자)<br>
        ① 환경재단은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고
        있습니다.<br><br>

        ▶ 개인정보 보호책임자<br>
        성명 :임지은<br>
        직책 :부장<br>
        직급 :부장<br>
        연락처 :02-2011-4394, 02-2011-4394, 02-2011-4394<br>
        ※ 개인정보 보호 담당부서로 연결됩니다.<br><br>

        ▶ 개인정보 보호 담당부서<br>
        부서명 :그린커뮤니케이션<br>
        담당자 :임지은 부장<br>
        연락처 :02-2011-4394, 02-2011-4394 , 02-2011-4394<br>
        ② 정보주체께서는 환경재단 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로
        문의하실 수 있습니다. 환경재단 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.<br><br>

        제8조(개인정보 열람청구)<br>
        정보주체는 ｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.<br>
        <환경재단>은(는) 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.<br><br>

        ▶ 개인정보 열람청구 접수·처리 부서<br>
        부서명 : 그린커뮤니케이션<br>
        담당자 : 임지은 부장<br>
        연락처 : 02-2011-4394, 02-2011-4394 , 02-2011-4394<br><br>

        제9조(권익침해 구제방법)<br>
        정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.<br>
        1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr)<br>
        2. 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)<br>
        3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)<br>
        4. 경찰청 : (국번없이) 182 (cyberbureau.police.go.kr)<br><br>

        「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는
        부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.<br>
        ※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를 참고하시기 바랍니다.<br><br>

        제10조(개인정보 처리방침 변경)<br>
        ① 이 개인정보처리방침은 2021년 4월 1부터 적용됩니다.
    </div>
  </div>

<footer class="noto">

  <div class="top">
    <div class="borderR borderL">
      <p class="txt">재단법인 환경재단</p>
      <p class="line"></p>
      <p class="txt">최열</p>
      <p class="line"></p>
      <p class="txt">101-82-09896</p>
      <p class="line mo_none"></p>
      <p class="txt mo_b">서울시 중구 을지로 16 백남빌딩 7F 환경재단</p>
    </div>
    <div class="borderR">
      <p class="txt">greencsr@greenfund.org</p>
      <p class="line mo_none"></p>
      <p class="txt mo_b">고객센터 <span class="mo_none">전화번호</span> 02-2011-4300</p>
      <p class="line mo_none"></p>
      <p class="txt mo_b"><span class="mo_none">고객센터 </span>팩스번호 02-725-4840</p>
    </div>
  </div>
  <div class="copy">Copyright ⓒ 쓰담위크 All rights reserved.</div>

</footer>
<script src="/js/quest3.js"></script>
</body>
</html>