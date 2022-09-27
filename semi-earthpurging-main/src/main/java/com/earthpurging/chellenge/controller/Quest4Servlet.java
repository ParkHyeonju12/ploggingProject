package com.earthpurging.chellenge.controller;

import java.io.Console;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.earthpurging.chellenge.model.service.ChellengeService;
import com.earthpurging.chellenge.model.vo.Chellenge;
import com.earthpurging.chellenge.model.vo.ChellengeInfo;
import com.earthpurging.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class Quest4Servlet
 */
@WebServlet(name = "Quest4", urlPatterns = { "/quest4.do" })
public class Quest4Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Quest4Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
				request.setCharacterEncoding("utf-8");
				//값추출
				ChellengeInfo ci= new ChellengeInfo();
				ci.setChellengeName(request.getParameter("p_name"));
				ci.setChellengePhone(request.getParameter("p_tel"));
				ci.setChellengeEmail(request.getParameter("p_email"));
				ci.setChellengeAddr(request.getParameter("p_addr2"));
				ci.setiMemberNO(Integer.parseInt(request.getParameter("memberNO")));
				System.out.println("1");
				//비즈니스로직
				ChellengeService service = new ChellengeService();
				int result = service.insertChellengeInfo(ci);
				System.out.println("2");
				//결과처리
				System.out.println("3");
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				if(result>0) {
					request.setAttribute("title", "성공");
					request.setAttribute("msg", "쓰담인 정보입력 성공!");
					request.setAttribute("icon", "success");
					System.out.println("4");
				}else {
					request.setAttribute("title", "실패");
					request.setAttribute("msg", "쓰담인 정보입력 중 발생했습니다.");
					request.setAttribute("icon", "error");
					System.out.println("5");
				}
				System.out.println("6");
				request.setAttribute("loc", "/chellengeFrm.do");
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
