package com.earthpurging.mypage.controller;

import com.earthpurging.member.model.service.MemberService;
import com.earthpurging.member.model.vo.Member;
import com.earthpurging.mypage.model.service.MypageService;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UpdateMyInfo", urlPatterns = {"/updateMyInfo.do"})
public class UpdateMyInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMyInfoServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        Member m = new Member();
        String memberId = request.getParameter("memberId");
        String beforeMemberId = request.getParameter("beforeMemberId");
        m.setMemberId(memberId);
        m.setMemberPw(request.getParameter("memberPw"));
        m.setMemberName(request.getParameter("memberName"));
        m.setNickname(request.getParameter("memberNickname"));
        m.setMemberEmail(request.getParameter("memberEmail"));
        m.setMemberAddr(request.getParameter("memberAddr"));

        MypageService service = new MypageService();
        int result = service.updateMyInfo(m, beforeMemberId);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");

        if(result>0){
            MemberService memberService = new MemberService();
            Member member = memberService.selectOneMember(memberId);

            if(member!=null) {
                HttpSession session = request.getSession();
                session.setAttribute("m", member);
            }

            request.setAttribute("title", "수정완료");
            request.setAttribute("msg", "회원정보가 수정되었습니다.");
            request.setAttribute("icon", "success");
        }else {
            request.setAttribute("title", "수정실패");
            request.setAttribute("msg", "관리자에게 문의하세요");
            request.setAttribute("icon", "warning");
        }
        request.setAttribute("loc", "/mypageInfo.do");
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