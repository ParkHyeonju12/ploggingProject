package com.earthpurging.notice.model.vo;

public class InquiryComment {
	private int icNo;
	private String icWriter;
	private String icContent;
	private String icDate;
	private int inquiryRef;
	private int icRef;
	public InquiryComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InquiryComment(int icNo, String icWriter, String icContent, String icDate, int inquiryRef, int icRef) {
		super();
		this.icNo = icNo;
		this.icWriter = icWriter;
		this.icContent = icContent;
		this.icDate = icDate;
		this.inquiryRef = inquiryRef;
		this.icRef = icRef;
	}
	public int getIcNo() {
		return icNo;
	}
	public void setIcNo(int icNo) {
		this.icNo = icNo;
	}
	public String getIcWriter() {
		return icWriter;
	}
	public void setIcWriter(String icWriter) {
		this.icWriter = icWriter;
	}
	public String getIcContent() {
		return icContent;
	}
	public void setIcContent(String icContent) {
		this.icContent = icContent;
	}
	public String getIcDate() {
		return icDate;
	}
	public void setIcDate(String icDate) {
		this.icDate = icDate;
	}
	public int getInquiryRef() {
		return inquiryRef;
	}
	public void setInquiryRef(int inquiryRef) {
		this.inquiryRef = inquiryRef;
	}
	public int getIcRef() {
		return icRef;
	}
	public void setIcRef(int icRef) {
		this.icRef = icRef;
	}
	
	
}
