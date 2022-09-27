package com.earthpurging.notice.controller;

import java.io.File;
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
 * Servlet implementation class InquiryDeleteServlet
 */
@WebServlet(name = "InquiryDelete", urlPatterns = { "/inquiryDelete.do" })
public class InquiryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryDeleteServlet() {
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
		Inquiry inq = service.deleteInquiry(inquiryNo);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(inq != null) {
			if(inq.getInquiry_filepath() != null) {
				String root = getServletContext().getRealPath("/");
				String deleteFile = root+"upload/inquiry/"+inq.getInquiry_filepath();
				File delFile = new File(deleteFile);
				delFile.delete();
			}
			request.setAttribute("title", "삭제완료");
			request.setAttribute("msg", "삭제가 완료되었습니다.");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/inquiryList.do?reqPage=1");
		}else {
			request.setAttribute("title", "삭제실패");
			request.setAttribute("msg", "관리자에게 문의하세요.");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/inquiryView.do?inquiryNo="+inquiryNo);
		}
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
