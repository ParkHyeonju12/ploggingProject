package com.earthpurging.donation.model.dao;

import com.earthpurging.donation.model.vo.Donation;
import common.JDBCTemplate;

import javax.management.Query;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DonationDao {
    public int insertDonation(Connection conn, Donation d, int memberNo) {
        PreparedStatement pstmt = null;
        int result = 0;
        String query = "insert into donation_tbl values(donation_seq.nextval, ?, ?, ?, ?, ?, to_char(sysdate, 'yyyy-mm-dd'), ?)";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, d.getDonationAmount());
            pstmt.setString(2, d.getDonationName());
            pstmt.setString(3, d.getDonationBirth());
            pstmt.setString(4, d.getDonationPhone());
            pstmt.setString(5, d.getDonationEmail());
            pstmt.setInt(6, memberNo);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }

        return result;
    }

    public int getTotalDonation(Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        int totalDonation = 0;
        String query = "select nvl(sum(donate_amount), 0) as total_donation from donation_tbl";

        try {
            pstmt = conn.prepareStatement(query);
            rset = pstmt.executeQuery();

            if(rset.next()) {
                totalDonation = rset.getInt("total_donation");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }

        return totalDonation;
    }

    public ArrayList<Donation> selectAllDonation(Connection conn) {

        PreparedStatement pstmt = null;
        ResultSet rset = null;
        ArrayList<Donation> list = new ArrayList<Donation>();
        String query = "select m.member_id, d.* from donation_tbl d left join member_tbl m on d.member_no = m.member_no";
        try {
            pstmt = conn.prepareStatement(query);
            rset = pstmt.executeQuery();

            while(rset.next()){
                Donation d = new Donation();
                d.setDonationNo(rset.getInt("donate_no"));
                d.setDonationAmount(rset.getInt("donate_amount"));
                d.setDonationName(rset.getString("donate_name"));
                d.setDonationPhone(rset.getString("donate_phone"));
                d.setDonationBirth(rset.getString("donate_birth"));
                d.setDonationEmail(rset.getString("donate_email"));
                d.setPayDate(rset.getString("pay_date"));
                d.setMemberId(rset.getString("member_id"));

                list.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(conn);
        }

        return list;
    }
}
