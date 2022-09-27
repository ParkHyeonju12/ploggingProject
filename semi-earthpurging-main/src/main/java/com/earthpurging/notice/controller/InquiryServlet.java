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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class InquiryServlet
 */
@WebServlet(name = "Inquiry", urlPatterns = { "/inquiry.do" })
public class InquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"upload/inquiry";
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String inquiryType = mRequest.getParameter("inquiry-type");
		String inquirer = mRequest.getParameter("inquirer");
		String inquirerEmail = mRequest.getParameter("inquirerEmail");
		String inquiryTiltle = mRequest.getParameter("inquiryTitle");
		String inquiryContent = mRequest.getParameter("inquiryContent");
		String inquiryFilepath = mRequest.getParameter("upfile");
		Inquiry inq = new Inquiry();
		inq.setInquiry_type(inquiryType);
		inq.setInquiry_writer(inquirer);
		inq.setInquirer_email(inquirerEmail);
		inq.setInquiry_title(inquiryTiltle);
		inq.setInquiry_content(inquiryContent);
		inq.setInquiry_filepath(inquiryFilepath);
		NoticeService service = new NoticeService();
		int result = service.insertInquiry(inq);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("title", "성공");
			request.setAttribute("msg", "문의사항이 등록되었습니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "실패");
			request.setAttribute("msg", "문의사항 등록 중 문제가 발생했습니다.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/inquiryList.do?reqPage=1");
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
