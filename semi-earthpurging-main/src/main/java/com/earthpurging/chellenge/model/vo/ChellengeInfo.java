package com.earthpurging.chellenge.model.vo;

public class ChellengeInfo {
	private int chellengeNo; //챌린지info등록 번호
	private String chellengeName;
	private String chellengePhone;
	private String chellengeEmail;
	private String chellengeAddr;
	private int iMemberNO;
	public ChellengeInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChellengeInfo(int chellengeNo, String chellengeName, String chellengePhone, String chellengeEmail,
			String chellengeAddr, int iMemberNO) {
		super();
		this.chellengeNo = chellengeNo;
		this.chellengeName = chellengeName;
		this.chellengePhone = chellengePhone;
		this.chellengeEmail = chellengeEmail;
		this.chellengeAddr = chellengeAddr;
		this.iMemberNO = iMemberNO;
	}
	public int getChellengeNo() {
		return chellengeNo;
	}
	public void setChellengeNo(int chellengeNo) {
		this.chellengeNo = chellengeNo;
	}
	public String getChellengeName() {
		return chellengeName;
	}
	public void setChellengeName(String chellengeName) {
		this.chellengeName = chellengeName;
	}
	public String getChellengePhone() {
		return chellengePhone;
	}
	public void setChellengePhone(String chellengePhone) {
		this.chellengePhone = chellengePhone;
	}
	public String getChellengeEmail() {
		return chellengeEmail;
	}
	public void setChellengeEmail(String chellengeEmail) {
		this.chellengeEmail = chellengeEmail;
	}
	public String getChellengeAddr() {
		return chellengeAddr;
	}
	public void setChellengeAddr(String chellengeAddr) {
		this.chellengeAddr = chellengeAddr;
	}
	public int getiMemberNO() {
		return iMemberNO;
	}
	public void setiMemberNO(int iMemberNO) {
		this.iMemberNO = iMemberNO;
	}
	
}