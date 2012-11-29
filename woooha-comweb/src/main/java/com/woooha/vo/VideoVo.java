package com.woooha.vo;

import com.woooha.entity.video.Video;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-25
 * Time: 下午12:47
 * To change this template use File | Settings | File Templates.
 */
public class VideoVo implements Serializable {

    private Video video;

    public VideoVo(Video video) {
        this.video = video;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }
}
