package com.earthpurging.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.earthpurging.notice.model.service.NoticeService;
import com.earthpurging.notice.model.vo.Inquiry;

/**
 * Servlet implementation class InquiryUpdateFrmServlet
 */
@WebServlet(name = "InquiryUpdateFrm", urlPatterns = { "/inquiryUpdateFrm.do" })
public class InquiryUpdateFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryUpdateFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int inquiryNo = Integer.parseInt(request.getParameter("inquiryNo"));
		NoticeService service = new NoticeService();
		Inquiry inq = service.getInquiry(inquiryNo);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/notice/updateInquiryFrm.jsp");
		request.setAttribute("inq", inq);
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
