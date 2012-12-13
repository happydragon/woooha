package com.woooha.entity.video;

import com.woooha.util.StringUtils;
import org.apache.commons.lang.time.DateUtils;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-25
 * Time: 上午10:52
 * To change this template use File | Settings | File Templates.
 */
public class VideoComment implements Serializable {

    private int id;
    private int videoId;
    private String videoAbbrTitle;
    private float videoUserScore;
    private int userId;
    private String userPic;
    private String userNickName;
    private String content;
    private Integer replyToId;
    private VideoComment replyTo;
    private Date createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getContent() {
        return content;
    }

    public String getShortContent() {
        return StringUtils.cutString(content, 90, null);
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getBeforeHours() {
        long ms = new Date().getTime() - createTime.getTime();
        return (int) (ms / 3600000);
    }

    public String getVideoAbbrTitle() {
        return videoAbbrTitle;
    }

    public void setVideoAbbrTitle(String videoAbbrTitle) {
        this.videoAbbrTitle = videoAbbrTitle;
    }

    public float getVideoUserScore() {
        return videoUserScore;
    }

    public int getVideoUserIntStar() {
        return Math.round(videoUserScore / 2);
    }

    public void setVideoUserScore(float videoUserScore) {
        this.videoUserScore = videoUserScore;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public VideoComment getReplyTo() {
        return replyTo;
    }

    public void setReplyTo(VideoComment replyTo) {
        this.replyTo = replyTo;
    }

    public Integer getReplyToId() {
        return replyToId;
    }

    public void setReplyToId(Integer replyToId) {
        this.replyToId = replyToId;
    }

    public String getUserNickName() {
        return userNickName;
    }

    public void setUserNickName(String userNickName) {
        this.userNickName = userNickName;
    }
}
