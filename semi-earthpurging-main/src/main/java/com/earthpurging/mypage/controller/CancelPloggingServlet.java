package com.earthpurging.mypage.controller;

import com.earthpurging.mypage.model.service.MypageService;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CancelPlogging", urlPatterns = {"/cancelPlogging.do"})
public class CancelPloggingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelPloggingServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");

        int crewNo = Integer.parseInt(request.getParameter("crewNo"));

        MypageService service = new MypageService();
        int result = service.cancelCrew(crewNo);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
        if(result>0) {
            request.setAttribute("title", "취소완료");
            request.setAttribute("msg", "플로깅신청이 취소되었습니다.");
            request.setAttribute("icon", "success");
        } else {
            request.setAttribute("title", "취소실패");
            request.setAttribute("msg", "관리자에게 문의하세요");
            request.setAttribute("icon", "error");
        }
        request.setAttribute("loc", "/mypagePloggingList.do");
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