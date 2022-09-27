package com.earthpurging.chellenge.model.service;

import java.net.ConnectException;
import java.sql.Connection;
import java.util.ArrayList;

import com.earthpurging.chellenge.model.dao.ChellengeDao;
import com.earthpurging.chellenge.model.vo.ChallengePageData;
import com.earthpurging.chellenge.model.vo.ChallengeSumData;
import com.earthpurging.chellenge.model.vo.Chellenge;
import com.earthpurging.chellenge.model.vo.ChellengeInfo;

import common.JDBCTemplate;

public class ChellengeService {
	private ChellengeDao dao;

	public ChellengeService() {
		super();
		dao = new ChellengeDao();
		// TODO Auto-generated constructor stub
	}

	public int insertChellenge(Chellenge chellenge) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertChellenge(conn,chellenge);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertChellengeInfo(ChellengeInfo ci) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertChellenge(conn,ci);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ChallengeSumData selectSumChallenge() {

		Connection conn = JDBCTemplate.getConnection();
		ChallengeSumData csd = dao.selectNumChallenge(conn);

		JDBCTemplate.close(conn);
		return csd;
	}

	public ChallengePageData selectChallengeList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int end = numPerPage*reqPage;
		int start = end - numPerPage + 1;

		ArrayList<Chellenge> list = dao.selectChallengeList(conn, start, end);
		int totalCount = dao.selectChallengeCount(conn);

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
			pageNavi += "<a class='page-item' href='/adminChallenge.do?reqPage=" + (pageNo - 1) + "'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		for(int i=0; i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/adminChallenge.do?reqPage=" + pageNo + "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/adminChallenge.do?reqPage=" + pageNo + "'>";
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
			pageNavi += "<a class='page-item' href='/adminChallenge.do?reqPage=" + pageNo + "'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}

		pageNavi += "</ul>";
		ChallengePageData cpd = new ChallengePageData(list, pageNavi);

		JDBCTemplate.close(conn);
		return cpd;
	}

	public int updateChallengePermission(int questNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateChallengePermission(conn, questNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return result;
	}


}
