/**
 * 
 */
package com.woooha.web.action;

import com.woooha.entity.core.Paginater;
import com.woooha.entity.video.Video;
import com.woooha.entity.video.VideoComment;
import com.woooha.entity.video.VideoTag;
import com.woooha.service.VideoCommentService;
import com.woooha.service.VideoCriteria;
import com.woooha.service.VideoService;
import com.woooha.vo.VideoVo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * @author jian.liu
 *
 */
@SuppressWarnings("serial")
public class VideoListAction extends AbstractWooohaAction {

    @Autowired
    private VideoService videoService;
    @Autowired
    private VideoCommentService commentService;

    private int tagId;
    private VideoTag tag;
    private String sortType = "";

    private List<VideoVo> topHotVideos = new ArrayList<VideoVo>();
    private List<VideoVo> latestVideos = new ArrayList<VideoVo>();
    private List<VideoVo> recommendVideos = new ArrayList<VideoVo>();
    private Paginater<Object> videoPaginater = new Paginater<Object>(20);
    private List<VideoComment> latestComments = new ArrayList<VideoComment>();
    private List<VideoTag> videoTags = new ArrayList<VideoTag>();

    public String index() {
        List<Video> topHotVideoList = videoService.findTopHotVideos();
        for (Video video : topHotVideoList) {
            this.topHotVideos.add(new VideoVo(video));
        }
        List<Video> topRecommendVideos = videoService.findLatestRecommendVideos(22);
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

    public String listByTag() {
        this.tag = videoService.getTag(tagId);
        VideoCriteria criteria = new VideoCriteria();
        criteria.setTagId(this.tagId);
        videoPaginater = videoService.paginateVideos(criteria, withSort(videoPaginater));
        List<Object> videoVos = new ArrayList<Object>();
        for (Object video : videoPaginater.getResults()) {
            videoVos.add(new VideoVo((Video) video));
        }
        videoPaginater.setResults(videoVos);
        return SUCCESS;
    }

    private Paginater<Object> withSort(Paginater<Object> videoPaginater) {
        if ("R".equals(sortType) || StringUtils.isBlank(sortType)) {
            videoPaginater.setSortField("createTime");
            videoPaginater.setSortAsc(false);
        } else if ("P".equals(sortType)) {
            videoPaginater.setSortField("userScore");
            videoPaginater.setSortAsc(false);
        } else if ("S".equals(sortType)) {
            videoPaginater.setSortField("recommendCount");
            videoPaginater.setSortAsc(false);
        }
        return videoPaginater;
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

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public VideoTag getTag() {
        return tag;
    }

    public void setTag(VideoTag tag) {
        this.tag = tag;
    }

    public Paginater<Object> getVideoPaginater() {
        return videoPaginater;
    }

    public Paginater<Object> getVp() {
        return videoPaginater;
    }

    public void setVideoPaginater(Paginater<Object> videoPaginater) {
        this.videoPaginater = videoPaginater;
    }

    public void setSortType(String sortType) {
        this.sortType = sortType;
    }

    public String getSortType() {
        return sortType;
    }
}
