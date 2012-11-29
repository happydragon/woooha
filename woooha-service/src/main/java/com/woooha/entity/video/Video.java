package com.woooha.entity.video;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-24
 * Time: 下午9:42
 * To change this template use File | Settings | File Templates.
 */
public class Video implements Serializable {

    private int id;
    private String title;
    private String abbrTitle;
    private float score;
    private String comment;
    private float userScore;
    private int recommendCount;
    private int categoryId;
    private String pic;
    private String url;
    private String fromSite;
    private int commentCount;
    private int inTopHotList;
    private Date createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAbbrTitle() {
        return abbrTitle;
    }

    public void setAbbrTitle(String abbrTitle) {
        this.abbrTitle = abbrTitle;
    }

    public float getScore() {
        return score;
    }

    public int getWooohaStar() {
        return Math.round(score) * 5;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public float getUserScore() {
        return userScore;
    }

    public int getUserStar() {
        return Math.round(userScore) * 5;
    }

    public void setUserScore(float userScore) {
        this.userScore = userScore;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRecommendCount() {
        return recommendCount;
    }

    public void setRecommendCount(int recommendCount) {
        this.recommendCount = recommendCount;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getFromSite() {
        return fromSite;
    }

    public String getFromSiteLabel() {
        return VideoSite.fromCode(this.fromSite).getLabel();
    }

    public void setFromSite(String fromSite) {
        this.fromSite = fromSite;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getInTopHotList() {
        return inTopHotList;
    }

    public void setInTopHotList(int inTopHotList) {
        this.inTopHotList = inTopHotList;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }
}
