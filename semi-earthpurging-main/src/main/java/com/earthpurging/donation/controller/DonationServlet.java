package com.earthpurging.donation.controller;

import com.earthpurging.donation.model.service.DonationService;
import com.earthpurging.donation.model.vo.Donation;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Donation", urlPatterns = {"/donation.do"})
public class DonationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonationServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        Donation d = new Donation();

        int memberNo = Integer.parseInt(request.getParameter("memberNo"));
        //System.out.println(memberNo);

        d.setDonationAmount(Integer.parseInt(request.getParameter("donationAmount")));
        d.setDonationName(request.getParameter("donaName"));
        d.setDonationBirth(request.getParameter("donaBirth"));
        d.setDonationPhone(request.getParameter("donaPhone"));
        d.setDonationEmail(request.getParameter("donaEmail"));

        DonationService service = new DonationService();
        int result = service.insertDonation(d, memberNo);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
        if(result>0) {
            request.setAttribute("title", "후원완료");
            request.setAttribute("msg", "감사합니다");
            request.setAttribute("icon", "success");
        } else {
            request.setAttribute("title", "후원실패");
            request.setAttribute("msg", "관리자에게 문의하세요");
            request.setAttribute("icon", "error");
        }
        request.setAttribute("loc", "/mainPage.do");
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