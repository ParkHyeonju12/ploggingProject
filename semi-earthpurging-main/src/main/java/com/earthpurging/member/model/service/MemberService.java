package com.earthpurging.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.earthpurging.member.model.dao.MemberDao;
import com.earthpurging.member.model.vo.Member;

import com.earthpurging.member.model.vo.MemberPageData;
import com.earthpurging.notice.model.vo.NoticePageData;
import common.JDBCTemplate;

public class MemberService {
	private MemberDao dao;

	public MemberService() {
		super();
		// TODO Auto-generated constructor stub
		dao = new MemberDao();
	}

	public Member selectOneMember(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = dao.selectOneMember(conn, member);
		JDBCTemplate.close(conn);
		return m;
	}

	public Member selectOneMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();

		Member m = dao.selectOneMember(conn, memberId);

		JDBCTemplate.close(conn);

		return m;
	}


	public boolean selectOneMemberWhereNickname(String nickname) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = dao.selectOneMemberWhereNickname(conn, nickname);

		JDBCTemplate.close(conn);

		return result;
	}

	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertMember(conn, m);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}

	public MemberPageData selectMemberList(int reqPage) {

		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 20;

		int end = numPerPage*reqPage;
		int start = end - numPerPage + 1;

		ArrayList<Member> list = dao.selectMemberList(conn, start, end);
		int totalCount = dao.selectMemberCount(conn);

		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage + 1;
		}

		int pageNaviSize = 10;

		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;

		String pageNavi = "<ul class='pagination circle-style'>";
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/adminUserList.do?reqPage=" + (pageNo - 1) + "'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		for(int i=0; i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/adminUserList.do?reqPage=" + pageNo + "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/adminUserList.do?reqPage=" + pageNo + "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/adminUserList.do?reqPage=" + pageNo + "'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		MemberPageData mpd = new MemberPageData(list, pageNavi);

		JDBCTemplate.close(conn);

		return mpd;
	}

	public int deleteMember(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.deleteMember(conn,memberNo);

		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);
		return result;
	}

	public int updateMemberTotalPoint(int questNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateMemberTotalPoint(conn, questNo);

		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}
}
