package com.earthpurging.index.model.vo;

public class ChellengeRank {
	private int rank; //랭킹 순위
	private int questCan; //캔개수
	private int questPla; //플라스틱 개수
	private int questGlass; //병개수
	private int questPaper; //종이 개수
	private int questWrapper; //비닐 개수
	private int questTabacoo; //담배꽁초 개수
	private int questPoint; //퀘스트 점수
	private String photoPath;//사진경로
	private int memberNo; // 회원번호
	private String memberId; //아이디
	private String memberName;//이름
	private String nickName;//닉네임
	private String memberIntro;//자기소개
	
	public ChellengeRank() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChellengeRank(int rank, int questCan, int questPla, int questGlass, int questPaper, int questWrapper,
			int questTabacoo, int questPoint, String photoPath, int memberNo, String memberId, String memberName,
			String nickName, String memberIntro) {
		super();
		this.rank = rank;
		this.questCan = questCan;
		this.questPla = questPla;
		this.questGlass = questGlass;
		this.questPaper = questPaper;
		this.questWrapper = questWrapper;
		this.questTabacoo = questTabacoo;
		this.questPoint = questPoint;
		this.photoPath = photoPath;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.nickName = nickName;
		this.memberIntro = memberIntro;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
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

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getMemberIntro() {
		return memberIntro;
	}

	public void setMemberIntro(String memberIntro) {
		this.memberIntro = memberIntro;
	}
	
		
}
