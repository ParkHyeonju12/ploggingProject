package com.earthpurging.story.model.vo;

import java.util.ArrayList;

public class StoryPageData {
	private ArrayList<Story> list;
	private String pageNavi;
	public StoryPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StoryPageData(ArrayList<Story> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Story> getList() {
		return list;
	}
	public void setList(ArrayList<Story> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
