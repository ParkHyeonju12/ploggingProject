<%@page import="java.io.Console"%>
<%@page import="com.earthpurging.index.model.vo.ChellengeRank"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    //[1번로직] 챌린지 1~5등 선정 값 데이터
    ArrayList<ChellengeRank> list = (ArrayList<ChellengeRank>)request.getAttribute("list");

    ChellengeMemberData all = (ChellengeMemberData)request.getAttribute("all");
%>
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
    <!-- 제이쿼리 사용 -->
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

    <!-- swiper 사용 CDN-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

    <!--차트js 사용 CDN-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <title>지구푸르깅</title>
</head>
<body>
<div class="wrapper">
    <%@include file="/WEB-INF/views/common/header.jsp" %>


    <!-- content -->
    <div class="page-content">
        <!-- Banner section-->
        <section id="banner">
            <div class="banner-container">
                <div class="banner-wrap"></div>
                <div class="banner-img"></div>
                <div class="banner-content">
                    <img src="/img/index/index_main_bottom_title.png" alt=""><br>
                    <span>우리의 보금자리 지구 푸르깅푸르깅!</span><br>
                    <span>더 많은 지역, 더 많은 쓰레기를 쓰담 할 수 있도록 함께 해주세요.</span><br>
                    <div><a href="/common/donation.jsp">지구푸르깅 후원하기</a></div>
                    <a href="#main" class="button style2 down anchored"></a>
                </div>
            </div>
        </section>
        <!-- End Banner section-->

        <!-- Main section-->
        <section id="main">
            <div class="main-container">
                <div class="main-wrap">
                    <div class="main-wrap-top">
                            <span>플라스틱 소비가 지금과 같다면<br>
                                2050년에는 바다에 물고기보다 플라스틱 쓰레기가 더 많아질 것이다.</span><br>
                        <span>-2016 세계경제포럼-</span><br>
                    </div>
                    <div class="main-wrap-bottom">
                            <span>이대로 <br>
                            꾸준히 버리시겠습니까?</span><br>
                        <span>-Yunsu Lee -</span><br>
                    </div>
                </div>
                <img src="/img/index/index_main_img.jpg" alt="">
                <div class="main-title">
                    <div class="main-title-top">
                        바다에 버려진 쓰레기는 어디서 온거죠?
                    </div>
                    <div class="main-title-middle">
                        우리나라 바다에 버려지는 쓰레기의 <span class=" bolder">90% 이상의 플라스틱,</span><Br>
                        그중 <span class=" bolder">60%</span>는 우리 <span class=" bolder">일상 생활에서 발생된 쓰레기</span>입니다.<br><br><br>
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/7XrxTrejx8w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                    <div class="main-title-bottom">
                        <div class="main-bottom-title">
                            지구에 남겨진 쓰레기, 이대로 괜찮을까요?
                        </div>
                        <div class="main-bottom-content">
                            <img src="/img/common/img-main-title.png" alt="지구쓰담"><br>
                            <strong>이제는 우리의 손으로 지구를 푸르깅 할 때!</strong>
                            <br>
                            <p>플라스틱 쓰레기로부터 생명을 지키고,</p>
                            <p>깨끗한 지구를 만들기 위해</p>
                            <p>지구의 쓰레기를 담습니다.</p>
                            <p>지구 푸르깅 캠페인은 심각한 플라스틱 쓰레기 문제를 알리고</p>
                            <p>국내 환경 단체와 함께 환경 회복을 위한 정화 활동을 진행합니다.</p>

                        </div>
                    </div>
                </div>
                <a href="#todo" class="button style2 down anchored"></a>
            </div>
        </section>
        <!-- End Main section-->

        <!-- Todo section-->
        <section id="todo">
            <div class="todo-container">
                <div class="todo-title">이달의 지구푸르깅 스토리</div>
                <div class="todo-content">
                    <div class="todo-content-wrap">
                        <div class="todo-content-title">지구푸르깅과 함께하는 사람들의 이야기</div>
                        <div class="todo-content-sub-title">우리의 일상으로<img src="/img/index/index_todo_content_line.png">한 지구의 일상을 지키다.</div>
                        <div class="todo-content-left"></div>
                        <div class="todo-content-img"><img src="/img/index/people3.png" alt=""></div>
                        <div class="todo-content-msg">
                            <p class="name">KH 마법소녀 현주 님</p>
                            <h4>하루를 살다가 쓰레기를 보면<br>
                                지구가 생각나요.<br>
                                평범한 하루가 간절한 지구에게<br>
                                힘이 되고 싶어요!
                            </h4>
                            <p class="msg">"제가 쓰레기로 피해를 경험하지 않았잖아요.<br>
                                감히 피해본 동물들의 마음을 헤아릴 수 없지만,<br>
                                <br>
                                지구푸르깅 후원을 통해서 아이들을 기억하고<br>
                                깨끗한 환경을 선물 해 줄 수 있어서 감사해요."
                            </p>
                            <a href="/common/donation.jsp"><div class="todo-content-support">후원하기</div></a>
                            <div class="todo-fake-box"></div>
                        </div>
                        <div class="todo-content-right"></div>
                    </div>
                </div>
                <a href="#ploggings" class="button style2 down anchored"></a>
            </div>
        </section>
        <!-- End Todo section-->

        <!-- Ploggings section-->
        <section id="ploggings">
            <div class="ploggings-container">
                <div class="ploggings-title">우리는 어떤 활동을 하나요?</div>
                <div class="plogging-content">
                    <div class="plogging-content-left"><img src="/img/index/index_ploggings_img.png" alt=""></div>
                    <div class="plogging-content-right">
                        <p>
                            <span class="p-title">플로깅은 <span class="p-color-orange">‘이삭을 줍는다’</span>는 뜻인 스웨덴어 <span  class="p-color-orange">plocka upp</span>과 영어 단어 <span  class="p-color-red">jogging(조깅)</span>이 합쳐져 생긴 합성어입니다.</span>
                            <br><br>
                            이는 조깅하면서 쓰레기를 줍는 행동으로 2016년 스웨덴에서 처음 시작된 운동으로 플로깅(plogging) 자세는 스쿼트나 런지 운동 자세와 비슷하여 칼로리 소모량이 일반 조깅보다 약 50kcal를 더 소모한다는 연구결과가 발표되며 건강과 환경 두 마리 토끼를 잡을 수 있다는 인식과 함께 2030 세대의 트렌드로 자리잡았습니다.
                            <br><br>
                            플로깅의 발상지 스웨덴을 시작으로 점차 북유럽으로 확산되어 현재는 국내를 비롯하여 전 세계적인 운동 트렌드로 자리매김하고 있습니다.
                        </p>

                    </div>
                </div>
                <a href="#ranking" class="button style2 down anchored"></a>
            </div>
        </section>
        <!-- End Ploggings section-->
        <%if(cmd!=null){%>
        <!-- myinfo section-->
        <section id="myinfo">
            <div class="myinfo-container">
                <div class="myinfo-title">접속자 정보</div>
                <div class="myinfo-content">
                    <div class="myinfo-wrap">
                        <!-- Slider main container -->
                        <div class="myinfo">
                            <!-- Additional required wrapper -->
                            <div class="myinfo-wrapper">
                                <!-- Slides -->
                                <div class="myinfo-slide">
                                    <div class="myinfo-slide-top">현재 당신의 <span>'Quest Point Boad'</span> 입니다.</div>
                                    <div class="myinfo-slide-middle left">
                                        <div class="myinfo-slide-middle-title">당신의 포인트</div>
                                        <div class="myinfo-slide-middle-content"><span><%=cmd.getQuestPoint() %></span> Point</div>
                                    </div>
                                    <div class="myinfo-slide-middle middle">
                                        <div class="myinfo-slide-middle-title">당신의 이름</div>
                                        <div class="myinfo-slide-middle-content middle"><span>:</span> <%=m.getMemberName() %></div>
                                    </div>
                                    <div class="myinfo-slide-middle right">
                                        <div class="myinfo-slide-middle-title">자기소개</div>
                                        <div class="myinfo-slide-middle-content last"><span> : </span><%=m.getMemberIntro()%></div>
                                    </div>
                                    <div class="myinfo-slide-bottom">
                                        <div class="myinfo-slide-bottom-title">현재 당신의 총 플로깅 줍것들</div>
                                        <div class="myinfo-slide-bottom-content">
                                            <ul>
                                                <li>
                                                    <div class="li-img"><img src="/img/img-recycle-can.png" alt=""></div>
                                                    <%=cmd.getQuestCan()%>
                                                </li>
                                                <li>
                                                    <div class="li-img"><img src="/img/img-recycle-glass.png" alt=""></div>
                                                    <%=cmd.getQuestGlass()%>
                                                </li>
                                                <li>
                                                    <div class="li-img"><img src="/img/img-recycle-paper.png" alt=""></div>
                                                    <%=cmd.getQuestPaper()%>
                                                </li>
                                                <li>
                                                    <div class="li-img"><img src="/img/img-recycle-plastic.png" alt=""></div>
                                                    <%=cmd.getQuestPla()%>
                                                </li>
                                                <li>
                                                    <div class="li-img"><img src="/img/img-recycle-plastic2.png" alt=""></div>
                                                    <%=cmd.getQuestWrapper()%>
                                                </li>
                                                <li>
                                                    <div class="li-img"><img src="/img/img-trash-tobacco.png" alt=""></div>
                                                    <%=cmd.getQuestTabacoo()%>
                                                </li>
                                                <li>
                                                    <div class="li-img"><img src="/img/img-plogging.png" alt=""></div>
                                                    Level: <%=cmd.getMemberLevel()%>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="swiper-pagination"></div>

                            <!-- If we need scrollbar -->
                            <div class="swiper-scrollbar"></div>
                        </div>
                    </div>
                </div>
                <a href="#chart" class="button style2 down anchored"></a>
            </div>
        </section>
        <!-- End myinfo section-->
        <%} %>

        <!-- Ranking section-->
        <section id="ranking">
            <div class="ranking-container">
                <div class="ranking-title">쓰담 퀘스트 현재 랭킹</div>
                <div class="ranking-content">
                    <div class="swiper-wrap">
                        <!-- Slider main container -->
                        <div class="swiper">
                            <!-- Additional required wrapper -->
                            <div class="swiper-wrapper">
                                <!-- Slides -->

                                <%for(ChellengeRank cr : list){ %>

                                <div class="swiper-slide">
                                    <div class="swiper-slide-wrap"></div>
                                    <div class="swiper-slide-content">
                                        <div class="swiper-slide-content-top">
                                            <img src="/img/index/index_main_bottom_title.png" alt=""><br>
                                            Quest TOP Player
                                        </div>
                                        <div class="swiper-slide-content-middle">
                                            <div class="slide-content-left">
                                                <div class="slide-content-left-top">총 포인트<br><span><%=cr.getQuestPoint() %></span> POINT</div>
                                                <div class="slide-content-left-middle">
                                                    <ul>
                                                        <li>캔<br><%= cr.getQuestCan() %></li>
                                                        <li>플라스틱<br><%= cr.getQuestPla() %></li>
                                                        <li>병<br><%=cr.getQuestGlass() %></li>
                                                    </ul>
                                                    <ul>
                                                        <li>종이<br><%=cr.getQuestPaper() %></li>
                                                        <li>비닐<br><%=cr.getQuestWrapper() %></li>
                                                        <li>담배꽁초<br><%=cr.getQuestTabacoo() %></li>
                                                    </ul>

                                                    <div class="slide-content-sub">
                                                        <h3>닉네임 : <%=cr.getNickName()%> 님</h3>
                                                        <p><%=cr.getMemberIntro() %></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-content-right">
                                                <div class="slide-content-name">전체 '<%=cr.getRank()%>'등<br><span><%=cr.getMemberName() %></span> 님</div>
                                                <div class="slide-content-img">
                                                    <!-- 인물사진 -->
                                                    <img src="/upload/chellenge/<%=cr.getPhotoPath()%>" alt="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="swiper-slide-content-bottom"></div>
                                    </div>
                                    <img src="/img/index/test6.jpg" alt="">
                                </div>
                                <%} %>
                            </div>
                            <!-- If we need pagination -->
                            <div class="swiper-pagination"></div>

                        </div>
                        <!-- If we need navigation buttons -->
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>

                        <!-- If we need scrollbar -->
                        <div class="swiper-scrollbar"></div>
                    </div>
                </div>
                <a href="#chart" class="button style2 down anchored"></a>
            </div>
        </section>
        <!-- End Ranking section-->

        <!-- Chart section-->
        <section id="chart">
            <div class="chart-container">
                <div class="chart-title">우리의 플로깅 활동 차트</div>
                <div class="chart-content">
                    <div class="chart-wrap">
                        <canvas id="bar-chart"></canvas>
                    </div>
                    <a href="#support" class="button style2 down anchored"></a>
                </div>
            </div>
        </section>
        <!-- End Chart section-->

        <!-- Support section-->
        <section id="support">
            <div class="support-container">
                <div class="support-wrap"></div>
                <div class="support-img"></div>
                <div class="support-content">
                    <p>쓰레기로 고통 받는 지구에겐</p><br>
                    <p>바로 오늘의 도움이 필요합니다</p><br>
                    <div><a href="/common/donation.jsp">지구푸르깅 후원하기</a></div>
                    <a href="#" class="button style2 down anchored"></a>
                </div>
            </div>
        </section>
        <!-- End Support section-->
    </div>
    <!-- // content -->


    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</div>

