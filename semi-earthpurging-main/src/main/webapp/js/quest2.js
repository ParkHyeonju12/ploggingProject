/* top버튼 */
$(document).ready(function(){

  $(".top_btn").click(function(){
    $("html, body").stop().animate({"scrollTop": 0}, 500);
  });
  
});

/*줍줍 일자 -> 캘린더 */
$(function(){
    //input을 datepicker로 선언
    $("#start-date").datepicker({
      dateFormat: 'yymmdd' //달력 날짜 형태
      ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
      ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
      ,changeYear: true //option값 년 선택 가능
      ,changeMonth: true //option값  월 선택 가능                
      ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
      ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
      ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
      ,buttonText: "선택" //버튼 호버 텍스트                
      ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
      ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
      ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
      ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
      ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
      ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
      ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
  });                    
  
  // //초기값을 오늘 날짜로 설정해줘야 합니다.
  // $('#start-date').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
});

/*쓰레기 증감 버튼*/
const input = $(".count_input>input");
const minus = $(".minus");
const plus = $(".plus");

plus.on("click",function(){
  let index = plus.index(this);
  let count = parseInt(input.eq(index).val()) + 1;
  count = count < 0 ? 0 : count;
  input.eq(index).val(count);
});

minus.on("click",function(){
  let index = minus.index(this);
  let count = parseInt(input.eq(index).val()) - 1;
  count = count < 0 ? 0 : count;
  input.eq(index).val(count);
  console.log(index);
});

/*이미지 파일 경로*/
var fileTarget1 = $('.filebox1 .upload-hidden');
  fileTarget1.on('change', function () {
    if (window.FileReader) {
      var filename1 = $(this)[0].files[0].name;
    } else {
      var filename1 = $(this).val().split('/').pop().split('\\').pop();
    }
    $('.upload-name.upload-name1').val(filename1);
  });

  var fileTarget2 = $('.filebox2 .upload-hidden');
  fileTarget2.on('change', function () {
    if (window.FileReader) {
      var filename2 = $(this)[0].files[0].name;
    } else {
      var filename2 = $(this).val().split('/').pop().split('\\').pop();
    }
    $('.upload-name.upload-name2').val(filename2);
  });

  /*step1되돌아가기*/
  $('.prevBtn').on("click",function(){
    bool = confirm("step1로 돌아가시겠습니까?");
    if(bool){
      location.href="/quest1Frm.do";
    }else{
      return false;
    };
  });
  /*step1 조건 확인 후 step2로 넘어가기 */
  $('.nextBtn').on("click",function(){
	bool = confirm("step2로 넘어가시겠습니까?");
    if($("#start-date").val()===''){
      alert('줍줍한 날짜를 선택해주세요');
      bool = false;
      return bool;
    }
    if($("#p_addr").val()===''){
      alert('줍줍한 위치를 표시해주세요');
       bool = false;
      return bool;
    }
    if($("#p_addr").val()===''){
      alert('줍줍한 위치를 표시해주세요');
       bool = false;
      return bool;
    }
    if($("#ex_filename1").val()===''){
      alert('이동기록 이미지를 첨부해주세요');
       bool = false;
      return bool;
    }
    if($("#ex_filename2").val()===''){
      alert('인증샷 이미지를 첨부해주세요');
       bool = false;
      return bool;
    }
    if($("#p_memo").val()===''){
      alert('인증샷 이미지를 첨부해주세요');
      bool = false;
      return bool;
    }

    
    if(bool){
		 location.href="/quest3Frm.do";
    }else{
      return false;
    };
  });
  
  