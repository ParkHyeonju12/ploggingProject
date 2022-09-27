package com.earthpurging.notice.model.vo;

public class Inquiry {
	private int inquiry_no;
	private String inquiry_type;
	private String inquiry_writer;
	private String inquiry_title;
	private String inquiry_content;
	private String inquiry_enroll_date;
	private String is_answer;
	private String inquiry_filepath;
	private String inquirer_email;
	public Inquiry() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Inquiry(int inquiry_no, String inquiry_type, String inquiry_writer, String inquiry_title,
			String inquiry_content, String inquiry_enroll_date, String is_answer,
			String inquiry_filepath, String inquirer_email) {
		super();
		this.inquiry_no = inquiry_no;
		this.inquiry_type = inquiry_type;
		this.inquiry_writer = inquiry_writer;
		this.inquiry_title = inquiry_title;
		this.inquiry_content = inquiry_content;
		this.inquiry_enroll_date = inquiry_enroll_date;
		this.is_answer = is_answer;
		this.inquiry_filepath = inquiry_filepath;
		this.inquirer_email = inquirer_email;
	}
	public int getInquiry_no() {
		return inquiry_no;
	}
	public void setInquiry_no(int inquiry_no) {
		this.inquiry_no = inquiry_no;
	}
	public String getInquiry_type() {
		return inquiry_type;
	}
	public void setInquiry_type(String inquiry_type) {
		this.inquiry_type = inquiry_type;
	}
	public String getInquiry_writer() {
		return inquiry_writer;
	}
	public void setInquiry_writer(String inquiry_writer) {
		this.inquiry_writer = inquiry_writer;
	}
	public String getInquiry_title() {
		return inquiry_title;
	}
	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}
	public String getInquiry_content() {
		return inquiry_content;
	}
	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}
	public String getInquiry_enroll_date() {
		return inquiry_enroll_date;
	}
	public void setInquiry_enroll_date(String inquiry_enroll_date) {
		this.inquiry_enroll_date = inquiry_enroll_date;
	}

	public String getIs_answer() {
		return is_answer;
	}
	public void setIs_answer(String is_answer) {
		this.is_answer = is_answer;
	}
	public String getInquiry_filepath() {
		return inquiry_filepath;
	}
	public void setInquiry_filepath(String inquiry_filepath) {
		this.inquiry_filepath = inquiry_filepath;
	}
	public String getInquirer_email() {
		return inquirer_email;
	}
	public void setInquirer_email(String inquirer_email) {
		this.inquirer_email = inquirer_email;
	}
	
	
	
	
}
