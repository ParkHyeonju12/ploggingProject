package com.earthpurging.member.controller;

import com.earthpurging.chellenge.model.service.ChellengeService;
import com.earthpurging.member.model.service.MemberService;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AjaxUpdateMemberPoint", urlPatterns = {"/ajaxUpdateMemberPoint.do"})
public class AjaxUpdateMemberPointServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUpdateMemberPointServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setCharacterEncoding("utf-8");
        int questNo = Integer.parseInt(request.getParameter("questNo"));

        ChellengeService clgService = new ChellengeService();
        int result = clgService.updateChallengePermission(questNo);

        //RequestDispatcher view = request.getRequestDispatcher("/adminChallenge.do?reqPage=1");
        //PrintWriter out = response.getWriter();
        if(result>0) {
            MemberService mService = new MemberService();
            result = mService.updateMemberTotalPoint(questNo);
        }

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