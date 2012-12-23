package com.woooha.entity.video;

import com.woooha.entity.core.AbstractEntity;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-25
 * Time: 下午10:01
 * To change this template use File | Settings | File Templates.
 */
public class VideoTag extends AbstractEntity {

    private String name;
    private int order;

    public VideoTag(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public VideoTag() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }
}
