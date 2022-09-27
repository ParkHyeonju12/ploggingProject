package com.earthpurging.admin.controller;

import com.earthpurging.donation.model.service.DonationService;
import com.earthpurging.donation.model.vo.Donation;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminDonation", urlPatterns = {"/adminDonation.do"})
public class AdminDonationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDonationServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        DonationService donaService = new DonationService();
        ArrayList<Donation> list = donaService.selectAllDonation();
        int totalDonation = donaService.getTotalDonation();

        request.setAttribute("list", list);
        request.setAttribute("totalDonation", totalDonation);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/adminDonation.jsp");
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