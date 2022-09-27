package com.earthpurging.chellenge.model.vo;

public class ChallengeSumData {
    private int canSum;
    private int plaSum;
    private int glassSum;
    private int paperSum;
    private int wrapperSum;
    private int tobaccoSum;

    public ChallengeSumData() {
        super();
    }

    public ChallengeSumData(int canSum, int plaSum, int glassSum, int paperSum, int wrapperSum, int tobaccoSum) {
        super();
        this.canSum = canSum;
        this.plaSum = plaSum;
        this.glassSum = glassSum;
        this.paperSum = paperSum;
        this.wrapperSum = wrapperSum;
        this.tobaccoSum = tobaccoSum;
    }

    public int getCanSum() {
        return canSum;
    }

    public void setCanSum(int canSum) {
        this.canSum = canSum;
    }

    public int getPlaSum() {
        return plaSum;
    }

    public void setPlaSum(int plaSum) {
        this.plaSum = plaSum;
    }

    public int getGlassSum() {
        return glassSum;
    }

    public void setGlassSum(int glassSum) {
        this.glassSum = glassSum;
    }

    public int getPaperSum() {
        return paperSum;
    }

    public void setPaperSum(int paperSum) {
        this.paperSum = paperSum;
    }

    public int getWrapperSum() {
        return wrapperSum;
    }

    public void setWrapperSum(int wrapperSum) {
        this.wrapperSum = wrapperSum;
    }

    public int getTobaccoSum() {
        return tobaccoSum;
    }

    public void setTobaccoSum(int tobaccoSum) {
        this.tobaccoSum = tobaccoSum;
    }
}
