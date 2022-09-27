package com.earthpurging.index.model.vo;

public class Plogging {
	private String crewName;
	private String crewBirth;
	private String crewPlace;
	private String crewPhone;
	private String crewEmail;
	private String crewKind;
	private int memberNo;
	public Plogging() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Plogging(String crewName, String crewBirth, String crewPlace, String crewPhone, String crewEmail,
			String crewKind, int memberNo) {
		super();
		this.crewName = crewName;
		this.crewBirth = crewBirth;
		this.crewPlace = crewPlace;
		this.crewPhone = crewPhone;
		this.crewEmail = crewEmail;
		this.crewKind = crewKind;
		this.memberNo = memberNo;
	}
	public String getCrewName() {
		return crewName;
	}
	public void setCrewName(String crewName) {
		this.crewName = crewName;
	}
	public String getCrewBirth() {
		return crewBirth;
	}
	public void setCrewBirth(String crewBirth) {
		this.crewBirth = crewBirth;
	}
	public String getCrewPlace() {
		return crewPlace;
	}
	public void setCrewPlace(String crewPlace) {
		this.crewPlace = crewPlace;
	}
	public String getCrewPhone() {
		return crewPhone;
	}
	public void setCrewPhone(String crewPhone) {
		this.crewPhone = crewPhone;
	}
	public String getCrewEmail() {
		return crewEmail;
	}
	public void setCrewEmail(String crewEmail) {
		this.crewEmail = crewEmail;
	}
	public String getCrewKind() {
		return crewKind;
	}
	public void setCrewKind(String crewKind) {
		this.crewKind = crewKind;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
}
