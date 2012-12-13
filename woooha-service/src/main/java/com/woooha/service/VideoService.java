package com.woooha.service;

import com.woooha.entity.core.Paginater;
import com.woooha.entity.video.Video;
import com.woooha.entity.video.VideoScoreStats;
import com.woooha.entity.video.VideoTag;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-25
 * Time: 上午11:04
 * To change this template use File | Settings | File Templates.
 */
public interface VideoService {

    List<Video> findTopHotVideos();

    /**
     * 一周推荐top视频
     * @param limit
     * @return
     */
    List<Video> findLatestRecommendVideos(int limit);

    List<Video> findTopNewVideos(int limit);

    List<VideoTag> getVideoTags();

    Video findById(int id);

    List<VideoTag> getTags(int videoId);

    List<VideoScoreStats> getScoreStats(int videoId);

    void score(int videoId, int userId, int score);

    Integer getUserScore(int videoId, int userId);

    void recommend(int videoId, int userId);

    void unrecommend(int videoId, int userId);

    boolean hasRecommended(int videoId, Integer userId);

    VideoTag getTag(int tagId);

    Paginater<Object> paginateVideos(VideoCriteria criteria, Paginater<Object> paginater);
}
