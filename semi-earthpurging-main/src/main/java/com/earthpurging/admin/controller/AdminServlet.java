package com.earthpurging.admin.controller;

import com.earthpurging.chellenge.model.service.ChellengeService;
import com.earthpurging.chellenge.model.vo.ChallengeSumData;
import com.earthpurging.donation.model.service.DonationService;
import com.earthpurging.notice.model.service.NoticeService;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Admin", urlPatterns = {"/admin.do"})
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        ChellengeService challengeService = new ChellengeService();
        NoticeService noticeService = new NoticeService();

        ChallengeSumData csd = challengeService.selectSumChallenge();
        int waitingCnt = noticeService.selectAnswerWaitingCount();
        DonationService donaService = new DonationService();
        int donationTotal = donaService.getTotalDonation();
        if(csd != null) {
            request.setAttribute("csd", csd);
        }
        request.setAttribute("waitingCnt", waitingCnt);
        request.setAttribute("donationTotal", donationTotal);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/admin.jsp");
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