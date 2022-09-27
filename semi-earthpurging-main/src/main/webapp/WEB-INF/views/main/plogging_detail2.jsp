<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <link href="http://fonts.cdnfonts.com/css/dunggeunmo" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/index_content.css">
    <link rel="stylesheet" href="/css/index_button.css">

	<link rel="stylesheet" href="/css/plogging_detail1.css">
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	
<title>지구푸르깅</title>
</head>
<body>
	<div class="wrapper">
		<%@include file="/WEB-INF/views/common/header.jsp" %>
		
		
     <!-- content -->
    <form action="/ploggingDetail2.do" method="get" onsubmit="return onchecked()">
        <div class="page-content">
            <div class="page-content-img"><img src="/img/index/ploggings_img2.png" alt=""></div>
            <div class="page-content-map">
                <div class="map-title">위치 정보</div>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.903093515661!2d126.8945896152442!3d37.5337815798041!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9edb0d6df1b1%3A0x8ae903d3dc14b683!2zS0jsoJXrs7TqtZDsnKHsm5Ag64u57IKw7KeA7JuQ!5e0!3m2!1sko!2skr!4v1663743515956!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <div class="page-content-apply">
                <div class="apply-title">참여 신청 하기</div>
                <div class="apply-content">
                    <ul>
                        <li class="apply-join">1.이름</li>
                        <li class="apply-join-input">
                            <input type="text" id="crew_name" name="crew_name" placeholder="이름을 입력해주세요" class="apply-join-input" required>
                        </li>
                        <li class="apply-join">2.생년월일<br><span class="apply-join-sub">생년월일 숫자 6자리만 기재</span></li>
                        <li class="apply-join-input">
                            <input type="text" id="crew_birth" name="crew_birth" placeholder="ex)960607" class="apply-join-input" required>
                        </li>
                        <li class="apply-join">3. 희망하는 활동 장소<br><span class="apply-join-sub">팀원들과 사전 상의 후 동일하게 기재<span class="apply-join-sub red">(복수체크 불가능)</span></span></li>
                        <li class="apply-join-input">
                            <input type='radio' name='crew_place' id="1_area" value="잠실한강공원" checked>
                            <label for="1_area">잠실 한강공원</label>
                            <input type='radio' name='crew_place' id="2_area" value="뚝섬한강공원">
                            <label for="2_area">뚝섬 한강공원</label>
                            <input type='radio' name='crew_place' id="3_area" value="반포한강공원">
                            <label for="3_area">반포 한강공원</label>
                            <input type='radio' name='crew_place' id="4_area" value="여의도한강공원">
                            <label for="4_area">여의도 한강공원</label>
                            <input type='radio' name='crew_place' id="5_area" value="난지한강공원">
                            <label for="5_area">난지 한강공원</label>
                        </li>
                        <li class="apply-join">4. 연락처<br><span class="apply-join-sub">번호만 입력</span></li>
                        <li class="apply-join-input">
                            <input type="text" id="crew_phone" name="crew_phone" placeholder="ex)01000000000" class="apply-join-input" required>
                        </li>
                        <li class="apply-join">5.이메일</li>
                        <li class="apply-join-input">
                            <input type="text" id="crew_email" name="crew_email" class="apply-join-input" required>
                            @
                            <input class="box" id="domain-txt" type="text"/>
                            <select class="box" id="domain-list">
                                <option value="type">직접 입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="google.com">google.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="nate.com">nate.com</option>
                                <option value="kakao.com">kakao.com</option>
                            </select>
                        </li>
                        <li class="apply-join-input">
                            <input type="checkbox" name="plogging-check" id="plogging-check" class="apply-join-input-check">
                            <label for="plogging-check">개인정보 수집/ 이용 동의</label>
                            <br><br>
                            환경재단은 귀하의 개인정보를 매우 중요하게 여기며 『 개인정보보호법 』 에 따라 개인정보를 소중하게 관리하고 있습니다 .<br> 수집한 개인정보를 다음의 목적으로 수집 · 이용합니다 .1) 개인정보 수집 목적 : 쓰담한강 크루 선발과정 진행 및 환경재단 소식지 발송 <br>2) 개인정보 수집 항목 : 성명, 연락처 , 이메일, 생년월일, 소속  3) 이용기간 : 이용 목적이 다했거나 귀하가 이용 중단 의사를 밝힐 경우 파기함</label>
                        </li>                        
                        <li class="apply-join-input">
                        	<input type="hidden" id="member_no" name="member_no" value="<%if(m!=null){%><%=m.getMemberNo()%><%}%>">
                        	<input type="hidden" id="crew_kind" name="crew_kind" value="쓰담한강크루모집">
                            <button type="submit" class="button-submit">제출</button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </form>
        
        
		<%@include file="/WEB-INF/views/common/footer.jsp" %>
	</div>

<!-- script Line -->
    <script>
    //약관동의 로직
    function onchecked(){
        var ploggingCheck = $("input:checkbox[name='plogging-check']").is(":checked");

        if(!ploggingCheck){
            alert("약관에 동의해주세요.");
            return false;
        }
    }

    //이메일 로직
    // 도메인 직접 입력 or domain option 선택
    const domainListEl = document.querySelector('#domain-list')
    const domainInputEl = document.querySelector('#domain-txt')
    // select 옵션 변경 시
    domainListEl.addEventListener('change', (event) => {
    // option에 있는 도메인 선택 시
    if(event.target.value !== "type") {
        // 선택한 도메인을 input에 입력하고 disabled
        domainInputEl.value = event.target.value
        domainInputEl.disabled = true
        $("input.box").css('backgroundColor','#ced4da').css('border','1px solid black');
    } else { // 직접 입력 시
        // input 내용 초기화 & 입력 가능하도록 변경
        domainInputEl.value = ""
        domainInputEl.disabled = false
        $("input.box").css('backgroundColor','white').css('border','1px solid black');
    }
    })
    </script>
</body>
</html>