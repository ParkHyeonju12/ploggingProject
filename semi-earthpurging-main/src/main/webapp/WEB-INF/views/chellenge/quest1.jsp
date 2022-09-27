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
<title>쓰담step1</title>
<link rel="stylesheet" href="/css/quest1.css">
<link rel="stylesheet" href="/css/reset.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<style>
.game_wrap{
    position: relative;
    text-align: center;
    padding: 0 0 15% 0;
    background-image: url(/img/img/game_top.png), url(/img/img/game_bt.gif);
    background-repeat: no-repeat;
    background-position: top, bottom;
    background-size: contain;
}
</style>
<body>
	<!-- 오른쪽 하단에 카톡/top/main가는 버튼 -->
	<div id="quick">
		<a class="kakao_btn" href="http://pf.kakao.com/_HxcUhb"
			target="_blank"><img src="/img/img/kakao.png" alt="카카오톡"></a>;
		<div class="top_btn1">
			<a href="/"><img src="/img/img/plog_logo.png" class="plog_logo"></a>
		</div>
		<div class="top_btn">
			<p>
				↑<br>TOP
			</p>
		</div>
	</div>

	<div id="main" class="grid">
		<section id="main_top">
			<div class="wrapper">
				<div class="logo_wrap">
					<a href="/" class="logoImg"> <img src="/img/img/plog_logo.png"
						alt="플로깅" id="plogImg">
					</a> <a href="#" target="_blank" class="logoImg"> <span> <img
							src="/img/img/logo2.png" alt="지구쓰담" id="logoImg">
					</span>
					</a>
				</div>
				<div class="titles center">
					<div class="titleText">힙한지구인 되기 대-작전!</div>
					<div class="main_title">
						<div class="top_title">
							<!-- 노랑 -->
							<img src="/img/img/top_title1.png" alt="쓰담위크 퀘스트"
								class="top_title1">
							<!-- 핑크 -->
							<img src="/img/img/top_title2.png" alt="쓰담위크 퀘스트"
								class="top_title2">
							<!-- 투명 -->
							<img src="/img/img/top_title3.png" alt="쓰담위크 퀘스트"
								class="top_title3">
						</div>
					</div>
				</div>
				<div class="character_wrap">
					<div class="character">
						<img src="/img/img/character1.png" alt="">
						<p style="color: #fff;">쓰담 도사</p>
					</div>
					<div class="char-box" style="color: #fff;">
						<div class="char_textBox">
							<img src="/img/img/chat_top.png" class="chat_top">
							<div class="char_text">
								<div>
									용사여 반갑네! 방가방가 <br> <br> 그대는 깨끗하고 아름답던 지구별을 기억하는가? <br>(카운팅
									스타~ 밤하늘에 벼어얼) <br> <br> 지금은 쓰레기에 묻혀 그 빛을 잃은 지 오렌지.
								</div>
								<div class="highlight">
									부디 지구를 뒤덮은 쓰레기를 주워담아 산과 강과 바다와 <br> 모든 거리가 본연의 모습으로 돌아올수
									있도록 도와주게.
								</div>
								<div>
									혼자서는 어렵다고? 너무 걱정 말게나. (자넨 친구가 없나?) <br> 그대와 뜻을 함께할 동료들이 옆에
									있다네
								</div>
								<div>
									여정을 마치고 돌아와 이야기를 들려주게. <br> 그럼 <span class="highlight">[힙한
										지구인]의 훈장</span>을 그대에게 내리겠네!(뿜뿜뿜~!)
								</div>
							</div>
							<img src="/img/img/chat_bt.png" class="chat_bottom">
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- 쓰담위크 START -->
		<section id="sec1">
			<div class="wrapper">
				<div class="sec_title">
					<img src="/img/img/title1.png" alt="쓰담위크퀘스트">
				</div>
				<div class="game_wrap">
					<div class="game_top">
						<img src="/img/img/game1.png" class="game1"> 
						<img src="/img/img/heart.png" class="game2">
					</div>
					<div class="game_text">
						어느 도시에서 <br> 퀘스트를 수행하시겠습니까? <br> 원하는 장소를 클릭하세요!
					</div>
					<ul class="city_wrap">
						<li><a href="/quest2Frm.do?city=쓰담강릉">
								<div class="poly">
									<img src="/img/img/game3.png" alt="삼각형">
								</div>
								<div class="city">
									<p class="org">쓰담강릉</p>
									<p class="white">쓰담강릉</p>
								</div>
								<div class="with">
									<img src="/img/img/game2.png" alt="용사"> <span>x22</span>
								</div>
						</a></li>
						<li><a href="/quest2Frm.do?city=쓰담전주">
								<div class="poly">
									<img src="/img/img/game3.png" alt="삼각형">
								</div>
								<div class="city">
									<p class="org">쓰담전주</p>
									<p class="white">쓰담전주</p>
								</div>
								<div class="with">
									<img src="/img/img/game2.png" alt="용사"> <span>x2</span>
								</div>
						</a></li>
						<li><a href="/quest2Frm.do?city=쓰담부산">
								<div class="poly">
									<img src="/img/img/game3.png" alt="삼각형">
								</div>
								<div class="city">
									<p class="org">쓰담부산</p>
									<p class="white">쓰담부산</p>
								</div>
								<div class="with">
									<img src="/img/img/game2.png" alt="용사"> <span>x202</span>
								</div>
						</a></li>
						<li><a href="/quest2Frm.do?city=쓰담제주">
								<div class="poly">
									<img src="/img/img/game3.png" alt="삼각형">
								</div>
								<div class="city">
									<p class="org">쓰담제주</p>
									<p class="white">쓰담제주</p>
								</div>
								<div class="with">
									<img src="/img/img/game2.png" alt="용사"> <span>x220</span>
								</div>
						</a></li>
					</ul>
				</div>
				<div class="stop_wrap">
					<img src="/img/img/stop.png" class="stop">
					<div class="character_wrap">
						<div class="character">
							<img src="/img/img/character2.png">
							<p class="she">쓰담이</p>
						</div>
						<div class="char_text1">
							<div class="chat_stroke"></div>
							<div class="chat">
								<img src="/img/img/chat_w_top.png" class="textImg1">
								<div class="chat_textBox cb">
									안녕하세요! <br> 저는 여러분의 쓰담위크 퀘스트를 도와드릴 "쓰담이"예요. <br> 합한
									지구인이 되고 싶다면 제 설명을 천천히 따라와주세요!
								</div>
								<img src="/img/img/chat_w_bt.png" class="textImg2">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- 지구쓰담 캠페인 -->
        <section id="sec2">
            <div class="wrapper wrap_sec2">
                <div class="sec_title">
                    <img src="/img/img/title2.png" alt="지구쓰담캠페인">
                </div>
                <div class="character_wrap">
                    <div class="character">
                        <img src="/img/img/character2.png">
                        <p class="she">쓰담이</p>
                    </div>
                    <div class="char_text2">
                        <div class="chat_stroke"></div>
                        <div class="chat">
                            <img src="/img/img/chat_w_top.png" class="textImg1">
                            <div class="chat_textBox cb2">
                                <div class="chat_div">
                                    <span class="highlight">"지구의 쓰레기를 담다!"</span>라는 뜻이 담겨있는
                                    지구쓰담 캠페인은 
                                    <br>
                                    심각한 플라스틱 쓰레기 문제를 알리고, 넘쳐나는 해양 쓰레기로 몸살을 
                                    <br>
                                    앓는 바다를 깨끗하게 하기 위한 환경재단의 국내 환경 회복 캠페인이에요.
                                </div>
                                <div class="chat_div">
                                    쉽게 사용되고 버려지는 쓰레기 육지에서 강으로, 그리고 바다로 흘러 들어간답니다.
                                    <br>
                                    미세 플라스틱으로 분해된 쓰레기는 물고기에게, 그리고 우리의 입속으로 다시 돌아오겠죠.
                                </div>
                                <div>
                                    지구에 남겨진 쓰레기, 이대로 정말 괜찮을까요...? 
                                </div>
                            </div>
                            <img src="/img/img/chat_w_bt.png" class="textImg2">
                        </div>
                    </div>
                </div>
            </div>
            <div class="sec2_bg">
                <a href="#" target="_blank" class="push_btn">
                    <img src="/img/img/push.png" alt="push 버튼" class="push_ani">
                    <img src="/img/img/push_btn1.png" alt="push 버튼" class="push_button">
                </a>
                <div class="trash">
                    <img src="/img/img/trash.png" alt="쓰레기" class="trash_img">
                </div>
                <div class="person">
                    <img src="/img/img/character3.png" alt="사람" class="ps person1">
                    <img src="/img/img/character4.png" alt="사람" class="ps person2">
                    <img src="/img/img/balloon1.png" class="mk mark1">
                    <img src="/img/img/balloon1.png" class="mk mark2">
                </div>
                <div class="sec2_bgImg">
                    <div class="sec2_top">
                        <img src="/img/img/bg_sea_top.png" class="sea_top" >
                    </div>
                    <div class="sec2_bt">
                        <img src="/img/img/bg_sea_bt.png" class="sea_bt">
                    </div>
                </div>
            </div>
        </section>
        <!-- 쓰담위크 -->
        <section id="sec3">
            <div class="wrapper wrap_sec3">
                <div class="sec_title">
                    <img src="/img/img/title3.png" alt="쓰담위크">
                </div>
                <div class="character_wrap">
                    <div class="character">
                        <img src="/img/img/character2.png">
                        <p class="she">쓰담이</p>
                    </div>
                    <div class="char_text2">
                        <div class="chat_stroke"></div>
                        <div class="chat">
                            <img src="/img/img/chat_w_top.png" class="textImg1">
                            <div class="chat_textBox">
                                <div class="chat_div">헥헥... 담배꽁초와 플라스틱이 너무 많네요.</div>
                                <div class="chat_div">
                                    여러분, 플로깅(Plogging)에 대해 아시나요?
                                    <br>
                                    스웨덴어의 줍다 'Plocka upp' + 영어의 달리기 'jogging'이 합쳐진 말인데요,
                                    <br>
                                    <span class="highlight">달리기를 하면서 동시에 쓰레기를 줍는 환경정화  활동</span>이랍니다.
                                </div>
                                <div>
                                    <span class="highlight">'쓰담달리기'</span>라는 우리말로 바꿔서 사용하면 더 좋아요.
                                    <br>지구와 우리의 몸이 모두 건강해지는 쓰담달리기,
                                    <br>바로 여러분이 수행할 퀘스트예요!
                                </div>
                            </div>
                            <img src="/img/img/chat_w_bt.png" class="textImg2">
                        </div>
                    </div>
                </div>
            </div>
            <div class="sec3_bg">
                <div class="person1">
                    <img src="/img/img/character5.png" alt="사람" class="ps1 person3">
                    <img src="/img/img/character6.png" alt="사람" class="ps1 person4">
                    <img src="/img/img/balloon2.png" class="mk mark3">
                    <img src="/img/img/balloon2.png" class="mk mark4">
                </div>
                <div class="sec3_bgImg">
                    <div class="sec3_top">
                        <img src="/img/img/bg_sky2.png" class="sky_top" >
                    </div>
                    <div class="sec3_bt">
                        <img src="/img/img/bg_ground.png" class="ground_bt">
                    </div>
                </div>
            </div>  

        </section>
        <!-- 쓰담 어플 사용법 -->
        <section id="sec4">
            <ul class="wrapper step">
                <li class="step1">
                    <div  class="flex1">
                        <div class="step_left">
                            <div class="step_num">
                                <div class="yellow" style="color: yellow;" >step1</div>
                                <div class="title" style="color: white;"> 준비</div>
                            </div>
                            <div class="step_img">
                                <img src="/img/img/step1.png">
                            </div>  
                        </div>
                        <div class="step_right" style="color: white;">
                            <p class="step_txt1 chat_div">
                                1) 집 어딘가 오천오백개쯤 있는 에코백이나 봉투.
                                <br>
                                집게 혹은 다회용 장갑을 준비해주세요.
                                <br>    
                                쓰담달리기를 하면서 새로운 쓰레기는 만들지 않기로 약속!
                            </p>
                            <p class="step_text2">
                                2) 인증을 위한 어플리케이션 다운받기 <br>
                                (<span class="highlight"> ①날짜 ②GPS 지도 ③이동거리</span>가 표기되는 어플)
                                <br>
                                ex) 나이키런 클럽, 런데이, 스트라바, 페이서 등
                            </p>
                        </div>
                    </div>
                    <img src="/img/img/arrow.png" class="arrow">
                </li>
                <li class="step1">
                    <div  class="flex1">
                        <div class="step_left">
                            <div class="step_num">
                                <div class="yellow" style="color: yellow;">step2</div>
                                <div class="title" style="color: white;">쓰담 <br>달리기</div>
                            </div>
                            <div class="step_img">
                                <img src="/img/img/step2.png">
                            </div>  
                        </div>
                        <div class="step_right" style="color: white;">
                            <p class="step_txt1 chat_div">
                                1) 인증용 어플리케이션 실행하기
                            </p>
                            <p class="step_text2 chat_div">
                                2) 쓰담 달리기 시작 <br>
                                <span class="highlight">*꿀팁: 모바일 기기를 이용하면 터치 방식을 사용해 <br> 쓰담기록을 실시간 입력할 수 있어요!</span>
                            </p>
                            <p class="step_text3">
                                3) 인증샷 촬영하기
                                <br>
                                (주운 쓰레기와 본인의 모습이 보이도록 촬영!)
                            </p>
                        </div>
                    </div>
                    <img src="/img/img/arrow.png" class="arrow"></li>
                <li class="step1 step33">
                    <div  class="flex1">
                        <div class="step_left">
                            <div class="step_num">
                                <div class="yellow" style="color: yellow;" >step3</div>
                                <div class="title" style="color: white;">쓰담<br>기록제출</div>
                            </div>
                            <div class="step_img">
                                <img src="/img/img/step3.png">
                            </div>  
                        </div>
                        <div class="step_right" style="color: white;">
                            <p class="step_txt1 chat_div">
                                [쓰담기록지 구성]
                            </p>
                            <p class="step_text2 chat_div">
                                ① 쓰담기록 (날짜, 위치, 쓰레기 종류별 개수, 소요시간, 인증샷 업로드)
                                <br>
                                <span class="highlight">총 2장의 이미지를 업로드 해주세요(어플 기록거리 캡쳐 + 인증샷)</span>
                            </p>
                            <div class="subImg chat_div"> 
                                <img src="/img/img/sub_photo2.png" alt="지도" class="subImg1">
                                <div class="plus">+</div>
                                <img src="/img/img/sub_photo1.png" alt="인증샷" class="subImg2">
                            </div>
                            <p>
                                ②힙한지구인의 정보(이름, 연락처, 이메일, 주소)
                            </p>
                        </div>
                    </div>
                </li>
            </ul>
        </section>
        <!-- 힙한 지구인의 훈장 -->
        <section id="sec5">
            <div class="wrapper wrap_sec2">
                <div class="sec_title">
                    <img src="/img/img/title4.png" alt="힙한지구인의훈장">
                </div>
                <div class="character_wrap">
                    <div class="character">
                        <img src="/img/img/character1.png">
                        <p class="she">쓰담이</p>
                    </div>
                    <div class="char_text2">
                        <div class="chat_stroke"></div>
                        <div class="chat">
                            <img src="/img/img/chat_w_top.png" class="textImg1">
                            <div class="chat_textBox">
                                <div class="chat_div">
                                    힙한 지구인의 훈장은 지구별을 깨끗하게 만든 훌룡한 용사들에게 하사하는 <br> 한정판 선물이라네.
                                </div>
                                <div class="chat_div">
                                    깨끗하고 아름다운 도시의 모습과 힙한 지구인의 모습이 한땀 한땀 수 놓아진 <br>자수패치일세.
                                </div>
                                <div>
                                    각 도시별로 선착순 100명의 용사들에게만 특별히 주어지는 것이니  <br>자네도 어서 서두르게나!
                                </div>
                            </div>
                            <img src="/img/img/chat_w_bt.png" class="textImg2">
                        </div>
                    </div>
                </div>
                <div class="patch">
                    <img src="/img/img/patch1.png" >
                    <img src="/img/img/patch2.png" >
                    <img src="/img/img/patch3.png" >
                    <img src="/img/img/patch4.png" >
                </div>
                <p>쓰담한 도시 자수패치 1개</p>
                <div class="plus1">+</div>
                <div class="patch">
                    <img src="/img/img/patch5.png">
                    <img src="/img/img/patch6.png">
                </div>
                <div class="highlight hig">!!도시별 선착순 100인 한정!!</div>
                <div class="jeju">
                    <div style="color: white;" class="jeju_txt">
                        쓰담제주는 <span class="highlight">문화도시 제주</span>와 함께합니다.
                        <br>
                        <span class="under">제주한정</span>추가 리워드 이벤트가 
                        <br>
                        궁금하다면? 눌러보세요!
                    </div>
                    <a href="/" class="jeju1">
                        <div class="jejuImg bellWrapper">
                            <img src="/img/img/jeju.png" alt="돌하르방" class="my-bell">
                        </div>
                        <div class="jeju_click">click!</div>
                    </a>
                </div>
                <a href= "/quest2Frm.do?city=쓰담강릉" class="run33">
                    <div class="run_start">
                        <img src="/img/img/push2.png" class="run_img">
                        <img src="/img/img/push_btn2.png">
                    </div>
                    <p class="run_start_txt">쓰담달리기 출발!</p>
                </a>
            </div>
        </section>
    </div>
    <footer class="noto">
        <div class="top"></div>
        <div class="copy"></div>
    </footer>
		
		<script src="/js/quest1.js"></script>
</body>
</html>