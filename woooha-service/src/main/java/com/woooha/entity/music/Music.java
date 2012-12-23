/**
 * File Created at 12-12-21
 *
 * Copyright 2010 dianping.com.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of
 * Dianping Company. ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with dianping.com.
 */
package com.woooha.entity.music;

import com.woooha.entity.core.AbstractEntity;
import com.woooha.entity.core.Character;
import org.apache.commons.lang.StringUtils;

import java.util.Date;

/**
 * TODO Comment of The Class
 *
 * @author danson.liu
 */
public class Music extends AbstractEntity {

    private String title;
    private Character singer;
    private Character author;   //unused
    private MusicCategory category;
    private String cover;
    private String playUrl;
    private int seconds;
    private String introUrl;
    private String lyric;
    private int playCount;
    private Date createTime;

    private String week;
    private int weekPlayCount;
    private int recommend;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Character getSinger() {
        return singer;
    }

    public void setSinger(Character singer) {
        this.singer = singer;
    }

    public Character getAuthor() {
        return author;
    }

    public void setAuthor(Character author) {
        this.author = author;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getPlayUrl() {
        return playUrl;
    }

    public void setPlayUrl(String playUrl) {
        this.playUrl = playUrl;
    }

    public int getSeconds() {
        return seconds;
    }

    public void setSeconds(int seconds) {
        this.seconds = seconds;
    }

    /**
     * 返回形如03:06样式的文本
     * @return
     */
    public String getSecondsLabel() {
        int minutes = this.seconds / 60;
        int remain = this.seconds - minutes * 60;
        return StringUtils.leftPad(String.valueOf(minutes), 2, '0') + ":"
                + StringUtils.leftPad(String.valueOf(remain), 2, '0');
    }

    public String getIntroUrl() {
        return introUrl;
    }

    public void setIntroUrl(String introUrl) {
        this.introUrl = introUrl;
    }

    public String getLyric() {
        return lyric;
    }

    public void setLyric(String lyric) {
        this.lyric = lyric;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public MusicCategory getCategory() {
        return category;
    }

    public void setCategory(MusicCategory category) {
        this.category = category;
    }

    public int getPlayCount() {
        return playCount;
    }

    public void setPlayCount(int playCount) {
        this.playCount = playCount;
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }

    public int getWeekPlayCount() {
        return weekPlayCount;
    }

    public void setWeekPlayCount(int weekPlayCount) {
        this.weekPlayCount = weekPlayCount;
    }

    public int getRecommend() {
        return recommend;
    }

    public void setRecommend(int recommend) {
        this.recommend = recommend;
    }
}
