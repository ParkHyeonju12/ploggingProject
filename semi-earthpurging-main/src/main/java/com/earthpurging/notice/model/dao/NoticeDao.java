package com.earthpurging.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.earthpurging.notice.model.vo.Inquiry;
import com.earthpurging.notice.model.vo.InquiryComment;
import com.earthpurging.notice.model.vo.Notice;

import common.JDBCTemplate;

public class NoticeDao {

	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into notice_list values(notice_seq.nextval,?,?,?,0,to_char(sysdate,'yyyy-mm-dd'),?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getNoticeWriter());
			pstmt.setString(2, n.getNoticeTitle());
			pstmt.setString(3, n.getNoticeContent());
			pstmt.setString(4, n.getFilename());
			pstmt.setString(5, n.getFilepath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Notice> selectNoticeList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		String query = "select * from (select rownum as rnum, n.* from (select * from notice_list order by notice_no desc)n) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				n.setNoticeContent(rset.getString("notice_content"));
				n.setReadCount(rset.getInt("read_count"));
				n.setRegDate(rset.getString("reg_date"));
				n.setFilename(rset.getString("filename"));
				n.setFilepath(rset.getString("filepath"));
				list.add(n);
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

	public int selectNoticeList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) as cnt from notice_list";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalCount = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return totalCount;
	}

	public ArrayList<Inquiry> selectInquiryList(Connection conn, int end, int start) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Inquiry> list = new ArrayList<Inquiry>();
		String query = "select * from (select rownum as rnum, n.* from (SELECT * FROM inquiry_tbl order by inquiry_no desc)n) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Inquiry inq = new Inquiry();
				inq.setInquiry_no(rset.getInt("inquiry_no"));
				inq.setInquiry_type(rset.getString("inquiry_type"));
				inq.setInquiry_writer(rset.getString("inquiry_writer"));
				inq.setInquiry_title(rset.getString("inquiry_title"));
				inq.setInquiry_content(rset.getString("inquiry_content"));
				inq.setInquiry_enroll_date(rset.getString("inquiry_enroll_date"));
				inq.setInquirer_email(rset.getString("inquirer_email"));
				inq.setIs_answer(rset.getString("is_answer"));
				inq.setInquiry_filepath(rset.getString("inquiry_filepath"));
				list.add(inq);
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

	public int selectInquiryCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) as cnt from inquiry_tbl";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalCount = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return totalCount;
	}

	public int updateReadCount(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update notice_list set read_count = read_count+1 where notice_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Notice selectOneNotice(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		String query = "select * from notice_list where notice_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				n.setNoticeContent(rset.getString("notice_content"));
				n.setReadCount(rset.getInt("read_count"));
				n.setRegDate(rset.getString("reg_date"));
				n.setFilename(rset.getString("filename"));
				n.setFilepath(rset.getString("filepath"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return n;
	}

	public int deleteNotice(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from notice_list where notice_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update notice_list set notice_title=?, notice_content=?, filename=?, filepath=? where notice_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getFilename());
			pstmt.setString(4, n.getFilepath());
			pstmt.setInt(5, n.getNoticeNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Inquiry selectOneInquiry(Connection conn, int inquiryNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Inquiry inq = null;
		String query = "select * from inquiry_tbl where inquiry_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, inquiryNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				inq = new Inquiry();
				inq.setInquiry_no(rset.getInt("inquiry_no"));
				inq.setInquiry_type(rset.getString("inquiry_type"));
				inq.setInquiry_writer(rset.getString("inquiry_writer"));
				inq.setInquiry_title(rset.getString("inquiry_title"));
				inq.setInquiry_content(rset.getString("inquiry_content"));
				inq.setInquiry_enroll_date(rset.getString("inquiry_enroll_date"));
				inq.setInquirer_email(rset.getString("inquirer_email"));
				inq.setIs_answer(rset.getString("is_answer"));
				inq.setInquiry_filepath(rset.getString("inquiry_filepath"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return inq;
	}

	public int deleteInquiry(Connection conn, int inquiryNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from inquiry_tbl where inquiry_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, inquiryNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertInquiry(Connection conn, Inquiry inq) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into inquiry_tbl values(inquiry_seq.nextval,?,?,?,?,to_char(sysdate,'yyyy-mm-dd'),?,'답변대기',null)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, inq.getInquiry_type());
			pstmt.setString(2, inq.getInquiry_writer());
			pstmt.setString(3, inq.getInquiry_title());
			pstmt.setString(4, inq.getInquiry_content());
			pstmt.setString(5, inq.getInquirer_email());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateInquiry(Connection conn, Inquiry inq) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update inquiry_tbl set inquirer_email=?, inquiry_title=?, inquiry_writer=?, inquiry_filepath=?, inquiry_type=?,inquiry_content=? where inquiry_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, inq.getInquirer_email());
			pstmt.setString(2, inq.getInquiry_title());
			pstmt.setString(3, inq.getInquiry_writer());
			pstmt.setString(4, inq.getInquiry_filepath());
			pstmt.setString(5, inq.getInquiry_type());
			pstmt.setString(6, inq.getInquiry_content());
			pstmt.setInt(7, inq.getInquiry_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<InquiryComment> selectInquiryCommentList(Connection conn, int inquiryNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<InquiryComment> list = new ArrayList<InquiryComment>();
		String query = "select * from inquiry_comment where inquiry_ref=? order by 1";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, inquiryNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				InquiryComment ic = new InquiryComment();
				ic.setIcContent(rset.getString("ic_content"));
				ic.setIcDate(rset.getString("ic_date"));
				ic.setIcNo(rset.getInt("ic_no"));
				ic.setIcRef(rset.getInt("ic_ref"));
				ic.setIcWriter(rset.getString("ic_writer"));
				ic.setInquiryRef(rset.getInt("inquiry_ref"));
				list.add(ic);
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

	public int insertInquiryComment(Connection conn, InquiryComment ic) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into inquiry_comment values(ic_seq.nextval,?,?,to_char(sysdate,'yyyy-mm-dd'),?,null)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ic.getIcWriter());
			pstmt.setString(2, ic.getIcContent());
			pstmt.setInt(3, ic.getInquiryRef());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateInquiryComment(Connection conn, InquiryComment ic) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update inquiry_comment set ic_content=? where ic_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ic.getIcContent());
			pstmt.setInt(2, ic.getIcNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteInquiryComment(Connection conn, int icNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete inquiry_comment where ic_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, icNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateIsAnswer(Connection conn, int inquiryRef) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update inquiry_tbl set is_answer='답변완료' where inquiry_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, inquiryRef);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateIsAnswer2(Connection conn, int inquiryNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update inquiry_tbl set is_answer='답변대기' where inquiry_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, inquiryNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}



	public int selectAnswerWaitingCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int waitingCnt = 0;
		String query = "select count(*) as waitng_cnt from INQUIRY_TBL where IS_ANSWER='답변대기'";

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()){
				waitingCnt = rset.getInt(1);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return waitingCnt;
	}

}
