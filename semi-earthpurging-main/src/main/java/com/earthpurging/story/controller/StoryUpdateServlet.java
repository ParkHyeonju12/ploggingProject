package com.earthpurging.story.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.earthpurging.story.model.service.StoryService;
import com.earthpurging.story.model.vo.Story;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class StoryUpdateServlet
 */
@WebServlet(name = "StoryUpdate", urlPatterns = { "/storyUpdate.do" })
public class StoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoryUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//값추출
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"upload/story";
		//파일최대크기 지정
		int maxSize = 10*1024*1024; //10메가
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		int storyNo = Integer.parseInt(mRequest.getParameter("storyNo"));
		String storyContent = mRequest.getParameter("storyContent");
		//기존파일이 지워졌으면 delete, 그외 모두 stay
		String status = mRequest.getParameter("status");
		//새 첨부파일 있으면 새 첨부파일값, 없으면 null;
		String photopath = mRequest.getFilesystemName("upfile");
		//기존첨부파일이 있었으면 기존 첨부파일값, 없었으면 null 리턴
		String oldPhotopath = mRequest.getParameter("oldPhotopath");
		
		if(oldPhotopath != null &&status.equals("stay")) {
			photopath = oldPhotopath;
		}
		Story s = new Story();
		s.setStoryNo(storyNo);
		s.setStoryContent(storyContent);
		s.setPhotoPath(photopath);
		
		//비즈니스 로직
		StoryService service = new StoryService();
		int result = service.updateStory(s);
		
		//결과 처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("title", "수정완료");
			request.setAttribute("msg", "스토리 수정 완료");
			request.setAttribute("icon", "success");
			
			if(status.equals("delete")) {
				File delFile = new File(saveDirectory+"/"+oldPhotopath);
				delFile.delete();
			}
			
		}else {
			request.setAttribute("title", "수정실패");
			request.setAttribute("msg", "스토리 수정 실패");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/storyList.do?reqPage=1");
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
