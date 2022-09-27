
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="/css/signup.css">
    <style>
        .input-form::placeholder{
            color:rgba(0,0,0,.35);
        }
        .btn-mod:disabled{
            opacity: .4;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <%@include file="/WEB-INF/views/common/header.jsp"%>
        <div class="page-content">
<%--            <div class="top-banner">
                <h1>회원가입</h1>
            </div>--%>
            <div class="content-wrap flex flex-center">
                <div class="content-container">
                    <div class="content-title">
                        <h1>회원가입</h1>
                    </div>
                    <div class="content-body">
                        <form action="/signup.do" method="post">
                            <input type="hidden" id="beforeMemberId" name="beforeMemberId" value="">
                            <div class="input-line">
                                <label for="memberId">아이디</label>
                                <input type="text" name="memberId" id="memberId" class="input-form info-mod" value="" >
                                <span class="comment"></span>
                            </div>

                            <div class="input-line">
                                <label for="memberPw">비밀번호</label>
                                <input type="password" name="memberPw" id="memberPw" class="input-form" value="">
                                <span class="comment"></span>
                            </div>
                            <div class="input-line">
                                <label for="memberPwRe">비밀번호 확인</label>
                                <input type="password" name="memberPwRe" id="memberPwRe" class="input-form" value="">
                                <span class="comment"></span>
                            </div>
                            <div class="input-line">
                                <label for="memberName">이름</label>
                                <input type="text" name="memberName" id="memberName" class="input-form info-mod" value="">
                                <span class="comment"></span>
                            </div>
                            <div class="input-line">
                                <label for="memberNickname">닉네임</label>
                                <input type="text" name="memberNickname" id="memberNickname" class="input-form info-mod"  value="">
                                <span class="comment"></span>
                            </div>
                            <div class="input-line">
                                <label for="memberBirth">생년월일</label>
                                <input type="text" name="memberBirth" id="memberBirth" class="input-form info-mod" placeholder="991010" value="">
                                <span class="comment"></span>
                            </div>
                            <div class="input-line">
                                <label for="memberPhone">전화번호</label>
                                <input type="text" name="memberPhone" id="memberPhone" class="input-form info-mod" value="" placeholder="010-1234-5678">
                                <span class="comment"></span>
                            </div>
                            <div class="input-line">
                                <label for="memberEmail">이메일</label>
                                <input type="text" name="memberEmail" id="memberEmail" class="input-form info-mod" value="" >
                                <span class="comment"></span>
                            </div>
                            <div class="input-line">
                                <label for="memberAddr">주소</label>
                                <div class="input-group">
                                    <input type="text" name="memberAddr" id="memberAddr" class="input-form" value="" readonly>
                                    <button type="button" class="btn bc1 br-none btn-addr-search info-mod">주소검색</button>
                                </div>
                                <input type="text" class="input-form info-mod" id="addrDetail" id="addrDetail" placeholder="상세주소" >
                            </div>
                            <div class="input-line">
                                <label for="memberIntro">자기소개</label>
                                <textarea name="memberIntro" id="memberIntro" cols="30" rows="10"></textarea>
<%--                                <input type="text" name="memberIntro" id="memberIntro" class="input-form info-mod" value="" >--%>
                                <span class="comment"></span>
                            </div>
                            <div class="form-btn">
                                <button type="submit" class="btn-mod btn bc4" disabled>회원가입</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/common/footer.jsp"%>
    </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        $(document).ready(function(){
            const searchBtn = document.querySelector(".btn-addr-search");
            searchBtn.addEventListener("click", function() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        const addrForm1 = document.querySelector("#memberAddr");
                        const address = data.address;
                        addrForm1.value = address;
                        if(addrForm1.value != "") {
                            $(addrForm1).change();
                            validation = true;
                        } else {
                            validation = false;
                        }

                    }
                }).open();
            })

            let validation = false;
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
                            if(idReg.test(inputVal)) {
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

                        } else if(inputId == "memberPwRe" || inputId == "memberPw") {
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
                        } else if (inputId == "memberName"){
                            const nameRef = /^[가-힣]{2,5}$/;
                            confirmValue(nameRef, "이름은 한글 2~5자 입니다.");
                        } else if (inputId == "memberNickname") {
                            const nicknameRef = /^[가-힣]{2,8}$/;
                            confirmValue(nicknameRef, "닉네임은 한글 2~8자 입니다.");

                            if(nicknameRef.test(inputVal)) {
                                $.ajax({
                                    url :"/ajaxCheckNickname.do",
                                    type : "get",
                                    async: false,
                                    data : {nickname:inputVal},
                                    success : function(data) {

                                        if(data == "true") {
                                            inputLine.addClass("is-invalid");
                                            comment.text("중복된 닉네임 입니다.");
                                            validation = false;
                                        } else {
                                            inputLine.removeClass("is-invalid");
                                            comment.text("");
                                            validation = true;

                                        }

                                    }
                                })
                            }
                        } else if(inputId == "memberBirth") {
                            const birthReg = /^[1-9]+[0-9]{5}$/;
                            confirmValue(birthReg, "생년월일 형식이 아닙니다");
                        } else if(inputId == "memberPhone"){
                            const phReg = /^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$/;
                            confirmValue(phReg, "전화번호 형식은 010-0000-0000 입니다.");
                        } else if(inputId == "memberEmail") {
                            const emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                            confirmValue(emailReg, "이메일 형식에 맞지않습니다.");
                        } else if(inputId == "memberAddr") {

                        }
                    }
                    validationCheck();
                },
                "keyup" : function() {
                    const input = $(this);
                    const inputVal = input.val();
                    const inputId = input.attr("id");
                    const inputLine = $(this).parent();
                    const comment = $(this).next();

                    if(inputVal != "") {
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
                            validationCheck();
                        }
                    }

                }
            })

            function validationCheck() {

                const modBtn = document.querySelector(".btn-mod");
                //console.log(validation);
                if(validation && ($("[name=memberId]").val() != "" && $("[name=memberName]").val() != "" && $("[name=memberPw]").val() != "" && $("[name=memberPwRe]").val() != "" && $("[name=memberNickname]").val() != "" && $("[name=memberBirth]").val() != "" && $("[name=memberPhone]").val() != "" && $("[name=memberEmail]").val() != "" && $("[name=memberAddr]").val() != "")) {
                    modBtn.disabled = false;
                } else{
                    modBtn.disabled = true;
                }
            }
        });
    </script>
</body>
</html>
