
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지 - 내정보</title>
    <link rel="stylesheet" href="/css/style-mypage-admin.css">
    <style>
        .btn-pw-change:disabled,
        .btn-addr-search:disabled,
        button[type=submit]:disabled{
            opacity: .4;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <%@include file="/WEB-INF/views/common/header.jsp" %>
        <!-- content -->
        <div class="page-content mypage-info">

            <div class="content-wrap flex">
                <%@include file="mypageSide.jsp"%>
                <div class="content-container">
                    <div class="content-title">
                        <h1>나의 정보</h1>
                        <p>오늘도 열심히 푸르깅!</p>
                    </div>
                    <div class="content-body">
                        <form action="/updateMyInfo.do" method="post">
                            <input type="hidden" id="beforeMemberId" name="beforeMemberId" value="<%=m.getMemberId()%>">
                            <div class="input-line">
                                <label for="memberId">아이디</label>
                                <input type="text" name="memberId" id="memberId" class="input-form info-mod" value="<%=m.getMemberId()%>" readonly>
                                <span class="comment"></span>
                            </div>
                            <div class="input-line">
                                <label for="memberPw">비밀번호</label>
                                <button type="button" class="btn bc2 btn-pw-change info-mod" disabled>비밀번호변경</button>
                            </div>
                            <div class="input-line" style="display:none">
                                <!-- <label for="memberPw">비밀번호</label> -->
                                <input type="password" name="memberPw" id="memberPw" class="input-form" value="" disabled>
                                <span class="comment"></span>
                            </div>
                            <div class="input-line" style="display:none">
                                <label for="memberPwRe">비밀번호 확인</label>
                                <input type="password" name="memberPwRe" id="memberPwRe" class="input-form" value="" disabled>
                                <span class="comment"></span>
                            </div>
                            <div class="input-line">
                                <label for="memberName">이름</label>
                                <input type="text" name="memberName" id="memberName" class="input-form info-mod" value="<%=m.getMemberName()%>" readonly>
                                <span class="comment"></span>
                            </div>
                            <div class="input-line">
                                <label for="memberNickname">닉네임</label>
                                <input type="text" name="memberNickname" id="memberNickname" class="input-form info-mod" value="<%=m.getNickname()%>" readonly>
                                <span class="comment"></span>
                            </div>
                            <div class="input-line">
                                <label for="memberEmail">이메일</label>
                                <input type="text" name="memberEmail" id="memberEmail" class="input-form info-mod" value="<%=m.getMemberEmail()%>" readonly>
                                <span class="comment"></span>
                            </div>
                            <div class="input-line">
                                <label for="memberAddr">주소</label>
                                <div class="input-group">
                                    <input type="text" name="memberAddr" id="memberAddr" class="input-form" value="<%=m.getMemberAddr()%>" readonly>
                                    <button type="button" class="btn bc1 br-none btn-addr-search info-mod" disabled>주소검색</button>
                                </div>
                                <input type="text" class="input-form info-mod" id="addrDetail" id="addrDetail" placeholder="상세주소"  readonly>
                            </div>
                            <div class="input-line">
                                <label for="totalPoint">플로깅 점수</label>
                                <input type="text" name="totalPoint" id="totalPoint" class="input-form" readonly>
                            </div>

                            <button type="button" class="btn-user-del">회원탈퇴하기</button>

                            <div class="form-btn">
                                <button type="button" class="btn-mod btn bc4">수정하기</button>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!-- // content -->
        <%@include file="/WEB-INF/views/common/footer.jsp" %>
        <script src="/js/sideMenu.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="/js/sweetalert.min.js"></script>
                <script>
                    const userInfo = {
                        memberId : "<%=m.getMemberId()%>",
                        memberName : "<%=m.getMemberName()%>",
                        memberNickname : "<%=m.getNickname()%>",
                        memberEmail: "<%=m.getMemberEmail()%>",
                        memberAddr: "<%=m.getMemberAddr()%>"
                    };

                    let validation = false;
                    let pwValidation = false;

                    $(document).ready(function(){

                        const searchBtn = document.querySelector(".btn-addr-search");
                        searchBtn.addEventListener("click", function() {
                            new daum.Postcode({
                                oncomplete: function(data) {
                                    //console.log(data);
                                    const addrForm1 = document.querySelector("#memberAddr");
                                    const address = data.address;
                                    addrForm1.value = address;
                                    if(addrForm1.value != userInfo["memberAddr"]) {
                                        $(addrForm1).change();
                                        validation = true;
                                    } else {
                                        validation = false;
                                    }

                                }
                            }).open();
                        })

                        $(".input-form").on({
                            "change" : function() {
                                const input = $(this);
                                const inputVal = $(this).val();
                                const inputId = $(this).attr("id");
                                const inputLine = $(this).parent();
                                const comment = $(this).next();

                                const confirmValue = function(regex, str){
                                    if(regex.test(inputVal)){
                                        inputLine.removeClass("is-invalid");
                                        comment.text("");
                                        validation = true;
                                    } else {
                                        inputLine.addClass("is-invalid");
                                        comment.text(str);
                                        validation = false;
                                        input.focus();
                                    }
                                }

                                if(inputVal != "") {
                                    if(inputId == "memberId" ) {

                                        const idReg = /^[a-zA-Z0-9]{6,20}$/;
                                        confirmValue(idReg, "아이디는 대/소문자, 영문으로 6~20자 입니다.");

                                        if(inputVal != userInfo["memberId"] && idReg.test(inputVal)) {
                                            $.ajax({
                                                url :"/ajaxMyInfoCheckId.do",
                                                type : "get",
                                                async: false,
                                                data : {memberId:inputVal},
                                                success : function(data) {

                                                    if(data == "1") {
                                                        inputLine.addClass("is-invalid");
                                                        comment.text("중복된 아이디 입니다.");
                                                        validation = false;
                                                    } else {
                                                        inputLine.removeClass("is-invalid");
                                                        comment.text("");
                                                        validation = true;

                                                    }
                                                }
                                            })
                                        }
                                        confirmValue(idReg, "아이디는 대/소문자, 영문으로 6~20자 입니다.");
                                    } else if (inputId == "memberName") {
                                        const nameRef = /^[가-힣]{2,5}$/;
                                        confirmValue(nameRef, "이름은 한글 2~5자 입니다.");
                                    } else if (inputId == "memberNickname") {
                                        const nicknameRef = /^[가-힣]{2,8}$/;
                                        confirmValue(nicknameRef, "닉네임은 한글 2~8자 입니다.");
                                    } else if (inputId == "memberEmail") {
                                        const emailRef = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                                        confirmValue(emailRef, "이메일 형식이 아닙니다.");
                                    } else if (inputId == "memberAddr") {
                                        if(inputVal != userInfo["memberAddr"]) {
                                            validation = true;
                                        } else {
                                            validation = false;
                                        }

                                    }
                                }

                                if (inputId == "memberPwRe" || inputId == "memberPw"){
                                    const pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;

                                    if(pwReg.test(inputVal) && $("[name=memberPw]").val() == inputVal && $("[name=memberPwRe]").val() == inputVal ) {
                                        $("[name=memberPwRe]").parent().removeClass("is-invalid");
                                        $("[name=memberPwRe]").next().text("");
                                        validation = true;
                                    } else {
                                        $("[name=memberPwRe]").parent().addClass("is-invalid");
                                        $("[name=memberPwRe]").next().text("비밀번호가 일치하지 않습니다.");
                                        if($("[name=memberPwRe]").val()!="") {
                                            input.focus();
                                        }
                                        validation = false;
                                    }
                                }

                                if($("[name=memberPw]").prop("disabled") == false) {
                                    if(validation) {
                                        modBtn.disabled = false;
                                    } else{
                                        modBtn.disabled = true;
                                    }
                                } else {
                                    validationCheck();
                                }

                            },
                            "keyup" : function() {

                                const input = $(this);
                                const inputVal = input.val();
                                const inputId = input.attr("id");
                                const inputLine = $(this).parent();
                                const comment = $(this).next();

                                if(inputId == "memberPw") {
                                    const pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
                                    const confirmValue = function(regex, str){

                                        if(regex.test(inputVal)){
                                            inputLine.removeClass("is-invalid");
                                            comment.text("");
                                            validation = true;
                                        } else {
                                            inputLine.addClass("is-invalid");
                                            comment.text(str);
                                            validation = false;

                                        }
                                    }

                                    confirmValue(pwReg, "8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
                                    if(inputVal == $("[name=memberPwRe]").val() && inputVal == $("[name=memberPw]").val() && pwReg.test(inputVal)) {
                                        $("[name=memberPwRe]").parent().removeClass("is-invalid");
                                        $("[name=memberPwRe]").next().text("");
                                        validation = true;
                                    } else {
                                        if($("[name=memberPwRe]").val() != "") {
                                            $("[name=memberPwRe]").parent().addClass("is-invalid");
                                            $("[name=memberPwRe]").next().text("비밀번호가 일치하지 않습니다.");
                                            input.focus();
                                        }
                                        validation = false;
                                    }

                                    if($("[name=memberPw]").prop("disabled") == false) {
                                        if(validation) {
                                            //if(validation && pwValidation ) {
                                            modBtn.disabled = false;
                                        } else{
                                            modBtn.disabled = true;
                                        }
                                    } else {
                                        validationCheck();
                                    }


                                }
                            }
                        })
                    })

                    function validationCheck() {
                        if(validation && ($("[name=memberId]").val() != userInfo["memberId"] || $("[name=memberName]").val() != userInfo["memberName"] ||  $("[name=memberNickname]").val() != userInfo["memberNickname"] || $("[name=memberEmail]").val() != userInfo["memberEmail"] || $("[name=memberAddr]").val() != userInfo["memberAddr"])) {
                            modBtn.disabled = false;
                        } else{
                            modBtn.disabled = true;
                        }
                    }

                    const btnPwChange = document.querySelector(".btn-pw-change");

                    btnPwChange.addEventListener("click", function(){

                        const pwForm1 = document.querySelector("[name=memberPw]");
                        const pwForm2 = document.querySelector("[name=memberPwRe]");

                        if(!this.classList.contains("active")){
                            pwForm1.parentNode.style.display = "flex";
                            pwForm2.parentNode.style.display = "flex";
                            pwForm1.disabled = false;
                            pwForm2.disabled = false;
                            this.classList.add("active");
                            if(pwForm1.value == "" || pwForm2.value == "" ) {
                                modBtn.disabled = true;
                            }
                        } else {

                            pwForm1.value = "";
                            pwForm2.value = "";
                            pwForm1.parentNode.style.display = "none";
                            pwForm2.parentNode.style.display = "none";
                            pwForm1.disabled = true;
                            pwForm2.disabled = true;
                            this.classList.remove("active");
                            validationCheck();
                        }

                    })

                    const modBtn = document.querySelector(".btn-mod");

                    modBtn.addEventListener("click", function(e) {

                        if(this.classList.contains("btn-mod")){
                            e.preventDefault();
                            this.disabled = true;
                        }

                        this.setAttribute("type", "submit");
                        this.className = "btn bc2";
                        this.innerText = '수정완료';

                        const infoMod = document.querySelectorAll(".info-mod");
                        infoMod.forEach(function(item, idx) {
                            if(item.disabled){
                                item.disabled = false;
                            }
                            if(item.readOnly){
                                item.readOnly = false;
                            }
                        })

                    })

                    const userDelBtn = document.querySelector(".btn-user-del");
                    userDelBtn.addEventListener("click", function() {
                        swal({
                            title: "탈퇴하시겠습니까?",
                            text: "",
                            icon: "warning",
                            buttons: true,
                            dangerMode: true,
                            buttons: ["취소", "탈퇴하기"],

                        })
                        .then((willDelete) => {
                            if (willDelete) {
                                window.location = "/deleteMember.do?memberId=<%=m.getMemberId()%> ";
                            }
                        });
                    })

        </script>
    </div>
</body>
</html>
