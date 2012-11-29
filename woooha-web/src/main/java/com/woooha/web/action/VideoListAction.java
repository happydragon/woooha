/**
 * 
 */
package com.woooha.web.action;

import com.opensymphony.xwork2.ActionSupport;
import com.woooha.entity.video.Video;
import com.woooha.entity.video.VideoComment;
import com.woooha.entity.video.VideoTag;
import com.woooha.service.VideoCommentService;
import com.woooha.service.VideoService;
import com.woooha.vo.VideoVo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * @author jian.liu
 *
 */
@SuppressWarnings("serial")
public class VideoListAction extends ActionSupport {

    @Autowired
    private VideoService videoService;
    @Autowired
    private VideoCommentService commentService;

    private List<VideoVo> topHotVideos = new ArrayList<VideoVo>();
    private List<VideoVo> latestVideos = new ArrayList<VideoVo>();
    private List<VideoVo> recommendVideos = new ArrayList<VideoVo>();
    private List<VideoComment> latestComments = new ArrayList<VideoComment>();
    private List<VideoTag> videoTags = new ArrayList<VideoTag>();
	
	public String index() {
        List<Video> topHotVideoList = videoService.findTopHotVideos();
        for (Video video : topHotVideoList) {
            this.topHotVideos.add(new VideoVo(video));
        }
        List<Video> topRecommendVideos = videoService.findTopRecommendVideos(24);
        for (Video video : topRecommendVideos) {
            this.recommendVideos.add(new VideoVo(video));
        }
        List<Video> latestVideoList = videoService.findTopNewVideos(8);
        for (Video video : latestVideoList) {
            this.latestVideos.add(new VideoVo(video));
        }
        this.latestComments = commentService.findLatestComments(8);
        this.videoTags = videoService.getVideoTags();
		return SUCCESS;
	}

    public List<VideoVo> getTopHotVideos() {
        return topHotVideos;
    }

    public List<VideoVo> getRecommendVideos() {
        return recommendVideos;
    }

    public List<VideoVo> getLatestVideos() {
        return latestVideos;
    }

    public List<VideoComment> getLatestComments() {
        return latestComments;
    }

    public List<VideoTag> getVideoTags() {
        return videoTags;
    }
}
