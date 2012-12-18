package com.woooha.service.video;

import com.woooha.dao.VideoDao;
import com.woooha.entity.core.Paginater;
import com.woooha.entity.video.*;
import com.woooha.service.VideoCriteria;
import com.woooha.service.VideoService;
import com.woooha.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
    public List<Video> findLatestRecommendVideos(int limit) {
        return videoDao.findLatestRecommendVideos(limit);
    }

    @Override
    public List<Video> findTopNewVideos(int limit) {
        return videoDao.findTopNewVideos(limit);
    }

    @Override
    public List<VideoTag> getVideoTags() {
        return videoDao.getVideoTags();
    }

    public Map<Integer, List<VideoTag>> getTags(List<Integer> videoIds) {
        return videoDao.getTags(videoIds);
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

    @Override
    public void score(int videoId, int userId, int score) {
        VideoScore videoScore = videoDao.findScore(videoId, userId);
        boolean recalculateVideoScore = false;
        if (videoScore != null) {
            if (videoScore.getScore() != score) {
                videoDao.updateScore(videoId, userId, score);
                videoDao.decrScoreStats(videoId, videoScore.getScore());
                videoDao.incrScoreStats(videoId, score);
                recalculateVideoScore = true;
            }
        } else {
            videoDao.insertScore(videoId, userId, score);
            videoDao.incrUserScoreCount(videoId);
            videoDao.incrScoreStats(videoId, score);
            recalculateVideoScore = true;
        }
        if (recalculateVideoScore) {
            Float avgScore = videoDao.getAvgScoreFromStats(videoId);
            if (avgScore != null) {
                videoDao.updateUserScore(videoId, Math.round(avgScore * 10) / 10.0f);
            }
        }
    }

    @Override
    public Integer getUserScore(int videoId, int userId) {
        return videoDao.getUserScore(videoId, userId);
    }

    @Override
    public void recommend(int videoId, int userId) {
        VideoRecommend recommend = new VideoRecommend(videoId, userId);
        int inserted = videoDao.insertRecommend(recommend);
        if (inserted > 0) {
            videoDao.incrRecommendCount(videoId, 1);
            videoDao.incrDailyRecommendCount(videoId, DateUtils.currentFormatDate(), 1);
        }
    }

    @Override
    public void unrecommend(int videoId, int userId) {
        VideoRecommend videoRecommend = videoDao.getVideoRecommend(videoId, userId);
        if (videoRecommend != null) {
            int deleted = videoDao.deleteRecommend(videoId, userId);
            if (deleted > 0) {
                videoDao.incrRecommendCount(videoId, -1);
                String currentDate = DateUtils.currentFormatDate();
                if (currentDate.equals(DateUtils.formatDate(videoRecommend.getCreateTime()))) {
                    videoDao.incrDailyRecommendCount(videoId, currentDate, -1);
                }
            }
        }
    }

    @Override
    public boolean hasRecommended(int videoId, Integer userId) {
        return videoDao.getVideoRecommend(videoId, userId) != null;
    }

    @Override
    public VideoTag getTag(int tagId) {
        return videoDao.getTag(tagId);
    }

    @Override
    public Paginater<Object> paginateVideos(VideoCriteria criteria, Paginater<Object> paginater) {
        long videoCount = videoDao.getVideoCount(criteria);
        List<Video> videoList = videoDao.getVideoList(criteria, paginater);
        paginater.setTotalCount(videoCount);
        paginater.setResults(new ArrayList<Object>(videoList));
        return paginater;
    }

    @Override
    public List<Video> findTopRecommendVideos(int limit) {
        return videoDao.findTopRecommendVideos(limit);
    }

    @Override
    public void enrichTags(List videos) {
        if (videos != null && !videos.isEmpty()) {
            List<Integer> videoIds = new ArrayList<Integer>();
            for (Object video : videos) {
                videoIds.add(((Video) video).getId());
            }
            Map<Integer, List<VideoTag>> tagMap = getTags(videoIds);
            for (Object video : videos) {
                ((Video) video).setTags(tagMap.get(((Video) video).getId()));
            }
        }
    }

}
