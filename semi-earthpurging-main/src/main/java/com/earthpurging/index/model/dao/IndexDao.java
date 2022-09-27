package com.earthpurging.index.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.earthpurging.index.model.vo.ChellengeMemberData;
import com.earthpurging.index.model.vo.ChellengeRank;
import com.earthpurging.index.model.vo.Plogging;
import com.earthpurging.member.model.vo.Member;

import common.JDBCTemplate;

public class IndexDao {

	public ArrayList<ChellengeRank> selectFiveRank(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ChellengeRank> list = new ArrayList<ChellengeRank>();
		String query = "SELECT X.*, Y.* FROM (SELECT rownum AS RANK, p.* FROM (SELECT * FROM (SELECT n.* FROM (SELECT SUM(QUEST_CAN) 캔,\r\n"
				+ "    SUM(QUEST_PLA) 플라스틱,\r\n"
				+ "    SUM(QUEST_GLASS) 병,\r\n"
				+ "    SUM(QUEST_PAPER) 종이,\r\n"
				+ "    SUM(QUEST_WRAPPER) 비닐,\r\n"
				+ "    SUM(QUEST_TABACOO) 담배꽁초,\r\n"
				+ "    SUM(QUEST_POINT) 총점수,\r\n"
				+ "    MEMBER_NO,\r\n"
				+ "    (SELECT PHOTO_PATH FROM CHELLENGE_LIST WHERE QUEST_NO IN (SELECT MAX(QUEST_NO) AS QUEST_MAX FROM CHELLENGE_LIST CL2 WHERE PERMISSION='Y' AND CL2.MEMBER_NO = CL.MEMBER_NO)) AS PHOTO_PATH\r\n"
				+ "    FROM chellenge_list CL WHERE PERMISSION='Y' GROUP BY MEMBER_NO)n) ORDER BY 총점수 DESC)p WHERE ROWNUM BETWEEN 1 AND 5)X INNER JOIN (SELECT M.MEMBER_NO, MEMBER_ID 아이디, MEMBER_NAME 이름, NICKNAME 닉네임, MEMBER_INTRO 자기소개 FROM MEMBER_TBL M)Y ON X.MEMBER_NO = Y.MEMBER_NO";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ChellengeRank cr = new ChellengeRank();
				cr.setRank(rset.getInt("RANK"));
				cr.setQuestCan(rset.getInt("캔"));
				cr.setQuestPla(rset.getInt("플라스틱"));
				cr.setQuestGlass(rset.getInt("병"));
				cr.setQuestPaper(rset.getInt("종이"));
				cr.setQuestWrapper(rset.getInt("비닐"));
				cr.setQuestTabacoo(rset.getInt("담배꽁초"));
				cr.setQuestPoint(rset.getInt("총점수"));
				cr.setMemberNo(rset.getInt("MEMBER_NO"));
				cr.setPhotoPath(rset.getString("PHOTO_PATH"));
				cr.setMemberId(rset.getString("아이디"));
				cr.setMemberName(rset.getString("이름"));
				cr.setNickName(rset.getString("닉네임"));
				if(rset.getString("자기소개")!=null) {
				cr.setMemberIntro(rset.getString("자기소개"));
				}else {
					cr.setMemberIntro("입력안함");
				}
				list.add(cr);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public ChellengeMemberData selectOneMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ChellengeMemberData cmd = null;
		String query = "select x.*, y.* from \r\n"
				+ "(select * from member_tbl where member_id= ? and member_pw= ?)x\r\n"
				+ "inner join \r\n"
				+ "(SELECT SUM(QUEST_CAN) 캔,\r\n"
				+ "    SUM(QUEST_PLA) 플라스틱,\r\n"
				+ "    SUM(QUEST_GLASS) 유리,\r\n"
				+ "    SUM(QUEST_PAPER) 종이,\r\n"
				+ "    SUM(QUEST_WRAPPER) 비닐,\r\n"
				+ "    SUM(QUEST_TABACOO) 담배꽁초,\r\n"
				+ "    SUM(QUEST_POINT) 총점수,\r\n"
				+ "    MEMBER_NO \r\n"
				+ "    FROM chellenge_list WHERE PERMISSION='Y' GROUP BY MEMBER_NO)y\r\n"
				+ "    ON X.MEMBER_NO = Y.MEMBER_NO";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPw());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				cmd = new ChellengeMemberData();
				cmd.setMemberNo(rset.getInt("member_no"));
				cmd.setMemberId(rset.getString("member_id"));
				cmd.setMemberPw(rset.getString("member_pw"));
				cmd.setMemberName(rset.getString("member_name"));
				cmd.setMemberPhone(rset.getString("member_phone"));
				cmd.setMemberAddr(rset.getString("member_addr"));
				cmd.setMemberEmail(rset.getString("member_email"));
				cmd.setMemberLevel(rset.getInt("member_level"));
				cmd.setMemberBirth(rset.getString("member_birth"));
				cmd.setNickname(rset.getString("nickname"));
				cmd.setEnrollDate(rset.getString("enroll_date"));
				cmd.setTotalPoint(rset.getInt("total_point"));
				cmd.setMemberIntro(rset.getString("member_intro"));
				cmd.setQuestCan(rset.getInt("캔"));
				cmd.setQuestPla(rset.getInt("플라스틱"));
				cmd.setQuestGlass(rset.getInt("유리"));
				cmd.setQuestPaper(rset.getInt("종이"));
				cmd.setQuestWrapper(rset.getInt("비닐"));
				cmd.setQuestTabacoo(rset.getInt("담배꽁초"));
				cmd.setQuestPoint(rset.getInt("총점수"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return cmd;
	}

	public ChellengeMemberData allTrash(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ChellengeMemberData all = null;
		String query = "SELECT SUM(QUEST_CAN) 캔,\r\n"
				+ "    SUM(QUEST_PLA) 플라스틱,\r\n"
				+ "    SUM(QUEST_GLASS) 유리,\r\n"
				+ "    SUM(QUEST_PAPER) 종이,\r\n"
				+ "    SUM(QUEST_WRAPPER) 비닐,\r\n"
				+ "    SUM(QUEST_TABACOO) 담배꽁초,\r\n"
				+ "    SUM(QUEST_POINT) 총점수\r\n"
				+ "    FROM chellenge_list WHERE PERMISSION='Y'";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				all = new ChellengeMemberData();
				all.setQuestCan(rset.getInt("캔"));
				all.setQuestPla(rset.getInt("플라스틱"));
				all.setQuestGlass(rset.getInt("유리"));
				all.setQuestPaper(rset.getInt("종이"));
				all.setQuestWrapper(rset.getInt("비닐"));
				all.setQuestTabacoo(rset.getInt("담배꽁초"));
				all.setQuestPoint(rset.getInt("총점수"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return all;
	}

	public int insertPlogging(Connection conn, Plogging p) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query="INSERT INTO CREW_TBL VALUES(CREW_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getCrewName());
			pstmt.setString(2, p.getCrewBirth());
			pstmt.setString(3, p.getCrewPlace());
			pstmt.setString(4, p.getCrewPhone());
			pstmt.setInt(5, p.getMemberNo());
			pstmt.setString(6, p.getCrewEmail());
			pstmt.setString(7, p.getCrewKind());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}
	
}
