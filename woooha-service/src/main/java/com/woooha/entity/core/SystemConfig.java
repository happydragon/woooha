package com.woooha.entity.core;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-16
 * Time: 下午7:53
 * To change this template use File | Settings | File Templates.
 */
public class SystemConfig implements Serializable {

    private String key;
    private String value;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
