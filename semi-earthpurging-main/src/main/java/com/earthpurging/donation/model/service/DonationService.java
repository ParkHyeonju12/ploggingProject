package com.earthpurging.donation.model.service;

import com.earthpurging.donation.model.dao.DonationDao;
import com.earthpurging.donation.model.vo.Donation;
import common.JDBCTemplate;

import java.sql.Connection;
import java.util.ArrayList;

public class DonationService {
    private DonationDao dao;

    public DonationService() {
        super();
        dao = new DonationDao();
    }

    public int insertDonation(Donation d, int memberNo) {

        Connection conn = JDBCTemplate.getConnection();
        int result = dao.insertDonation(conn, d, memberNo);

        if(result>0) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }
        return result;
    }

    public int getTotalDonation() {
        Connection conn = JDBCTemplate.getConnection();
        int totalDonation = dao.getTotalDonation(conn);

        JDBCTemplate.close(conn);

        return totalDonation;
    }

    public ArrayList<Donation> selectAllDonation() {
        Connection conn = JDBCTemplate.getConnection();
        ArrayList<Donation> list = dao.selectAllDonation(conn);

        JDBCTemplate.close(conn);
        return list;
    }
}
