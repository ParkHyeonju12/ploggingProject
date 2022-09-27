<%@page import="com.earthpurging.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%
	String city = (String)request.getAttribute("cityName");
	Member member = (Member)session.getAttribute("m");
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쓰담step1</title>
<link rel="stylesheet" href="/css/quest2.css">
<link rel="stylesheet" href="/css/reset.css">
 <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <style>
  .sub_btn {
  background: url(/img/img/address.png) no-repeat center center;
  background-size: cover;
  color: #fff;
  font-size: 20px;
  margin-top: 10px;
  width: 126px;
  height: 37px;
  cursor: pointer;
  background-size: contain;
  text-align: center;
  }
  .flag_title::before {
  content: "";
  display: block;
  width: 18px;
  height: 29px;
  background: url(/img/flag.png) no-repeat center center;
  background-size: 18px 29px;
  left: -35px;
  position: absolute;
}
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
    <a class="kakao_btn" href="http://pf.kakao.com/_HxcUhb" target="_blank"><img src="/img/img/kakao.png" alt="카카오톡"></a>
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
                <h5>STEP 01</h5>
                <img src="/img/img/bumb_right.gif" alt="폭탄" class="bumb2">
              </div>
              <div class="bt">
                <img src="/img/img/sub_title.png" alt="쓰담기록">
              </div>
            </div>
          </div>
        </div>
        <!-- form  -->
      <form id="inqForm" name="inqForm" method="post" action="/quest3.do" enctype="multipart/form-data">
          <input type="hidden" name="step" value="1">
           <input type="hidden" name="memberNO" value="<%=member.getMemberNo()%>">
        <div class="form_wrap">   
          <div class="form_title ffff">
            이렇게 <span class="yellow">줍<img src="/img/img/star.png" alt="별">줍</span>했다!
          </div>
  
          <div class="form_box">
            <div class="flag_title">
              <p class="org">줍줍 일자</p>
              <p class="shadow">줍줍 일자</p>
            </div>

            <div class="input-daterange input-group" id="flight-datepicker">
              <div class="form-item">
                <input class="input-sm form-control input_grey" type="text" id="start-date" name="p_start" placeholder="쓰담한 날짜를 선택해 주세요."autocomplete="OFF">
              </div>
            </div>
          </div>
          <!--------------------------------------->
          <div class="form_box">
            <div class="flag_title">
              <p class="org">줍줍한 위치</p>
              <p class="shadow">줍줍한 위치</p>
            </div>
  
            <div class="form_cont">
            <%if (city.equals("쓰담강릉")){ %>
             <select name="p_city" id="p_city" class="input_grey">
                <option value="쓰담강릉" selected>쓰담강릉</option>
                <option value="쓰담전주" >쓰담전주</option>
                <option value="쓰담부산" >쓰담부산</option>
                <option value="쓰담제주" >쓰담제주</option>
              </select>
            <%} else if(city.equals("쓰담전주")) { %>
               <select name="p_city" id="p_city" class="input_grey">
                <option value="쓰담강릉" >쓰담강릉</option>
                <option value="쓰담전주" selected>쓰담전주</option>
                <option value="쓰담부산" >쓰담부산</option>
                <option value="쓰담제주" >쓰담제주</option>
              </select>
            <%} else if(city.equals("쓰담부산")) {%>
             <select name="p_city" id="p_city" class="input_grey">
                <option value="쓰담강릉" >쓰담강릉</option>
                <option value="쓰담전주" >쓰담전주</option>
                <option value="쓰담부산" selected>쓰담부산</option>
                <option value="쓰담제주" >쓰담제주</option>
              </select>
            <%} else if(city.equals("쓰담제주")) {%>
             <select name="p_city" id="p_city" class="input_grey">
                <option value="쓰담강릉" >쓰담강릉</option>
                <option value="쓰담전주" >쓰담전주</option>
                <option value="쓰담부산" >쓰담부산</option>
                <option value="쓰담제주" selected >쓰담제주</option>
              </select>
            <%} else{%>
             <select name="p_city" id="p_city" class="input_grey">
                <option value="쓰담강릉" >쓰담강릉</option>
                <option value="쓰담전주" >쓰담전주</option>
                <option value="쓰담부산" >쓰담부산</option>
                <option value="쓰담제주"  >쓰담제주</option>
              </select>
            <%} %>
            
             
            
            
            
            </div>
  
            <div class="flex address_flex">
              <div>쓰레기 데이터 수집을 위해 대략적 위치를 표기해주세요. <br>애매한 경우, 가장 가까운 랜드마크나 건물을 입력해주세요.</div>
            </div>
            <textarea id="p_addr" name="p_addr" class="input_grey h100"></textarea>
          </div>
          <!--------------------------------------->
          <div class="form_box">
            <div class="flag_title">
              <p class="org">득템 리스트</p>
              <p class="shadow">득템 리스트</p>
            </div>
  
            <div class="form_cont flex">
              <div class="get_item">
                <img src="/img/img/icon2.png" alt="득템리스트">
                <div class="fff">캔류(3점)</div>
                <div class="count_input">
                  <span class="minus">-</span>
                  <input type="text" value="0" id='p_item_1 ip' name='p_item_1' class="input_grey" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                  <span class="plus">+</span>
                </div>
              </div>
  
              <div class="get_item">
                <img src="/img/img/icon7.png" alt="득템리스트">
                <div class="fff">유리류(3점)</div>
                <div class="count_input">
                  <span class="minus">-</span>
                  <input type="text" value="0" id='p_item_2 ip' name='p_item_2' class="input_grey" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                  <span class="plus">+</span>
                </div>
              </div>
  
              <div class="get_item">
                <img src="/img/img/icon1.png" alt="득템리스트">
                <div class="fff">종이류(2점)</div>
                <div class="count_input">
                  <span class="minus">-</span>
                  <input type="text" value="0" id='p_item_3 ip' name='p_item_3'  class="input_grey" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                  <span class="plus">+</span>
                </div>
              </div>
  
              <div class="get_item">
                <img src="/img/img/icon4.png" alt="득템리스트">
                <div class="fff">플라스틱류(2점)</div>
                <div class="count_input">
                  <span class="minus">-</span>
                  <input type="text" value="0" id='p_item_4 ip' name='p_item_4' class="input_grey" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                  <span class="plus">+</span>
                </div>
              </div>
  
              <div class="get_item">
                <img src="/img/img/icon9.png" alt="득템리스트">
                <div class="fff">담배꽁초류(1점)</div>
                <div class="count_input">
                  <span class="minus">-</span>
                  <input type="text" value="0" id='p_item_5 ip' name='p_item_5' class="input_grey" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                  <span class="plus">+</span>
                </div>
              </div>
  
              <div class="get_item">
                <img src="/img/img/icon5.png" alt="득템리스트">
                <div class="fff">비닐류(1점)</div>
                <div class="count_input">
                  <span class="minus">-</span>
                  <input type="text"  id='p_item_6 ip' name='p_item_6' value="0" class="input_grey" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                  <span class="plus">+</span>
                </div>
              </div>
  
            </div>
          </div>
          <!--------------------------------------->
          <div class="form_box">
            <div class="flag_title">
              <p class="org">소요시간</p>
              <p class="shadow">소요시간</p>
            </div>
  
            <div class="form_cont">
              <select name="p_time" id="p_time" class="input_grey">
                <option value="~ 10분 이하">~ 10분 이하</option>
                <option value="10분 ~ 30분">10분 ~ 30분</option>
                <option value="30분 ~ 1시간">30분 ~ 1시간</option>
                <option value="1시간 ~ 2시간">1시간 ~ 2시간</option>
                <option value="2시간 초과">2시간 초과</option>
              </select>
            </div>
          </div>
          <!--------------------------------------->
          <div class="form_box align_base">
            <div class="photo_file">
              <div class="flag_title">
                <div>
                  <p class="org">이미지 업로드</p>
                  <p class="shadow">이미지 업로드</p>
                </div>
              </div>
  
              <div class="form_cont m_bt flex1">
  
                <div class="lt">
                  <div class="filebox filebox1">
                    <div>
                      <label for="ex_filename1" class="sub_btn">이동기록</label>
                      <input type="file" id="ex_filename1" name="p_file1" class="upload-hidden">
                        <input type="hidden" name="step" value="1">
                    </div>
                  </div>
                  <textarea readonly class="upload-name upload-name1 input_grey h165" placeholder="날짜, GPS지도, 이동거리가 담긴 캡쳐 이미지&#13;&#10;(1MByte 미만 권장)"></textarea>
                </div>
                
                <div class="rt">
                  <div class="photo_img">
                    <img src="/img/img/sub_photo2.png" alt="예시이미지">
                  </div>
                </div>
  
              </div>
  
              <div class="form_cont flex1">
  
                <div class="lt">
                  <div class="filebox filebox2">
                    <div>
                      <label for="ex_filename2" class="sub_btn">인증샷</label>
                      <input type="file" id="ex_filename2" name="p_file2" class="upload-hidden">
                    </div>
                  </div>
                  <textarea readonly class="upload-name upload-name2 input_grey h165"></textarea>
                </div>
  
                <div class="rt">
                  <div class="photo_img">
                    <img src="/img/img/sub_photo1.png" alt="예시이미지">
                  </div>
                </div>
  
              </div>
            </div>
          </div>
          <!--------------------------------------->
          <div class="form_box">
            <div class="flag_title">
              <p class="org">동료들에게 남길 퀘스트 수행 소감 한마디!</p>
              <p class="shadow">동료들에게 남길 퀘스트 수행 소감 한마디!</p>
            </div>
  
            <div class="form_cont">
              <textarea id='p_memo' name='p_memo' class="input_grey h100 review"></textarea>
            </div>
          </div>
          <!--------------------------------------->
          <div class="form_bt ">
            <div class="button_su">
              <span class="su_button_circle"></span>
              <div id="nextStep" class="button_su_inner">
                <button type="submit" class="button_text_container nextBtn stepBth">
                  <span>STEP 02로 <br>넘어가기</span><span class="yellow">▶</span>
                </button>
              </div>
            </div>
          </div>
          <!--------------------------------------->
        </div>
       
      </form>
      </div>
    </div>


<footer class="noto">
    <div class="top1 fx">
      <div class="borderR borderL">
        <p class="txt">지구 푸르깅</p>
        <p class="line"></p>
        <p class="txt">kh</p>
        <p class="line"></p>
        <p class="txt">202-82-02232</p>
        <p class="line mo_none"></p>
        <p class="txt mo_b">서울시 kh 정보교육원 19F</p>
      </div>
      <div class="borderR">
        <p class="txt">kh@iei.or.kr</p>
        <p class="line mo_none"></p>
        <p class="txt mo_b">고객센터 <span class="mo_none">전화번호</span> 02-2010-2300</p>
        <p class="line mo_none"></p>
        <p class="txt mo_b"><span class="mo_none">고객센터 </span>팩스번호 02-225-4820</p>
      </div>
    </div>
    <div class="copy">Copyright ⓒ 지구푸르깅 All rights reserved.</div>
</footer>

<script src="/js/quest2.js"></script>
</body>
</html>