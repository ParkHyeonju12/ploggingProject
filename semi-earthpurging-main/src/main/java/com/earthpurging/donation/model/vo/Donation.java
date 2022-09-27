package com.earthpurging.donation.model.vo;

public class Donation {
    private int donationNo;
    private int donationAmount;
    private String donationName;
    private String donationBirth;
    private String donationPhone;
    private String donationEmail;
    private String payDate;
    private int MemberNo;
    private String memberId;
    public Donation() {
        super();
    }

    public Donation(int donationNo, int donationAmount, String donationName, String donationBirth, String donationPhone, String donationEmail, String payDate, int memberNo) {
        super();
        this.donationNo = donationNo;
        this.donationAmount = donationAmount;
        this.donationName = donationName;
        this.donationBirth = donationBirth;
        this.donationPhone = donationPhone;
        this.donationEmail = donationEmail;
        this.payDate = payDate;
        MemberNo = memberNo;
    }

    public int getDonationNo() {
        return donationNo;
    }

    public void setDonationNo(int donationNo) {
        this.donationNo = donationNo;
    }

    public int getDonationAmount() {
        return donationAmount;
    }

    public void setDonationAmount(int donationAmount) {
        this.donationAmount = donationAmount;
    }

    public String getDonationName() {
        return donationName;
    }

    public void setDonationName(String donationName) {
        this.donationName = donationName;
    }

    public String getDonationBirth() {
        return donationBirth;
    }

    public void setDonationBirth(String donationBirth) {
        this.donationBirth = donationBirth;
    }

    public String getDonationPhone() {
        return donationPhone;
    }

    public void setDonationPhone(String donationPhone) {
        this.donationPhone = donationPhone;
    }

    public String getDonationEmail() {
        return donationEmail;
    }

    public void setDonationEmail(String donationEmail) {
        this.donationEmail = donationEmail;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public int getMemberNo() {
        return MemberNo;
    }

    public void setMemberNo(int memberNo) {
        MemberNo = memberNo;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }
}
