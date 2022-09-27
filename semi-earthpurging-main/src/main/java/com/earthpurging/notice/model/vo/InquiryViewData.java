package com.earthpurging.notice.model.vo;

import java.util.ArrayList;

public class InquiryViewData {
	private Inquiry inq;
	private ArrayList<InquiryComment> commentList;
	public InquiryViewData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InquiryViewData(Inquiry inq, ArrayList<InquiryComment> commentList) {
		super();
		this.inq = inq;
		this.commentList = commentList;
	}
	public Inquiry getInq() {
		return inq;
	}
	public void setInq(Inquiry inq) {
		this.inq = inq;
	}
	public ArrayList<InquiryComment> getCommentList() {
		return commentList;
	}
	public void setCommentList(ArrayList<InquiryComment> commentList) {
		this.commentList = commentList;
	}
	
	
}
