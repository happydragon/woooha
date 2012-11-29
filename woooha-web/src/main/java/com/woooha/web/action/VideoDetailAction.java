/**
 * 
 */
package com.woooha.web.action;

import com.opensymphony.xwork2.ActionSupport;
import com.woooha.entity.video.Video;
import com.woooha.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author jian.liu
 *
 */
@SuppressWarnings("serial")
public class VideoDetailAction extends ActionSupport {

    @Autowired
    private VideoService videoService;

    private int id;
    private Video video;

    public String detail() {
        this.video = videoService.findById(id);
        return SUCCESS;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Video getVideo() {
        return video;
    }
}
