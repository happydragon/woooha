package com.woooha.entity.video;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-25
 * Time: 下午2:59
 * To change this template use File | Settings | File Templates.
 */
public enum VideoSite {

    Youku("优酷"), Tudou("土豆"), Qiyi("奇艺"), Unknown("其他");

    private String label;

    private VideoSite(String label) {
        this.label = label;
    }

    public static VideoSite fromCode(String code) {
        for (VideoSite site : VideoSite.values()) {
            if (site.name().equalsIgnoreCase(code)) {
                return site;
            }
        }
        return Unknown;
    }

    public String getLabel() {
        return label;
    }
}
