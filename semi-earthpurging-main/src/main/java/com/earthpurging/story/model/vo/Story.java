package com.earthpurging.story.model.vo;

public class Story {
	private int storyNo;
	private String storyContent;
	private int storyReadCount;
	private String storyRegDate;
	private String photoPath;
	private int storyWriter;
	private int likeCount;
	private String nickname;
	public Story() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Story(int storyNo, String storyContent, int storyReadCount, String storyRegDate, String photoPath,
			int storyWriter, int likeCount, String nickname) {
		super();
		this.storyNo = storyNo;
		this.storyContent = storyContent;
		this.storyReadCount = storyReadCount;
		this.storyRegDate = storyRegDate;
		this.photoPath = photoPath;
		this.storyWriter = storyWriter;
		this.likeCount = likeCount;
		this.nickname = nickname;
	}
	public int getStoryNo() {
		return storyNo;
	}
	public void setStoryNo(int storyNo) {
		this.storyNo = storyNo;
	}
	public String getStoryContent() {
		return storyContent;
	}
	public void setStoryContent(String storyContent) {
		this.storyContent = storyContent;
	}
	public int getStoryReadCount() {
		return storyReadCount;
	}
	public void setStoryReadCount(int storyReadCount) {
		this.storyReadCount = storyReadCount;
	}
	public String getStoryRegDate() {
		return storyRegDate;
	}
	public void setStoryRegDate(String storyRegDate) {
		this.storyRegDate = storyRegDate;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public int getStoryWriter() {
		return storyWriter;
	}
	public void setStoryWriter(int storyWriter) {
		this.storyWriter = storyWriter;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	

}

