package com.earthpurging.story.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.earthpurging.story.model.service.StoryService;
import com.earthpurging.story.model.vo.Story;
import com.earthpurging.story.model.vo.StoryViewData;
import com.google.gson.Gson;

/**
 * Servlet implementation class StoryViewServlet
 */
@WebServlet(name = "StoryView", urlPatterns = { "/storyView.do" })
public class StoryViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoryViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//값추출
		int storyNo = Integer.parseInt(request.getParameter("storyNo"));
		
		//비즈니스 로직
		StoryService service = new StoryService();
		StoryViewData svd = service.viewStory(storyNo);
		
		//결과처리
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		gson.toJson(svd,out);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
