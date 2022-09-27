package com.earthpurging.chellenge.model.vo;

import java.util.ArrayList;

public class ChallengePageData {
    private ArrayList<Chellenge> list;
    private String pageNavi;

    public ChallengePageData() {
        super();
    }

    public ChallengePageData(ArrayList<Chellenge> list, String pageNavi) {
        super();
        this.list = list;
        this.pageNavi = pageNavi;
    }

    public ArrayList<Chellenge> getList() {
        return list;
    }

    public void setList(ArrayList<Chellenge> list) {
        this.list = list;
    }

    public String getPageNavi() {
        return pageNavi;
    }

    public void setPageNavi(String pageNavi) {
        this.pageNavi = pageNavi;
    }
}
