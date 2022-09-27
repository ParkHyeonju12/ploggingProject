package com.earthpurging.story.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.earthpurging.story.model.service.StoryService;
import com.earthpurging.story.model.vo.StoryComment;
import com.google.gson.Gson;

/**
 * Servlet implementation class InsertStCommentServlet
 */
@WebServlet(name = "InsertStComment", urlPatterns = { "/insertStComment.do" })
public class InsertStCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertStCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 
		request.setCharacterEncoding("utf-8");
		//값추출
		StoryComment sc = new StoryComment();
		sc.setStoryRef(Integer.parseInt(request.getParameter("storyRef")));
		sc.setScRef(Integer.parseInt(request.getParameter("scRef")));
		sc.setScWriter(Integer.parseInt(request.getParameter("scWriter")));
		sc.setScContent(request.getParameter("scContent"));
		//비즈니스로직
		StoryService service = new StoryService();
		ArrayList<StoryComment> commentList = service.insertStoryComment(sc);
		//결과처리
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		gson.toJson(commentList,out);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
