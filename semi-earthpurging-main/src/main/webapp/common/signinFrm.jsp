
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="/css/signin.css" />
</head>
<body>
<div class="wrapper">
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    <!-- content -->
    <div class="page-content">
        <div class="login_full_container">

            <div class="login_main_container">
                <div class="login_introduce_main">
                    <div class="main_intro">
                        로그인
                    </div>
                </div>
                <div class="input_info_wrap">
                    <form action="/signin.do" class="input_info_form" name="input_info_form" >
                        <div class="id_input_wrap">
                            <input type="text" id="signId" name="signId" class="input-form" placeholder="아이디" required>
                        </div>
                        <div class="pw_input_wrap">
                            <input type="password" id="signPw" name="signPw" class="input-form" placeholder="비밀번호" required>
                            <span class="i">
                                <img src="/img/iconmonstr-eye-thin-240.png">
                            </span>
                        </div>
                        <div class="save_find_wrap">
                            <%--
                            <label for="saveid">
                                <input type="checkbox" id="saveid" name="saveid" value="saveid">아이디저장
                            </label>
                            --%>
<%--                            <a class="findIdPw" href="#">아이디/비밀번호 찾기</a>--%>
                        </div>
                        <div class="loginBtnWrap">
                            <input type="submit" name="loginBtn" class="bc55 br-none"
                                   value="로그인">
                        </div>
                        <div>회원이 아니시라면,지금 회원에 가입하세요.</div>
                        <div class="signUpBtnWrap">
                            <a href="/common/signupFrm.jsp" class="btn bc5 br-none">회원가입</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- // content -->
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
    <script>
        $(document).ready(function() {
            $("[name=signId]").focus();

            $("#signPw + span>img").on("click", function() {
                const inputType = $(this).parent().parent().find("#signPw").attr("type");
                if($(this).parent().parent().find("#signPw").val() != "") {
                    if(inputType == 'password'){
                        $(this).parent().parent().find("#signPw").attr("type", "text");
                    } else {
                        $(this).parent().parent().find("#signPw").attr("type", "password");
                    }
                }
            })
        })


    </script>
</div>
</body>
</html>
