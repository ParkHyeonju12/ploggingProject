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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class StoryWriteServlet
 */
@WebServlet(name = "StoryWrite", urlPatterns = { "/storyWrite.do" })
public class StoryWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoryWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2.값추출
		String root = getServletContext().getRealPath("/");
		String saveDirectory= root +"upload/story";
		//최대용량 설정
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		//값추출
		String storyContent = mRequest.getParameter("storyContent");
		int storyWriter= Integer.parseInt(mRequest.getParameter("storyWriter"));
		String photoPath = mRequest.getFilesystemName("upfile");
		Story s = new Story();
		s.setStoryContent(storyContent);
		s.setStoryWriter(storyWriter);
		s.setPhotoPath(photoPath);
		//비즈니스로직
		StoryService service = new StoryService();
		int result = service.insertStory(s);
		
		//게시글 업로드 후 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			//업로드 성공
			request.setAttribute("title", "업로드 성공!");
			request.setAttribute("msg", "스토리가 등록되었습니다.");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/storyList.do?reqPage=1");
		}else {
			request.setAttribute("title", "업로드 실패!");
			request.setAttribute("msg", "사진 or 스토리를 업로드했는지 확인해주세요:)");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/storyWriteFrm.do");
		}
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
