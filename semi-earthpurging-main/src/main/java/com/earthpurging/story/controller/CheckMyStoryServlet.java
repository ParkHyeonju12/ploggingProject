package com.earthpurging.story.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.earthpurging.story.model.service.StoryService;
import com.earthpurging.story.model.vo.StoryPageData;

/**
 * Servlet implementation class CheckMyStoryServlet
 */
@WebServlet(name = "CheckMyStory", urlPatterns = { "/checkMyStory.do" })
public class CheckMyStoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckMyStoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		//2. 값추출
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		//3. 비즈니스로직
		StoryService service = new StoryService();
		StoryPageData spd = service.selectMyStoryList(reqPage,memberNo);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/story/checkMyStory.jsp");
		request.setAttribute("list", spd.getList());
		request.setAttribute("pageNavi",spd.getPageNavi());
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
