package com.woooha.vo;

import com.woooha.entity.video.VideoScoreStats;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-2
 * Time: 下午7:17
 * To change this template use File | Settings | File Templates.
 */
public class VideoScoreStatsVo implements Serializable {

    private VideoScoreStats scoreStats;
    private float percentage;

    public VideoScoreStatsVo() {
    }

    public VideoScoreStatsVo(VideoScoreStats scoreStats, float percentage) {
        this.scoreStats = scoreStats;
        this.percentage = percentage;
    }

    public VideoScoreStats getScoreStats() {
        return scoreStats;
    }

    public void setScoreStats(VideoScoreStats scoreStats) {
        this.scoreStats = scoreStats;
    }

    public float getPercentage() {
        return percentage;
    }

    public void setPercentage(float percentage) {
        this.percentage = percentage;
    }
}
