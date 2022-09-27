package com.earthpurging.chellenge.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.earthpurging.chellenge.model.vo.Chellenge;

/**
 * Servlet implementation class Quest2Servlet
 */
@WebServlet(name = "Quest2Frm", urlPatterns = { "/quest2Frm.do" })
public class Quest2FrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Quest2FrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
		request.setCharacterEncoding("utf-8");
		//값추출 (값 주고)
		String cityName = request.getParameter("city");
		//비즈니스로직
		//결과처리
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/chellenge/quest2.jsp");
		request.setAttribute("cityName", cityName);
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
