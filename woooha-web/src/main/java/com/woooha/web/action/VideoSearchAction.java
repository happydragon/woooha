package com.woooha.web.action;

import com.woooha.Constants;
import com.woooha.entity.core.Paginater;
import com.woooha.entity.video.Video;
import com.woooha.entity.video.VideoTag;
import com.woooha.service.SystemConfigService;
import com.woooha.service.VideoCriteria;
import com.woooha.service.VideoService;
import com.woooha.vo.VideoVo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-16
 * Time: 下午5:45
 * To change this template use File | Settings | File Templates.
 */
public class VideoSearchAction extends AbstractWooohaAction {

    @Autowired
    private VideoService            videoService;
    @Autowired
    private SystemConfigService     systemConfigService;

    private String                  searchText;

    private List<VideoTag>          videoTags = new ArrayList<VideoTag>();
    private List<String>            searchWords = new ArrayList<String>();
    private Paginater<Object>       videoPaginater = new Paginater<Object>(20);

    public VideoSearchAction() {
        super(Constants.MODULE_VIDEO);
    }

    public String search() {
        if (StringUtils.isNotBlank(this.searchText)) {
            this.searchText = this.searchText.trim();
            VideoCriteria criteria = new VideoCriteria(null, searchText);
            videoPaginater.setSortField("userScore");
            videoPaginater.setSortAsc(false);
            videoPaginater = videoService.paginateVideos(criteria, videoPaginater);
            List<Object> videoVos = new ArrayList<Object>();
            for (Object video : videoPaginater.getResults()) {
                videoVos.add(new VideoVo((Video) video));
            }
            videoPaginater.setResults(videoVos);
        }
        this.videoTags = videoService.getVideoTags();
        this.searchWords = systemConfigService.getListConfig(Constants.CONFIG_VIDEO_SEARCH_WORDS);
        return SUCCESS;
    }

    public void setVideoService(VideoService videoService) {
        this.videoService = videoService;
    }

    public Paginater<Object> getVideoPaginater() {
        return videoPaginater;
    }

    public void setVideoPaginater(Paginater<Object> videoPaginater) {
        this.videoPaginater = videoPaginater;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

    public List<VideoTag> getVideoTags() {
        return videoTags;
    }

    public void setVideoTags(List<VideoTag> videoTags) {
        this.videoTags = videoTags;
    }

    public List<String> getSearchWords() {
        return searchWords;
    }

    public void setSearchWords(List<String> searchWords) {
        this.searchWords = searchWords;
    }
}
