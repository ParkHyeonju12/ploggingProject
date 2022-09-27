package com.earthpurging.mypage.controller;

import com.earthpurging.member.model.service.MemberService;
import com.earthpurging.member.model.vo.Member;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Signup", urlPatterns = {"/signup.do"})
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");

        Member m = new Member();
        m.setMemberId(request.getParameter("memberId"));
        m.setMemberPw(request.getParameter("memberPw"));
        m.setMemberName(request.getParameter("memberName"));
        m.setMemberPhone(request.getParameter("memberPhone"));
        m.setMemberAddr(request.getParameter("memberAddr"));
        m.setMemberEmail(request.getParameter("memberEmail"));
        m.setMemberBirth(request.getParameter("memberBirth"));
        m.setNickname(request.getParameter("memberNickname"));
        m.setMemberIntro(request.getParameter("memberIntro"));

        MemberService service = new MemberService();
        int result = service.insertMember(m);


        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");

        if(result>0) {
            request.setAttribute("title", "회원가입성공");
            request.setAttribute("msg", "환영합니다!");
            request.setAttribute("icon", "success");
        } else {
            request.setAttribute("title", "회원가입실패");
            request.setAttribute("msg", "관리자에게 문의하세요");
            request.setAttribute("icon", "error");
        }

        request.setAttribute("loc", "/");
        view.forward(request, response);

    }


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}