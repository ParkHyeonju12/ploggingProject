package com.earthpurging.story.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.earthpurging.story.model.service.StoryService;
import com.earthpurging.story.model.vo.Story;

/**
 * Servlet implementation class StoryUpdateFrmServlet
 */
@WebServlet(name = "StoryUpdateFrm", urlPatterns = { "/storyUpdateFrm.do" })
public class StoryUpdateFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoryUpdateFrmServlet() {
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
		int storyNo = Integer.parseInt(request.getParameter("storyNo"));
		//비즈니스로직
		StoryService service = new StoryService();
		Story s = service.getStory(storyNo);
		//결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/story/storyUpdateFrm.jsp");
		request.setAttribute("s", s);
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
