package com.woooha.entity.video;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-2
 * Time: 下午7:21
 * To change this template use File | Settings | File Templates.
 */
public class VideoScoreStats implements Serializable {

    private int videoId;
    private int score;
    private int count;

    public VideoScoreStats() {
    }

    public VideoScoreStats(int videoId, int score, int count) {
        this.videoId = videoId;
        this.score = score;
        this.count = count;
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

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
