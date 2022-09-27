package com.earthpurging.mypage.controller;

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

@WebServlet(name = "Mypage", urlPatterns = {"/mypage.do"})
public class MypageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        Member m = (Member) session.getAttribute("m");

        MypageService service = new MypageService();
        int[] inquiryCntarr = new int[2];
        inquiryCntarr = service.selectInquiryCnt(m.getMemberName(), m.getMemberEmail());
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp");

        request.setAttribute("inquiryWaiting", inquiryCntarr[0]);
        request.setAttribute("inquiryComplete", inquiryCntarr[1]);

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