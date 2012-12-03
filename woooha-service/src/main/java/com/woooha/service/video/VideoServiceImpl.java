package com.woooha.service.video;

import com.woooha.dao.VideoDao;
import com.woooha.entity.video.Video;
import com.woooha.entity.video.VideoScoreStats;
import com.woooha.entity.video.VideoTag;
import com.woooha.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-25
 * Time: 上午11:06
 * To change this template use File | Settings | File Templates.
 */
public class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoDao videoDao;

    @Override
    public List<Video> findTopHotVideos() {
        return videoDao.findTopHotVideos();
    }

    @Override
    public List<Video> findTopRecommendVideos(int limit) {
        return videoDao.findTopRecommendVideos(limit);
    }

    @Override
    public List<Video> findTopNewVideos(int limit) {
        return videoDao.findTopNewVideos(limit);
    }

    @Override
    public List<VideoTag> getVideoTags() {
        return videoDao.getVideoTags();
    }

    @Override
    public Video findById(int id) {
        return videoDao.findById(id);
    }

    @Override
    public List<VideoTag> getTags(int videoId) {
        return videoDao.getTags(videoId);
    }

    @Override
    public List<VideoScoreStats> getScoreStats(int videoId) {
        return videoDao.getScoreStats(videoId);
    }

}
