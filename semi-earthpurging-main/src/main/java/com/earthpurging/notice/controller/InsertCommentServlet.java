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
 * Servlet implementation class InsertCommentServlet
 */
@WebServlet(name = "InsertComment", urlPatterns = { "/insertComment.do" })
public class InsertCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		InquiryComment ic = new InquiryComment();
		
		ic.setIcWriter(request.getParameter("icWriter"));
		ic.setInquiryRef(Integer.parseInt(request.getParameter("inquiryRef")));
		ic.setIcContent(request.getParameter("icContent"));
		
		int inquiryRef = Integer.parseInt(request.getParameter("inquiryRef"));
		
		NoticeService service = new NoticeService();
		int result = service.insertInquiryComment(ic);
		int result1 = service.updateIsAnswer(inquiryRef);
		
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
		if(result>0) {
	           request.setAttribute("title", "성공");
	           request.setAttribute("msg", "댓글이 등록되었습니다");
	           request.setAttribute("icon", "success");
	        }else {
	           request.setAttribute("title", "실패");
	           request.setAttribute("msg", "등록 중 문제가 발생하였습니다");
	           request.setAttribute("icon", "error");
	        }
		request.setAttribute("loc", "/inquiryView.do?inquiryNo="+ic.getInquiryRef());
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
