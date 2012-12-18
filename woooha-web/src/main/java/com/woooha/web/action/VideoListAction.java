/**
 * 
 */
package com.woooha.web.action;

import com.woooha.Constants;
import com.woooha.entity.core.Paginater;
import com.woooha.entity.video.Video;
import com.woooha.entity.video.VideoComment;
import com.woooha.entity.video.VideoTag;
import com.woooha.service.SystemConfigService;
import com.woooha.service.VideoCommentService;
import com.woooha.service.VideoCriteria;
import com.woooha.service.VideoService;
import com.woooha.vo.VideoVo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author jian.liu
 *
 */
@SuppressWarnings("serial")
public class VideoListAction extends AbstractWooohaAction {

    @Autowired
    private VideoService            videoService;
    @Autowired
    private VideoCommentService     commentService;
    @Autowired
    private SystemConfigService     systemConfigService;

    private int tagId;
    private VideoTag tag;
    private String sortType = "";

    private List<VideoVo>           topHotVideos = new ArrayList<VideoVo>();
    private List<VideoVo>           latestVideos = new ArrayList<VideoVo>();
    private List<VideoVo>           recommendVideos = new ArrayList<VideoVo>();
    private Paginater<Object>       videoPaginater = new Paginater<Object>(20);
    private List<VideoComment>      latestComments = new ArrayList<VideoComment>();
    private List<VideoTag>          videoTags = new ArrayList<VideoTag>();
    private List<String>            searchWords = new ArrayList<String>();

    public VideoListAction() {
        super(Constants.MODULE_VIDEO);
    }

    @Override
    public void prepare() throws Exception {
        this.videoTags = videoService.getVideoTags();
        this.searchWords = systemConfigService.getListConfig(Constants.CONFIG_VIDEO_SEARCH_WORDS);
    }

    public String index() {
        List<Video> latestRecommendVideos = videoService.findLatestRecommendVideos(22);
        buildVideo2VideoVo(latestRecommendVideos, this.recommendVideos);

        List<Video> latestVideoList = videoService.findTopNewVideos(8);
        buildVideo2VideoVo(latestVideoList, this.latestVideos);

        List<Video> topHotVideoList = videoService.findTopHotVideos();
        buildVideo2VideoVo(topHotVideoList, this.topHotVideos);

        this.latestComments = commentService.findLatestComments(8);
		return SUCCESS;
	}

    public String listByTag() {
        this.tag = videoService.getTag(tagId);
        VideoCriteria criteria = new VideoCriteria(this.tagId, null);
        videoPaginater = videoService.paginateVideos(criteria, withSort(videoPaginater));
        List<Object> videoVos = new ArrayList<Object>();
        for (Object video : videoPaginater.getResults()) {
            videoVos.add(new VideoVo((Video) video));
        }
        videoPaginater.setResults(videoVos);
        return SUCCESS;
    }

    public String recommendList() {
        List<Video> topRecommendVideos = videoService.findTopRecommendVideos(50);
        videoService.enrichTags(topRecommendVideos);
        buildVideo2VideoVo(topRecommendVideos, this.recommendVideos);
        return SUCCESS;
    }

    public String newList() {
        List<Video> topNewVideos = videoService.findTopNewVideos(60);
        videoService.enrichTags(topNewVideos);
        buildVideo2VideoVo(topNewVideos, this.latestVideos);
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

    private void buildVideo2VideoVo(List<Video> videos, List<VideoVo> videoVos) {
        for (Video video : videos) {
            videoVos.add(new VideoVo(video));
        }
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

    public List<String> getSearchWords() {
        return searchWords;
    }

    public void setSearchWords(List<String> searchWords) {
        this.searchWords = searchWords;
    }

    public void setSystemConfigService(SystemConfigService systemConfigService) {
        this.systemConfigService = systemConfigService;
    }
}
