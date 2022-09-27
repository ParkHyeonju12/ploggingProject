package com.earthpurging.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.earthpurging.notice.model.service.NoticeService;
import com.earthpurging.notice.model.vo.Inquiry;

/**
 * Servlet implementation class InquiryfileDownServlet
 */
@WebServlet(name = "InquiryfileDown", urlPatterns = { "/inquiryfileDown.do" })
public class InquiryfileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryfileDownServlet() {
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
		
		String root = getServletContext().getRealPath("/");
		String downFile = root+"upload/notice/"+inq.getInquiry_filepath();
		
		FileInputStream fis = new FileInputStream(downFile);
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		String resFilename = new String(inq.getInquiry_filepath().getBytes("UTF-8"),"ISO-8859-1");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+resFilename);
		while(true) {
			int read = bis.read();
			if(read != -1) {
				bos.write(read);
			}else {
				break;
			}
		}
		bos.close();
		bis.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
