package com.earthpurging.admin.controller;

import com.earthpurging.member.model.service.MemberService;
import com.earthpurging.member.model.vo.MemberPageData;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminUserList", urlPatterns = {"/adminUserList.do"})
public class AdminUserListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUserListServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");

        int reqPage = Integer.parseInt(request.getParameter("reqPage"));

        MemberService service =  new MemberService();
        MemberPageData mpd = service.selectMemberList(reqPage);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/adminUserList.jsp");

        request.setAttribute("list", mpd.getList());
        request.setAttribute("pageNavi", mpd.getPageNavi());
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