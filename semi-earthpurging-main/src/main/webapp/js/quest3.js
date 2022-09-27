/* top버튼 */
$(document).ready(function(){

  $(".top_btn").click(function(){
  $("html, body").stop().animate({"scrollTop": 0}, 500);
  });
  
});

/*step2로 되돌아가기*/
$('.prevBtn').on("click",function(){
  bool = confirm("step2로 돌아가시겠습니까?");
  if(bool){
    location.href="/quest2Frm.do";
  }else{
    return false;
  };
});

/*step2 조건 확인 후 넘어가기 */
  $('.nextBtn').on("click",function(){
	 bool = confirm("쓰담기록을 제출하시겠습니까?");
    if($("#p_name").val()===''){
      alert('이름을 입력해주세요');
      bool = false;
      return bool;
    }
    if($("#p_tel").val()===''){
      alert('연락처를 입력해주세요');
      bool = false;
      return bool;
    }
    if($("#p_email").val()===''){6 
      alert('이메일을 입력해주세요');
      bool = false;
      return bool;
    }
    if($("#p_addr").val()===''){
      alert('주소를 입력해주세요');
      bool = false;
      return bool;
    }
    
    if(!$('#person_chk').is(':checked')){
	alert("개인정보 수집을 동의해주세요");
	  bool = false;
      return bool;
	}
	
    if(bool){
      location.href="/chellengeFrm.do";
    }else{
      return false;
    };
  });

  /*개인정보동의 자세히보기 팝업*/ 
  $(".person_detail").click(function(){
    $(".popup_bg").stop().fadeIn();
    $(".popup.personal_pop").stop().fadeIn();
  });

  $(".popup_bg").on("click", onPopClose);
  $(".x_btn").on("click", onPopClose);

  function onPopClose() {
    $(".popup_bg").stop().fadeOut();
    $(".popup.personal_pop").stop().fadeOut();
  }
