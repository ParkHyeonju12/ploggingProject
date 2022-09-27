package com.earthpurging.mypage.model.service;

import com.earthpurging.member.model.vo.Member;
import com.earthpurging.mypage.model.dao.MypageDao;
import com.earthpurging.mypage.model.vo.Crew;
import common.JDBCTemplate;

import java.sql.Connection;
import java.util.ArrayList;

public class MypageService {

    private MypageDao dao;

    public MypageService() {
        super();
        dao = new MypageDao();
    }


    public int[] selectInquiryCnt(String memberName, String memberEmail) {
        Connection conn = JDBCTemplate.getConnection();
        int[] inquiryCntarr = new int[2];
        inquiryCntarr = dao.selectInquiryCnt(conn, memberName, memberEmail);
        JDBCTemplate.close(conn);
        return inquiryCntarr;
    }

    public int updateMyInfo(Member m, String beforeMemberId) {
        Connection conn = JDBCTemplate.getConnection();

        int result = 0;
        if(m.getMemberPw() != null) {
            result = dao.updateMyInfoWithPw(conn, m, beforeMemberId);
        } else {
            result = dao.updateMyInfo(conn, m, beforeMemberId);
        }

        if(result>0) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }

        JDBCTemplate.close(conn);

        return result;

    }

    public int deleteMember(String memberId) {
        Connection conn = JDBCTemplate.getConnection();
        int result = dao.deleteMember(conn, memberId);

        if(result>0) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }
        JDBCTemplate.close(conn);

        return result;
    }

    public ArrayList<Crew> selectCrew(int memberNo) {
        Connection conn = JDBCTemplate.getConnection();
        ArrayList<Crew> list = dao.selectCrew(conn, memberNo);

        JDBCTemplate.close(conn);
        return list;
    }

    public int cancelCrew(int crewNo) {
        Connection conn = JDBCTemplate.getConnection();
        int result = dao.cancelCrew(conn, crewNo);

        if(result>0) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }

        JDBCTemplate.close(conn);
        return result;
    }
}
