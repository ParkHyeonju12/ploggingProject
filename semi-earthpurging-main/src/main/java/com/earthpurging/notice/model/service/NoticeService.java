package com.earthpurging.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

//import org.apache.tomcat.util.bcel.classfile.JavaClass;

import com.earthpurging.notice.model.dao.NoticeDao;
import com.earthpurging.notice.model.vo.Inquiry;
import com.earthpurging.notice.model.vo.InquiryComment;
import com.earthpurging.notice.model.vo.InquiryPageData;
import com.earthpurging.notice.model.vo.InquiryViewData;
import com.earthpurging.notice.model.vo.Notice;
import com.earthpurging.notice.model.vo.NoticePageData;

import common.JDBCTemplate;

public class NoticeService {
	private NoticeDao dao;
	
	

	public NoticeService() {
		super();
		dao = new NoticeDao();
	}


	public int insertNotice(Notice n) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertNotice(conn, n);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


	public NoticePageData selectNoticeList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int end = numPerPage*reqPage;
		int start = end - numPerPage + 1;
		ArrayList<Notice> list = dao.selectNoticeList(conn,start,end);
		
		int totalCount = dao.selectNoticeList(conn);
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		//페이지 네비게이션 제작 시작
		String pageNavi = "<ul class='pagination circle-style'>";
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/noticeList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/noticeList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/noticeList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/noticeList.do?reqPage="+pageNo+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		NoticePageData npd = new NoticePageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return npd;
	}


	public InquiryPageData selectInquiryList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int end = numPerPage*reqPage;
		int start = end - numPerPage + 1;
		ArrayList<Inquiry> list = dao.selectInquiryList(conn,end,start);
		
		int totalCount = dao.selectInquiryCount(conn);
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		//지정해줘야할 값 페이지 네비게이션 사이즈
		int pageNaviSize = 5;
		
		//페이지 네비게이션 시작번호 지정
		//reqPage 1 ~ 5 -> 1 2 3 4 5
		//reqPage 6 ~ 10 -> 6 7 8 9 10
		//reqPage 11 ~ 15 -> 11 12 13 14 15
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		//페이지 네비게이션 제작 시작
		String pageNavi = "<ul class='pagination circle-style'>";
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/inquiryList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/inquiryList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/inquiryList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/inquiryList.do?reqPage="+pageNo+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		InquiryPageData ipd = new InquiryPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return ipd;
	}


	public Notice selectOneNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateReadCount(conn,noticeNo);
		Notice n = null;
		if(result > 0) {
			JDBCTemplate.commit(conn);
			n = dao.selectOneNotice(conn, noticeNo);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return n;
		
	}


	public Notice getNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Notice n = dao.selectOneNotice(conn, noticeNo);
		JDBCTemplate.close(conn);
		return n;
	}


	public Notice deleteNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Notice n = dao.selectOneNotice(conn, noticeNo);
		int result = dao.deleteNotice(conn, noticeNo);
		JDBCTemplate.close(conn);
		return n;
	}


	public int updateNotice(Notice n) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateNotice(conn, n);
		JDBCTemplate.close(conn);
		return result;
	}


	public InquiryViewData selectOneInquiry(int inquiryNo) {
		Connection conn = JDBCTemplate.getConnection();
		Inquiry inq = dao.selectOneInquiry(conn, inquiryNo);
		
		ArrayList<InquiryComment> commentList = dao.selectInquiryCommentList(conn, inquiryNo);
		System.out.println(commentList);
		InquiryViewData ivd = new InquiryViewData(inq, commentList);
		JDBCTemplate.close(conn);
		
		return ivd;
	}


	public Inquiry deleteInquiry(int inquiryNo) {
		Connection conn = JDBCTemplate.getConnection();
		Inquiry inq = dao.selectOneInquiry(conn, inquiryNo);
		int result = dao.deleteInquiry(conn, inquiryNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			inq = null;
		}
		JDBCTemplate.close(conn);
		return inq;
	}


	public Inquiry getInquiry(int inquiryNo) {
		Connection conn = JDBCTemplate.getConnection();
		Inquiry inq = dao.selectOneInquiry(conn, inquiryNo);
		JDBCTemplate.close(conn);
		return inq;
	}


	public int insertInquiry(Inquiry inq) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertInquiry(conn, inq);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


	public int updateInquiry(Inquiry inq) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateInquiry(conn, inq);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


	public int insertInquiryComment(InquiryComment ic) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertInquiryComment(conn, ic);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


	public int updateInquiryComment(InquiryComment ic) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateInquiryComment(conn, ic);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


	public int deleteInquiryComment(int icNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.deleteInquiryComment(conn, icNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


	public int updateIsAnswer(int inquiryRef) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateIsAnswer(conn, inquiryRef);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


	public int updateIsAnswer2(int inquiryNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateIsAnswer2(conn, inquiryNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int selectAnswerWaitingCount() {
		Connection conn = JDBCTemplate.getConnection();
		int waitingCnt = dao.selectAnswerWaitingCount(conn);

		JDBCTemplate.close(conn);

		return waitingCnt;
	}



}
