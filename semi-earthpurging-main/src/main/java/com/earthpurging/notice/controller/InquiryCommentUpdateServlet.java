package com.earthpurging.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.earthpurging.notice.model.service.NoticeService;
import com.earthpurging.notice.model.vo.InquiryComment;

/**
 * Servlet implementation class InquiryCommentUpdateServlet
 */
@WebServlet(name = "InquiryCommentUpdate", urlPatterns = { "/inquiryCommentUpdate.do" })
public class InquiryCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int icNo = Integer.parseInt(request.getParameter("icNo"));
		int inquiryNo = Integer.parseInt(request.getParameter("inquiryNo"));
		String icContent = request.getParameter("icContent");
		InquiryComment ic = new InquiryComment();
		ic.setIcNo(icNo);
		ic.setIcContent(icContent);
		NoticeService service =  new NoticeService();
		int result = service.updateInquiryComment(ic);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("title", "성공");
			request.setAttribute("msg", "댓글이 수정되었습니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "실패");
			request.setAttribute("msg", "댓글수정 실패");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/inquiryView.do?inquiryNo="+inquiryNo);
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
