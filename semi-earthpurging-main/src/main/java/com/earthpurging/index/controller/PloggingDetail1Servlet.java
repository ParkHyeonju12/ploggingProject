package com.earthpurging.index.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.earthpurging.index.model.service.IndexService;
import com.earthpurging.index.model.vo.Plogging;

/**
 * Servlet implementation class PloggingDetail1Servlet
 */
@WebServlet(name = "ploggingDetail1", urlPatterns = { "/ploggingDetail1.do" })
public class PloggingDetail1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PloggingDetail1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Plogging p = new Plogging();
		p.setMemberNo(Integer.parseInt(request.getParameter("member_no")));
		p.setCrewName(request.getParameter("crew_name"));
		p.setCrewBirth(request.getParameter("crew_birth"));
		p.setCrewPlace(request.getParameter("crew_place"));
		p.setCrewPhone(request.getParameter("crew_phone"));
		p.setCrewEmail(request.getParameter("crew_email")+"@"+request.getParameter("domain-txt"));
		p.setCrewKind(request.getParameter("crew_kind"));
		
		IndexService service = new IndexService();
		int result = service.insertPlogging(p);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
            request.setAttribute("title", "크루 등록 성공");
            request.setAttribute("msg", "환영합니다!");
            request.setAttribute("icon", "success");
        } else {
            request.setAttribute("title", "크루 등록 실패");
            request.setAttribute("msg", "관리자에게 문의하세요");
            request.setAttribute("icon", "error");
        }

        request.setAttribute("loc", "/");
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
