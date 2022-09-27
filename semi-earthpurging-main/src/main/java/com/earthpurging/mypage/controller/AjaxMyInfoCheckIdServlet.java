package com.earthpurging.mypage.controller;

import com.earthpurging.member.model.service.MemberService;
import com.earthpurging.member.model.vo.Member;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AjaxMyInfoCheckId", urlPatterns = {"/ajaxMyInfoCheckId.do"})
public class AjaxMyInfoCheckIdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMyInfoCheckIdServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String memberId = request.getParameter("memberId");

        MemberService service = new MemberService();
        Member m = service.selectOneMember(memberId);
        PrintWriter out = response.getWriter();
        if(m!=null) {
            out.print(1);
        }else {
            out.print(0);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}