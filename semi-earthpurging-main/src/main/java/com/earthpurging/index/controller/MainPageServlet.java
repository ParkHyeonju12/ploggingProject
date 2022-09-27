package com.earthpurging.index.controller;

import java.io.Console;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.earthpurging.index.model.service.IndexService;
import com.earthpurging.index.model.vo.ChellengeMemberData;
import com.earthpurging.index.model.vo.ChellengeRank;
import com.earthpurging.index.model.vo.ChellengeRankData;

/**
 * Servlet implementation class MainPageServlet
 */
@WebServlet(name = "mainPage.do", urlPatterns = { "/mainPage.do" })
public class MainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//[1번 로직] 챌린지 1~5등 선정 값 추출 
		IndexService service = new IndexService();
		ChellengeRankData crd = service.selectFiveRank();
		
		//[2번 로직] 지금까지 모인 모든 쓰레기 데이터
		ChellengeMemberData all = service.allTrash();

		//[3번로직] 유저별로 챌린지 등록한...
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/main/mainPage.jsp");
		
		request.setAttribute("all", all);
		request.setAttribute("list", crd.getList());
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
