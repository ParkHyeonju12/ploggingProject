package com.earthpurging.index.model.vo;

public class ChellengeMemberData {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberAddr;
	private String memberEmail;
	private int memberLevel;
	private String memberBirth;
	private String nickname;
	private String enrollDate;
	private	int totalPoint;
	private String memberIntro;
	private int questCan; //캔개수
	private int questPla; //플라스틱 개수
	private int questGlass; //병개수
	private int questPaper; //종이 개수
	private int questWrapper; //비닐 개수
	private int questTabacoo; //담배꽁초 개수
	private int questPoint; //퀘스트 점수
	public ChellengeMemberData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChellengeMemberData(int memberNo, String memberId, String memberPw, String memberName, String memberPhone,
			String memberAddr, String memberEmail, int memberLevel, String memberBirth, String nickname,
			String enrollDate, int totalPoint, String memberIntro, int questCan, int questPla, int questGlass,
			int questPaper, int questWrapper, int questTabacoo, int questPoint) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberAddr = memberAddr;
		this.memberEmail = memberEmail;
		this.memberLevel = memberLevel;
		this.memberBirth = memberBirth;
		this.nickname = nickname;
		this.enrollDate = enrollDate;
		this.totalPoint = totalPoint;
		this.memberIntro = memberIntro;
		this.questCan = questCan;
		this.questPla = questPla;
		this.questGlass = questGlass;
		this.questPaper = questPaper;
		this.questWrapper = questWrapper;
		this.questTabacoo = questTabacoo;
		this.questPoint = questPoint;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberAddr() {
		return memberAddr;
	}
	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public int getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(int memberLevel) {
		this.memberLevel = memberLevel;
	}
	public String getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	public String getMemberIntro() {
		return memberIntro;
	}
	public void setMemberIntro(String memberIntro) {
		this.memberIntro = memberIntro;
	}
	public int getQuestCan() {
		return questCan;
	}
	public void setQuestCan(int questCan) {
		this.questCan = questCan;
	}
	public int getQuestPla() {
		return questPla;
	}
	public void setQuestPla(int questPla) {
		this.questPla = questPla;
	}
	public int getQuestGlass() {
		return questGlass;
	}
	public void setQuestGlass(int questGlass) {
		this.questGlass = questGlass;
	}
	public int getQuestPaper() {
		return questPaper;
	}
	public void setQuestPaper(int questPaper) {
		this.questPaper = questPaper;
	}
	public int getQuestWrapper() {
		return questWrapper;
	}
	public void setQuestWrapper(int questWrapper) {
		this.questWrapper = questWrapper;
	}
	public int getQuestTabacoo() {
		return questTabacoo;
	}
	public void setQuestTabacoo(int questTabacoo) {
		this.questTabacoo = questTabacoo;
	}
	public int getQuestPoint() {
		return questPoint;
	}
	public void setQuestPoint(int questPoint) {
		this.questPoint = questPoint;
	}
	
}
