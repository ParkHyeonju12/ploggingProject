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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class InquiryUpdateServlet
 */
@WebServlet(name = "InquiryUpdate", urlPatterns = { "/inquiryUpdate.do" })
public class InquiryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"upload/notice";
		
		int maxSize = 10*1024*1024;
	
		MultipartRequest mRequest = new MultipartRequest(request, 
														saveDirectory,
														maxSize,
														"UTF-8",
														new DefaultFileRenamePolicy());
		int inquiryNo = Integer.parseInt(mRequest.getParameter("inquiryNo"));
		String inquiryType = mRequest.getParameter("inquiry-type");
		String filepath = mRequest.getParameter("upfile");
		String oldFilepath = mRequest.getParameter("oldFilepath");
		String inquirer = mRequest.getParameter("inquirer");
		String inquiryEmail = mRequest.getParameter("inquiryEmail");
		String inquiryTitle = mRequest.getParameter("inquiryTitle");
		String status = mRequest.getParameter("status");
		String inquiryContent = mRequest.getParameter("inquiryContent");
		if(oldFilepath != null && status.equals("stay")) {
			filepath = oldFilepath;
		}
		
		Inquiry inq = new Inquiry();
		inq.setInquiry_no(inquiryNo);
		inq.setInquirer_email(inquiryEmail);
		inq.setInquiry_title(inquiryTitle);
		inq.setInquiry_writer(inquirer);
		inq.setInquiry_filepath(filepath);
		inq.setInquiry_type(inquiryType);
		inq.setInquiry_content(inquiryContent);
		
		NoticeService service = new NoticeService();
		int result = service.updateInquiry(inq);
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
		if(result>0) {
		     request.setAttribute("title", "변경완료");
		     request.setAttribute("msg", "공지사항이 수정되었습니다");
		     request.setAttribute("icon", "success");
		     if(status.equals("delete")) {
		    	 File delFile = new File(saveDirectory+"/"+oldFilepath);
		    	 delFile.delete();
		     }
		  }else {
		     request.setAttribute("title", "변경실패");
		     request.setAttribute("msg", "관리자에게 문의하세요");
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
