package com.earthpurging.story.model.vo;

import java.util.ArrayList;

public class StoryViewData {
	private Story s;
	private ArrayList<StoryComment> scList;
	public StoryViewData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StoryViewData(Story s, ArrayList<StoryComment> scList) {
		super();
		this.s = s;
		this.scList = scList;
	}
	public Story getS() {
		return s;
	}
	public void setS(Story s) {
		this.s = s;
	}
	public ArrayList<StoryComment> getScList() {
		return scList;
	}
	public void setScList(ArrayList<StoryComment> scList) {
		this.scList = scList;
	}
	
	
}
