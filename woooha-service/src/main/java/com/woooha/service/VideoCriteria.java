package com.woooha.service;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-10
 * Time: 下午2:24
 * To change this template use File | Settings | File Templates.
 */
public class VideoCriteria implements Serializable {

    private Integer tagId;

    private String title;

    public VideoCriteria(Integer tagId, String title) {
        this.tagId = tagId;
        this.title = title;
    }

    public VideoCriteria() {
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public Integer getTagId() {
        return tagId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
