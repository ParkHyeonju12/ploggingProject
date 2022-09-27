<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>후원하기</title>
<%--    <link rel="stylesheet" href="/css/notosans.css">--%>
<%--    <link rel="stylesheet" href="/css/reset.css">--%>
<%--    <link rel="stylesheet" href="/css/default.css">--%>
    <link rel="stylesheet" href="/css/donation.css" />
</head>
<body>
<div class="wrapper">
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- content -->
    <div class="page-content">
        <div class="dona_top_container">
            <div class="dona_top_header">
                <div class="welcome-ment">
                    후원하기
                </div>
            </div>
        </div>

        <div class="dona_main_container">
            <form action="/donation.do" method="post" class="dona_select_form" name="dona_select_form">

                <input type="hidden" name="memberNo" id="memberNo" value="<%if(m!=null){%><%=m.getMemberNo()%><%} else {%>1<%}%>">

                <div class="dona_way_wrap">
                    <div class="dona_way_text">1. 후원 방법</div>
                    <h3>후원 방법</h3>
                    <div class="dona_way_button_wrap">
                        <div class="dona_amount_wrap">
                            <input type="radio" name="donationType" id="donationType2" class="amountBtn " value="2" checked><label for="donationType2">일시</label>
                            <input type="radio" name="donationType" id="donationType1" class="amountBtn " value="1" onclick="alert('개발중입니다.');this.previousElementSibling.previousElementSibling.checked = true;"><label for="donationType1">정기</label>
                        </div>
                    </div>
                    <h3>후원 분야</h3>
                    <select name="donationField">
                        <option value="select_dona">후원 분야 선택</option>
                        <option value="world_child">세계 어린이 돕기</option>
                        <option value="emer_ukr">긴급구호 (우크라이나 등 분쟁지역 어린이 돕기)</option>
                        <option value="emer_paki">긴급구호 (파키스탄 등 재해지역 어린이 돕기)</option>
                        <option value="refugee_child">난민 어린이 돕기</option>
                        <option value="aids_child">에이즈 감염 어린이 돕기</option>
                    </select>
                    <h3>후원 금액(원)</h3>
                    <div class="dona_amount_Allwrap">
                        <div class="dona_amount_wrap">
                            <input type="radio" name="donationAmount" id="btn_1" class="amountBtn calcBtn" value="30000"><label for="btn_1">30,000</label>
                            <input type="radio" name="donationAmount" id="btn_2" class="amountBtn calcBtn" value="50000"><label for="btn_2">50,000</label>
                            <input type="radio" name="donationAmount" id="btn_3" class="amountBtn calcBtn" value="100000"><label for="btn_3">100,000</label>
                        </div>
                        <div class="dona_amount_wrap">
                            <input type="radio" name="donationAmount" id="btn_4" class="amountBtn calcBtn" value="200000"><label for="btn_4">200,000</label>
                            <input type="radio" name="donationAmount" id="btn_5" class="amountBtn calcBtn" value="300000"><label for="btn_5">300,000</label>
                            <input type="text" name="donationAmount" id="btn_6"class="amountText" placeholder="금액 직접 입력">
                        </div>
                    </div>
                   <%-- <div class="dona_amount_text bodyhr">
                        <div class="dona_background">
                            <div class="background_text1 back_text">월 <b>30,000</b>원이면,<br> 전 세계 어린이를 위해 파상풍 예방백신 3,000회분을 지원할 수 있습니다.</div>
                            <div class="background_text2 back_text">월 <b>50,000</b>원이면, <br>전세계 어린이를 위해 식수정화제 130,000알을 지원할 수 있습니다.</div>
                            <div class="background_text3 back_text">월 <b>100,000</b>원이면, <br>전 세계 어린이를 위해 홍역 예방백신 2,400회분을 지원할 수 있습니다.</div>
                            <div class="background_text4 back_text">월 <b>200,000</b>원이면, <br>전 세계 어린이를 위해 뇌수막염치료제/항생제 3,428병을 지원할 수 있습니다.</div>
                            <div class="background_text5 back_text">월 <b>300,000</b>원이면, <br>전 세계 어린이를 위해 연필 107,999자루를 지원할 수 있습니다.</div>
                            <div class="background_text6 back_text">월 <span id="input<Val"></span>원이면, 전 세계 어린이를 위해 에이즈 테스트키트 <span id="inputAmount"></span>개를 지원할 수 있습니다.</div>
                        </div>
                    </div>--%>
                    <div class="summary_wrap">
                        <p>총 후원금액</p>
                        <div class="summary_num">
                            <span id="sum_pay"></span>
                            <span>원</span>
                            <input type="hidden" id="donaAmount">
                        </div>
                    </div>
                    <hr class="sum_next_hr bodyhr">
                    <div class="nextBtn_wrap">
                        <div class="nextBtn btn bc4 bs4 br-none">다음</div>
                    </div>
                </div>
                <div class="dona_info_container">
                    <div class="dona_info_wrap">
                        <div class="dona_info_text">2. 후원자 정보</div>
                    </div>
                    <div class="name_input_wrap input_wrap">
                        <label for="donaName">성명<span class="dot fc-6">ㆍ</span>
                        </label>
                        <div class="dona_info_wrapper">
                            <input type="text" id="donaName" name="donaName" class="input-form" placeholder="성명 입력" >
                        </div>

                    </div>
                    <div class="birth_input_wrap input_wrap">
                        <label for="donaBirth">생년월일<span class="dot fc-6">ㆍ</span></label>
                        <div class="dona_info_wrapper">
                            <input type="text" id="donaBirth" name="donaBirth" class="input-form" placeholder="생년월일 6자리 입력" >
                            <div class="add_comment">*만 14세 미만의 경우, 법정대리인 인증이 완료되어야 후원이 가능합니다.</div>
                        </div>

                    </div>
                    <div class="phone_input_wrap input_wrap">
                        <label for="donaPhone">휴대폰번호<span class="dot fc-6">ㆍ</span></label>
                        <div class="dona_info_wrapper">
                            <input type="text" id="donaPhone" name="donaPhone" class="input-form" placeholder="휴대폰번호 입력('-'포함)" >
                        </div>

                    </div>
                    <div class="email_input_wrap input_wrap">
                        <label for="donaEmail">이메일<span class="dot fc-6">ㆍ</span></label>
                        <div class="dona_info_wrapper">
                            <input type="text" id="donaEmail" name="donaEmail" class="input-form" placeholder="이메일주소 입력" >
                        </div>
                    </div>
                    <div class="dona_info_agree_wrap">
                        <label>정보 수신 동의(선택)</label>
                        <div class="select_agree">
                            <div class="info_agree_check">
                                <div class="mobile_section">
                                    <label for="mobile_agree">모바일
                                        <input type="checkbox" id="mobile_agree" name="mobile_agree" value="모바일">
                                    </label>
                                </div>
                                <div class="email_section">
                                    <label for="email_agree">이메일
                                        <input type="checkbox" id="email_agree" name="email_agree" value="이메일">
                                    </label>
                                </div>
                                <div class="mail_section">
                                    <label for="mail_agree">우편
                                        <input type="checkbox" id="mail_agree" name="mail_agree" value="메일">
                                    </label>
                                </div>
                            </div>
                            <div class="info_guide_wrap">
                                <div class="info_guide_section bg-3">
                                    <div class="first_guide"><span class="dot fc-6">ㆍ</span>공지사항 및 회원관리 안내는 수신 여부와 관계없이 발송됩니다.</div>
                                    <div class="second_guide"><span class="dot fc-6">ㆍ</span>동의 내용은 언제든지 웹사이트 또는 고객센터를 통해 변경이 가능합니다.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="finalBtn_wrap">
                        <input type="submit" class="finalBtn btn bc4 bs4 br-none" value="후원하기">
