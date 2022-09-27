package com.earthpurging.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.earthpurging.notice.model.service.NoticeService;

/**
 * Servlet implementation class DeleteInquiryCommentServlet
 */
@WebServlet(name = "DeleteInquiryComment", urlPatterns = { "/deleteInquiryComment.do" })
public class DeleteInquiryCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteInquiryCommentServlet() {
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
		NoticeService service = new NoticeService();
		int result = service.deleteInquiryComment(icNo);
		int result1 = service.updateIsAnswer2(inquiryNo);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("title", "삭제 성공");
			request.setAttribute("msg", "댓글이 삭제되었습니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "삭제 실패");
			request.setAttribute("msg", "삭제를 실패하였습니다.");
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
