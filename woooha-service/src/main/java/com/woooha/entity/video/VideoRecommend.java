package com.woooha.entity.video;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-6
 * Time: 下午2:29
 * To change this template use File | Settings | File Templates.
 */
public class VideoRecommend implements Serializable {

    private int videoId;
    private int userId;
    private Date createTime;

    public VideoRecommend() {
    }

    public VideoRecommend(int videoId, int userId) {
        this.videoId = videoId;
        this.userId = userId;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