<%--                        <button type="button" onclick="requestPay()">PAY</button>--%>
                    </div>
                </div>
            </form>
        </div>
        <!-- // content -->

        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>



        $(".calcBtn").on("click",function(){
            const index = $(".calcBtn").index(this);
            $(".back_text").hide();
            const expain = $(this).parent().parent().next().children().children().eq(index);
            expain.show();
            $("#donaAmount").val($(".calcBtn").eq(index).val());
            $("#sum_pay").text($(".calcBtn").eq(index).val());

        });



        $("#btn_6").on({

            "keyup" : function() {
                if(!/[0-9]$/.test($(this).val())) {
                    $(this).val("");
                    $("#sum_pay").text(0);

                    return;
                }

                $(".back_text").hide();
                const inputvalue = Number($("#btn_6").val());
                const cost = 150;
                const amount = Math.floor(inputvalue/cost);
                inputvalue.toLocaleString();
                $("#inputVal").text(inputvalue.toLocaleString());
                $("#inputAmount").text(amount.toLocaleString());
                const expain = $(this).parent().parent().next().children().children().last();
                expain.show();

                $("#sum_pay").text(inputvalue.toLocaleString());
            },
            "change" : function() {
                if($(this).val() < 1000 || $(this).val() > 1000000) {
                    $(this).val("");
                    $("#sum_pay").text(0);
                    return;
                }
                $("#donaAmount").val($(this).val());

            },

            "focus" : function() {
                $("[name=donationAmount]").prop("checked", false);

            }

        });


        $(".finalBtn").on("click",function(e){
            //console.log(/^[가-힣]{2,5}$/.test($("#donaName").val()));
            e.preventDefault();
            if(/^[가-힣]{2,5}$/.test($("#donaName").val()) == false) {
                alert("다시 입력하세요");
                $("#donaName").focus();
                return;
            }

            if(/^[1-9]+[0-9]{5}$/.test($("#donaBirth").val()) == false) {
                alert("다시 입력하세요");
                $("#donaBirth").focus();
                return;
            }

            if(/^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$/.test($("#donaPhone").val()) == false) {
                alert("다시 입력하세요");
                $("#donaPhone").focus();
                return;
            }

            if(/^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$/.test($("#donaPhone").val()) == false) {
                alert("다시 입력하세요");
                $("#donaPhone").focus();
                return;
            }

            if(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/.test($("#donaEmail").val()) == false) {
                alert("다시 입력하세요");
                $("#donaEmail").focus();
                return;
            }

            requestPay();
        });


        $(".nextBtn").on("click",function(){

            if($("[name=donationType]:checked").length < 1 || $("[name=donationField]").val() == 'select_dona' || ($("[name=donationAmount]:checked").length < 1 && $("#btn_6").val() == "" )) {
                alert("다시 입력해주세요");

                return;
            }

            $(".dona_way_wrap").hide();
            $(".dona_info_container").show();

        });



        const IMP = window.IMP; // 생략 가능
        IMP.init("imp24425337");

        function requestPay() {
            // IMP.request_pay(param, callback) 결제창 호출
            const d = new Date();
            const date = d.getFullYear()+""+(d.getMonth()+1) + "" + d.getDate() + "" + d.getHours() + "" + d.getMinutes() + "" + d.getSeconds();

            IMP.request_pay({ // param
                pg: "html5_inicis",
                pay_method: "card",
                merchant_uid: "PLG-" + date,
                name: "후원하기 테스트",
                amount: $("#donaAmount").val(),
                buyer_email: $("#donaEmail").val(),
                buyer_name: $("#donaName").val(),
                buyer_tel: $("#donaPhone").val(),
                //buyer_addr: "인천시 서구 청라커낼로 163",
                buyer_postcode: "01181"
            }, function (rsp) { // callback
                if (rsp.success) {
                    $("form[name=dona_select_form]").submit();
                } else {
                    alert("후원실패 관리자에게 문의하세요")
                }
            });
        }

    </script>
</body>
</html>