package com.earthpurging.mypage.controller;

import com.earthpurging.donation.model.service.DonationService;
import com.earthpurging.donation.model.vo.Donation;
import com.earthpurging.member.model.vo.Member;
import com.earthpurging.mypage.model.service.MypageService;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MypageDonationList", urlPatterns = {"/mypageDonationList.do"})
public class MypageDonationListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageDonationListServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
//        HttpSession session = request.getSession();
//        Member m = (Member) session.getAttribute("m");
//        int memberNo = m.getMemberNo();

        DonationService service = new DonationService();
        ArrayList<Donation> list = service.selectAllDonation();


		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/mypage/mypageDonationList.jsp");

        request.setAttribute("list", list);

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