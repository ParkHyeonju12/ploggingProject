package com.earthpurging.admin.controller;

import com.earthpurging.chellenge.model.service.ChellengeService;
import com.earthpurging.chellenge.model.vo.ChallengePageData;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminChallenge", urlPatterns = {"/adminChallenge.do"})
public class AdminChallengeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChallengeServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        int reqPage = Integer.parseInt(request.getParameter("reqPage"));

        ChellengeService service = new ChellengeService();
        ChallengePageData cpd = service.selectChallengeList(reqPage);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/adminChallenge.jsp");

        request.setAttribute("list", cpd.getList());
        request.setAttribute("pageNavi", cpd.getPageNavi());

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