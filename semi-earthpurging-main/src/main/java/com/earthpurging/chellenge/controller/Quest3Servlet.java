package com.earthpurging.chellenge.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.earthpurging.chellenge.model.service.ChellengeService;
import com.earthpurging.chellenge.model.vo.Chellenge;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


/**
 * Servlet implementation class Quest3Servlet
 */
@WebServlet(name = "Quest3", urlPatterns = { "/quest3.do" })
public class Quest3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Quest3Servlet() {
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
		
		//사진 경로
		String root = getServletContext().getRealPath("/");//webapp폴더의 절대경로
		String saveDirectory = root+"upload/chellenge";
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest 
		= new MultipartRequest(request, saveDirectory,maxSize,"UTF-8", new DefaultFileRenamePolicy());
		Chellenge chellenge = new Chellenge();
		chellenge.setPhotopath(mRequest.getFilesystemName("p_file1"));
		chellenge.setPhotopath(mRequest.getFilesystemName("p_file2"));
		chellenge.setQuestDate(mRequest.getParameter("p_start"));
		chellenge.setQuestArea("지역:"+mRequest.getParameter("p_city")+"/상세지역:"+mRequest.getParameter("p_addr")+"/소요시간:"+mRequest.getParameter("p_time"));
		chellenge.setQuestCan(Integer.parseInt(mRequest.getParameter("p_item_1")));
		chellenge.setQuestGlass(Integer.parseInt(mRequest.getParameter("p_item_2")));
		chellenge.setQuestPaper(Integer.parseInt(mRequest.getParameter("p_item_3")));
		chellenge.setQuestPla(Integer.parseInt(mRequest.getParameter("p_item_4")));
		chellenge.setQuestTabacoo(Integer.parseInt(mRequest.getParameter("p_item_5")));
		chellenge.setQuestWrapper(Integer.parseInt(mRequest.getParameter("p_item_6")));
		chellenge.setMemberThink(mRequest.getParameter("p_memo"));
		chellenge.setqMemberNo(Integer.parseInt(mRequest.getParameter("memberNO")));
		//비즈니스로직
		ChellengeService service = new ChellengeService();
		int result = service.insertChellenge(chellenge);
		//결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("title", "성공");
			request.setAttribute("msg", "쓰담 퀘스트 점수 등록 성공!");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "실패");
			request.setAttribute("msg", "쓰담 퀘스트 점수 등록 중 문제가 발생했습니다.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/quest3Frm.do");
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
