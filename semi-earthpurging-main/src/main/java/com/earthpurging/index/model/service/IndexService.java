package com.earthpurging.index.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.earthpurging.chellenge.model.dao.ChellengeDao;
import com.earthpurging.index.model.dao.IndexDao;
import com.earthpurging.index.model.vo.ChellengeMemberData;
import com.earthpurging.index.model.vo.ChellengeRank;
import com.earthpurging.index.model.vo.ChellengeRankData;
import com.earthpurging.index.model.vo.Plogging;
import com.earthpurging.member.model.vo.Member;

import common.JDBCTemplate;

public class IndexService {
	private IndexDao dao;

	public IndexService() {
		super();
		dao = new IndexDao();
	}

	public ChellengeRankData selectFiveRank() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ChellengeRank> list = dao.selectFiveRank(conn);
		ChellengeRankData crd = new ChellengeRankData(list);
		JDBCTemplate.close(conn);
		return crd;
	}

	public ChellengeMemberData selectOneMember(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		ChellengeMemberData cmd = dao.selectOneMember(conn, member);
		JDBCTemplate.close(conn);
		return cmd;
	}

	public ChellengeMemberData allTrash() {
		Connection conn = JDBCTemplate.getConnection();
		ChellengeMemberData all = dao.allTrash(conn);
		JDBCTemplate.close(conn);
		return all;
	}

	public int insertPlogging(Plogging p) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertPlogging(conn, p);
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}
}
