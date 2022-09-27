package com.earthpurging.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.tools.JavaFileManager.Location;

import com.earthpurging.index.model.service.IndexService;
import com.earthpurging.index.model.vo.ChellengeMemberData;
import com.earthpurging.member.model.service.MemberService;
import com.earthpurging.member.model.vo.Member;

/**
 * Servlet implementation class SigninServlet
 */
@WebServlet(name = "Signin", urlPatterns = { "/signin.do" })
public class SigninServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SigninServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memberId = request.getParameter("signId");
		String memberPw = request.getParameter("signPw");
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		
		MemberService service = new MemberService();
		Member m = service.selectOneMember(member);
		
		
		
		IndexService Cservice = new IndexService();
		ChellengeMemberData cmd = Cservice.selectOneMember(member);
		
		
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(m != null) {
			request.setAttribute("title", "로그인 성공");
			request.setAttribute("msg", "환영합니다!");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/mainPage.do");

			HttpSession session = request.getSession();
			session.setAttribute("m", m);
			session.setAttribute("cmd", cmd);
		}else {
			//로그인 실패한 경우 -> 실패메세지 alert 후 메인페이지로 이동
			request.setAttribute("title", "로그인 실패");
			request.setAttribute("msg", "아이디 또는 비밀번호를 확인하세요!");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/");
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
