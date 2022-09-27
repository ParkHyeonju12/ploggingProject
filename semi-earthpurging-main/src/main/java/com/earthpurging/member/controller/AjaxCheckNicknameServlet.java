package com.earthpurging.member.controller;

import com.earthpurging.member.model.service.MemberService;
import com.earthpurging.member.model.vo.Member;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AjaxCheckNickname", urlPatterns = {"/ajaxCheckNickname.do"})
public class AjaxCheckNicknameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCheckNicknameServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");

        String nickname = request.getParameter("nickname");

        MemberService service = new MemberService();
        boolean result = service.selectOneMemberWhereNickname(nickname);

        PrintWriter out = response.getWriter();

        out.print(result);

    }



    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}