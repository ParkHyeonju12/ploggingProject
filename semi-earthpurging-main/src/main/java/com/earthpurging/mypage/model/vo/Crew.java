package com.earthpurging.mypage.model.vo;

public class Crew {
     private int crewNo;
     private String crewName;
     private String crewBirth;
     private String crewPlace;
     private String crewPhone;
     private int memberNo;
     private String crewEmail;
     private String crewKind;

    public Crew() {
        super();
    }

    public Crew(int crewNo, String crewName, String crewBirth, String crewPlace, String crewPhone, int memberNo, String crewEmail, String crewKind) {
        super();
        this.crewNo = crewNo;
        this.crewName = crewName;
        this.crewBirth = crewBirth;
        this.crewPlace = crewPlace;
        this.crewPhone = crewPhone;
        this.memberNo = memberNo;
        this.crewEmail = crewEmail;
        this.crewKind = crewKind;

    }

    public int getCrewNo() {
        return crewNo;
    }

    public void setCrewNo(int crewNo) {
        this.crewNo = crewNo;
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

    public int getMemberNo() {
        return memberNo;
    }

    public void setMemberNo(int memberNo) {
        this.memberNo = memberNo;
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
}
