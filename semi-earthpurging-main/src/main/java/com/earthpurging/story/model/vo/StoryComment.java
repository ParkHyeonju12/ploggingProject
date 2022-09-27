package com.earthpurging.story.model.vo;

public class StoryComment {
	private int scNo;
	private int scWriter;
	private String scContent;
	private String scDate;
	private int storyRef;
	private int scRef;
	private String scNickname;
	public StoryComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StoryComment(int scNo, int scWriter, String scContent, String scDate, int storyRef, int scRef,
			String scNickname) {
		super();
		this.scNo = scNo;
		this.scWriter = scWriter;
		this.scContent = scContent;
		this.scDate = scDate;
		this.storyRef = storyRef;
		this.scRef = scRef;
		this.scNickname = scNickname;
	}
	public int getScNo() {
		return scNo;
	}
	public void setScNo(int scNo) {
		this.scNo = scNo;
	}
	public int getScWriter() {
		return scWriter;
	}
	public void setScWriter(int scWriter) {
		this.scWriter = scWriter;
	}
	public String getScContent() {
		return scContent;
	}
	public void setScContent(String scContent) {
		this.scContent = scContent;
	}
	public String getScDate() {
		return scDate;
	}
	public void setScDate(String scDate) {
		this.scDate = scDate;
	}
	public int getStoryRef() {
		return storyRef;
	}
	public void setStoryRef(int storyRef) {
		this.storyRef = storyRef;
	}
	public int getScRef() {
		return scRef;
	}
	public void setScRef(int scRef) {
		this.scRef = scRef;
	}
	public String getScNickname() {
		return scNickname;
	}
	public void setScNickname(String scNickname) {
		this.scNickname = scNickname;
	}
	
		
}