<!-- script Line -->
<script>
    setTimeout(function(){
        name = $(".name");
        let count = 0;
    },5000);

    $(window).on("load", function () {
        function fade() {
            let animation_height = $(window).innerHeight() * 0.5;
            let ratio = Math.round((1 / animation_height) * 10000) / 10000;
            $(".ploggings-container").each(function () {
                let objectTop = $(this).offset().top;
                let windowBottom = $(window).scrollTop() + $(window).innerHeight();
                if (objectTop < windowBottom) {
                    if (objectTop < windowBottom - animation_height) {
                        $(this).css({
                            transition: "opacity 0.1s linear",
                            transition: "left 0.2s linear",
                            opacity: 1,
                            left: "0px",
                        });
                    } else {
                        $(this).css({
                            transition: "opacity 0.7s linear",
                            opacity: (windowBottom - objectTop) * ratio,
                            transition: "left 0.7s linear",
                            left: `${200 * (1 - (windowBottom - objectTop) * ratio)}px`,
                        });
                    }
                } else {
                    $(this).css({
                        opacity: 0,
                        left: "200px",
                    });
                }
            });

            $(document).ready(function() {
                $(window).scroll( function(){
                    $('.main-title-middle').each( function(i){

                        var bottom_of_element = $(this).offset().top + $(this).outerHeight();
                        var bottom_of_window = $(window).scrollTop() + $(window).height();

                        if( bottom_of_window > bottom_of_element ){
                            $(this).animate({'opacity':'1','margin-left':'0px'},900);
                        }

                    });
                });
            });
            $(document).ready(function() {
                $(window).scroll( function(){
                    $('.main-wrap-bottom').each( function(i){

                        var bottom_of_element = $(this).offset().top + $(this).outerHeight();
                        var bottom_of_window = $(window).scrollTop() + $(window).height();

                        if( bottom_of_window > bottom_of_element ){
                            $(this).animate({'opacity':'1','margin-left':'0px'},900);
                        }

                    });
                });
            });
            $(document).ready(function() {
                $(window).scroll( function(){
                    $('.main-wrap-top').each( function(i){

                        var bottom_of_element = $(this).offset().top + $(this).outerHeight();
                        var bottom_of_window = $(window).scrollTop() + $(window).height();

                        if( bottom_of_window > bottom_of_element ){
                            $(this).animate({'opacity':'1','margin-left':'0px'},900);
                        }

                    });
                });
            });


        }

        $(".ploggings-container").css({
            opacity: 0,
            left: "200px",
        });
        fade();
        $(window).scroll(function () {
            fade();
        });
    });


    const swiper = new Swiper('.swiper', {
        // Optional parameters
        direction: 'vertical',
        loop: true,

        // If we need pagination
        pagination: {
            el: '.swiper-pagination',
        },

        // Navigation arrows
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },

        // And if we need scrollbar
        scrollbar: {
            el: '.swiper-scrollbar',
        },
    });

    //차트.js 스크립트
    new Chart(document.getElementById("bar-chart"), {
        type: 'bar',
        data: {
            labels: ["캔 개수", "플라스틱 개수", "병 개수", "종이 개수", "비닐 개수", "담배꽁초 개수"],
            datasets: [
                {
                    label: "수집된 쓰레기 총 개수",
                    backgroundColor: ["#3e95ff", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#3e95cd"],
                    <%if(all!=null){%>
                    data:
                        [<%=all.getQuestCan()%>,
                            <%=all.getQuestPla()%>,
                            <%=all.getQuestGlass()%>,
                            <%=all.getQuestPaper()%>,
                            <%=all.getQuestWrapper()%>,
                            <%=all.getQuestTabacoo()%>]
                    <%}else{%>
                    data: [,,,,,]
                    <%}%>
                },{
                    <%if(cmd!=null){%>
                    label: "<%=cmd.getMemberName()%>님의 수집 총 개수",
                    <%}else{%>
                    label: "로그인 시 데이터를 조회 할 수 있습니다!!!",
                    <%}%>
                    backgroundColor: ["#3cba9f", "#8e5ed2","#3cbaff","#e8c3c9","#c458f0","#3e958d"],
                    borderWidth: 5,
                    <%if(cmd!=null){%>
                    data:
                        [<%=cmd.getQuestCan()%>,
                            <%=cmd.getQuestPla()%>,
                            <%=cmd.getQuestGlass()%>,
                            <%=cmd.getQuestPaper()%>,
                            <%=cmd.getQuestWrapper()%>,
                            <%=cmd.getQuestTabacoo()%>]
                    <%}else{%>
                    data: [,,,,,]
                    <%}%>
                }
            ]
        },
        options: {
            legend: { maintainAspectRatio: false, display: true, labels: {
                    fontSize: 17,
                }
            },
            ticks: {
                stepSize: 10, //y축 간격
                suggestedMin: 0,//y축 최소 값
                suggestedMax: 200,//y축 최대값
            },
            title: {
                display: true,
                text: '현재까지 모인 쓰레기의 총 개수',
                font:{
                    size:50,
                    weight: 'bold',
                    lineHeight: 1.2
                }
            }
        }
    });

    $(document).ready(function(){
        google.charts.load('50', {'packages':['line','controls']});
        chartDrowFun.chartDrow(); //chartDrow() 실행
    });

</script>
<!-- End script Line -->
</body>
</html>