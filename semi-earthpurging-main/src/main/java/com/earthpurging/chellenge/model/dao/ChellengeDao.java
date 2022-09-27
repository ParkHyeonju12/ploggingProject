package com.earthpurging.chellenge.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.earthpurging.chellenge.model.vo.ChallengeSumData;
import com.earthpurging.chellenge.model.vo.Chellenge;
import com.earthpurging.chellenge.model.vo.ChellengeInfo;
import com.earthpurging.member.model.vo.Member;

import common.JDBCTemplate;

public class ChellengeDao {

	public int insertChellenge(Connection conn, Chellenge chellenge) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query ="insert into chellenge_list values(CHELLENGE_SEQ.nextval,?,?,?,?,?,?,?,?,to_char(sysdate,'yyyy-mm-dd'),?,?,'N',?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, chellenge.getQuestArea());
			pstmt.setInt(2, chellenge.getQuestCan());
			pstmt.setInt(3, chellenge.getQuestPla());
			pstmt.setInt(4, chellenge.getQuestGlass());
			pstmt.setInt(5, chellenge.getQuestPaper());
			pstmt.setInt(6, chellenge.getQuestWrapper());
			pstmt.setInt(7, chellenge.getQuestTabacoo());
			pstmt.setInt(8, 
					 chellenge.getQuestCan()*3
					+chellenge.getQuestPla()*3
					+chellenge.getQuestGlass()*2
					+chellenge.getQuestPaper()*2
					+chellenge.getQuestWrapper()*1
					+chellenge.getQuestTabacoo()*1);
			pstmt.setString(9, chellenge.getPhotopath());
			pstmt.setInt(10, chellenge.getqMemberNo());
			pstmt.setString(11, chellenge.getMemberThink());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertChellenge(Connection conn, ChellengeInfo ci) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into chellengeinfo values(CHELLENGEINFO_SEQ.nextval,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ci.getChellengeName());
			pstmt.setString(2, ci.getChellengePhone());
			pstmt.setString(3, ci.getChellengeEmail());
			pstmt.setString(4, ci.getChellengeAddr());
			pstmt.setInt(5, ci.getiMemberNO());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ChallengeSumData selectNumChallenge(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select sum(QUEST_CAN) as can_sum, sum(QUEST_PLA) as pla_sum, sum(QUEST_GLASS) as glass_sum, sum(QUEST_PAPER) as paper_sum, sum(QUEST_WRAPPER) as wrapper_sum, sum(QUEST_TABACOO) as tobacco_sum from CHELLENGE_LIST where PERMISSION='Y'";
		ChallengeSumData csd = null;
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				csd = new ChallengeSumData();
				csd.setCanSum(rset.getInt(1));
				csd.setPlaSum(rset.getInt(2));
				csd.setGlassSum(rset.getInt(3));
				csd.setPaperSum(rset.getInt(4));
				csd.setWrapperSum(rset.getInt(5));
				csd.setTobaccoSum(rset.getInt(6));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return csd;
	}

	public ArrayList<Chellenge> selectChallengeList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Chellenge> list = new ArrayList<Chellenge>();
		String query = "select * from (select rownum as rnum, n.* from(select M.NICKNAME, C.* from CHELLENGE_LIST C LEFT JOIN MEMBER_TBL M ON C.MEMBER_NO = M.MEMBER_NO order by quest_no desc)n) where rnum between ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				Chellenge clg = new Chellenge();
				clg.setNickname(rset.getString("nickname"));
				clg.setQuestNO(rset.getInt("quest_no"));
				clg.setQuestCan(rset.getInt("quest_can"));
				clg.setQuestPla(rset.getInt("quest_pla"));
				clg.setQuestGlass(rset.getInt("quest_glass"));
				clg.setQuestPaper(rset.getInt("quest_paper"));
				clg.setQuestWrapper(rset.getInt("quest_wrapper"));
				clg.setQuestTabacoo(rset.getInt("quest_tabacoo"));
				clg.setQuestPoint(rset.getInt("quest_point"));
				clg.setPermission(rset.getString("permission").charAt(0));
				clg.setQuestArea(rset.getString("quest_area"));
				clg.setPhotopath(rset.getString("photo_path"));
				clg.setQuestDate(rset.getString("quest_date"));
				clg.setqMemberNo(rset.getInt("member_no"));
				list.add(clg);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}


		return list;
	}

	public int selectChallengeCount(Connection conn) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) as cnt from chellenge_list";

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				totalCount = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return totalCount;
	}

	public int updateChallengePermission(Connection conn, int questNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update chellenge_list set permission = 'Y' where quest_no=?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, questNo);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}


}
