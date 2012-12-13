package com.woooha.entity.video;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-4
 * Time: 下午1:54
 * To change this template use File | Settings | File Templates.
 */
public class VideoScore implements Serializable {

    private int userId;
    private int videoId;
    private int score;
    private Date createTime;

    public VideoScore() {
    }

    public VideoScore(int videoId, int userId, int score) {
        this.videoId = videoId;
        this.userId = userId;
        this.score = score;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
