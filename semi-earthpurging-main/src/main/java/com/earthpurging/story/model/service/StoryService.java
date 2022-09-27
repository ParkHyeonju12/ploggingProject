package com.earthpurging.story.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

//import org.apache.catalina.startup.ConnectorCreateRule;

import com.earthpurging.story.model.vo.Story;
import com.earthpurging.story.model.vo.StoryComment;
import com.earthpurging.story.model.vo.StoryPageData;
import com.earthpurging.story.model.vo.StoryViewData;

import common.JDBCTemplate;
import com.earthpurging.story.model.dao.StoryDao;

public class StoryService {
	private StoryDao dao;

	public StoryService() {
		super();
		dao = new StoryDao();
		// TODO Auto-generated constructor stub
	}

	public StoryPageData selectStoryList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		
		int numPerPage = 9;
		
		int end = numPerPage*reqPage; // 마지막에 들어갈 숫자
		int start = end - numPerPage + 1;
		ArrayList<Story> list = dao.selectStoryList(conn,start,end);
		for(Story s : list) {
			System.out.println(s.getNickname());
		}
		
		//페이징 처리
		//전체페이지 수 계산 -> 전체 게시물 수 조회
		int totalCount = dao.selectStoryCount(conn);
		//전체페이지
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
		//나머지가 0이면 나눈 값 그대로 페이지 수 적용 ex) 90 page --> 9페이지(게시글 10개 기준) 
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
					
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		//페이지 네비게이션 제작 시작
		String pageNavi ="<ul class='pagination circle-style'>"; //circle-style:을 붙이면 동그란스타일로 디자인(생략하면 스퀘어 타입)
				//이전버튼
				if(pageNo != 1) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/storyList.do?reqPage="+(pageNo-1)+"'>"; 
					pageNavi += "<span class='material-icons'>chevron_left</span>"; //chevron_left(이전버튼기호)
					pageNavi += "</a></li>";
				}
				//페이지 숫자
				for(int i=0;i<pageNaviSize;i++) {
					//페이지 숫자를 색칠할지 말지
					if(pageNo == reqPage) {
						//유저가 선택한 페이지 넘버
						pageNavi += "<li>";
						pageNavi += "<a class='page-item active-page' href='/storyList.do?reqPage="+pageNo+"'>"; 
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					}else {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item' href='/storyList.do?reqPage="+pageNo+"'>"; 
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					}
					pageNo++;
					if(pageNo > totalPage) {
						break;
					}
				}
				//다음버튼
				//->마지막 페이지 출력 후에는 다음버튼이 필요하지 않음
				if(pageNo<=totalPage) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/storyList.do?reqPage="+pageNo+"'>"; 
					pageNavi += "<span class='material-icons'>chevron_right</span>"; //chevron_right(다음버튼기호)
					pageNavi += "</a></li>";
				}
				pageNavi += "</ul>";
				StoryPageData npd = new StoryPageData(list, pageNavi);
				JDBCTemplate.close(conn);
				//NoticeService에서 list, pageNavi 총 2개의 타입을 전송하기 위해 따로 객체 생성 후 전송(자바는 1개의 객체로만 받을 수 있기 때문에) --> NoticePageData
				//처음에 생성했던 ArrayList<Notice>로 만들었던 메소드 타입을 새로 생성해둔 NoticePageData로 재수정 후 전송(Servlet도 같이 수정해야함)
				return npd;
	}
	
	//스토리 업로드(insert)
	public int insertStory(Story s) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertStory(conn,s);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	//select
	public Story getStory(int storyNo) {
		Connection conn = JDBCTemplate.getConnection();
		Story s = dao.selectOneStory(conn,storyNo);
		JDBCTemplate.close(conn);
		return s;
	}

	public int updateStory(Story s) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateStory(conn, s);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	public Story deleteStory(int storyNo) {
		Connection conn = JDBCTemplate.getConnection();
		Story s = dao.selectOneStory(conn, storyNo);
		int result = dao.deleteStory(conn, storyNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			s = null; //구분을 위해
		}
		JDBCTemplate.close(conn);

		return s;
	}

	public StoryViewData viewStory(int storyNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateReadCount(conn,storyNo);
		
		if(result>0) {
			//조회수 업데이트 성공
			JDBCTemplate.commit(conn);
			Story s = dao.selectOneStory(conn,storyNo);
			//댓글도 조회
			ArrayList<StoryComment> commentList = dao.selectStoryCommentList(conn,storyNo);
			StoryViewData svd = new StoryViewData(s,commentList);
			JDBCTemplate.close(conn);
			return svd;
		}else {
			JDBCTemplate.rollback(conn);
			JDBCTemplate.close(conn);
			return null;
		}
		
	}
	

	public ArrayList<StoryComment> insertStoryComment(StoryComment sc) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.insertStoryComment(conn,sc);
		ArrayList<StoryComment> commentList = null;
		if(result>0){
			commentList = dao.selectStoryCommentList(conn,sc.getStoryRef());
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return commentList;
	}

	public StoryPageData selectMyStoryList(int reqPage, int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int numPerPage = 9;
		
		int end = numPerPage*reqPage; // 마지막에 들어갈 숫자
		int start = end - numPerPage + 1;
		ArrayList<Story> list = dao.selectMyStoryList(conn,start,end, memberNo);
		for(Story s : list) {
			System.out.println(s.getNickname());
		}
		
		//페이징 처리
		//전체페이지 수 계산 -> 전체 게시물 수 조회
		int totalCount = dao.selectMyStoryCount(conn, memberNo);
		//전체페이지
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
		//나머지가 0이면 나눈 값 그대로 페이지 수 적용 ex) 90 page --> 9페이지(게시글 10개 기준) 
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
					
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		//페이지 네비게이션 제작 시작
		String pageNavi ="<ul class='pagination circle-style'>"; //circle-style:을 붙이면 동그란스타일로 디자인(생략하면 스퀘어 타입)
				//이전버튼
				if(pageNo != 1) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/storyList.do?reqPage="+(pageNo-1)+"'>"; 
					pageNavi += "<span class='material-icons'>chevron_left</span>"; //chevron_left(이전버튼기호)
					pageNavi += "</a></li>";
				}
				//페이지 숫자
				for(int i=0;i<pageNaviSize;i++) {
					//페이지 숫자를 색칠할지 말지
					if(pageNo == reqPage) {
						//유저가 선택한 페이지 넘버
						pageNavi += "<li>";
						pageNavi += "<a class='page-item active-page' href='/storyList.do?reqPage="+pageNo+"'>"; 
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					}else {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item' href='/storyList.do?reqPage="+pageNo+"'>"; 
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					}
					pageNo++;
					if(pageNo > totalPage) {
						break;
					}
				}
				//다음버튼
				//->마지막 페이지 출력 후에는 다음버튼이 필요하지 않음
				if(pageNo<=totalPage) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/storyList.do?reqPage="+pageNo+"'>"; 
					pageNavi += "<span class='material-icons'>chevron_right</span>"; //chevron_right(다음버튼기호)
					pageNavi += "</a></li>";
				}
				pageNavi += "</ul>";
				StoryPageData spd = new StoryPageData(list, pageNavi);
				JDBCTemplate.close(conn);
				//NoticeService에서 list, pageNavi 총 2개의 타입을 전송하기 위해 따로 객체 생성 후 전송(자바는 1개의 객체로만 받을 수 있기 때문에) --> NoticePageData
				//처음에 생성했던 ArrayList<Notice>로 만들었던 메소드 타입을 새로 생성해둔 NoticePageData로 재수정 후 전송(Servlet도 같이 수정해야함)
				return spd;
	}

	
	
	
}
