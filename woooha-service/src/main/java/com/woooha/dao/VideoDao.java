package com.woooha.dao;

import com.woooha.entity.core.Paginater;
import com.woooha.entity.video.*;
import com.woooha.service.VideoCriteria;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-25
 * Time: 上午10:56
 * To change this template use File | Settings | File Templates.
 */
public interface VideoDao {

    List<Video> findTopHotVideos();

    List<Video> findLatestRecommendVideos(int limit);

    List<Video> findTopRecommendVideos(int limit);

    List<VideoTag> getVideoTags();

    List<Video> findTopNewVideos(int limit);

    Video findById(int id);

    List<VideoTag> getTags(int videoId);

    Map<Integer, List<VideoTag>> getTags(List<Integer> videoIds);

    List<VideoScoreStats> getScoreStats(int videoId);

    VideoScore findScore(int videoId, int userId);

    void decrScoreStats(int videoId, int score);

    void incrScoreStats(int videoId, int score);

    void updateScore(int videoId, int userId, int score);

    void insertScore(int videoId, int userId, int score);

    Float getAvgScoreFromStats(int videoId);

    void updateUserScore(int videoId, float score);

    void incrUserScoreCount(int videoId);

    Integer getUserScore(int videoId, int userId);

    int insertRecommend(VideoRecommend recommend);

    int deleteRecommend(int videoId, int userId);

    void incrRecommendCount(int videoId, int increment);

    VideoRecommend getVideoRecommend(int videoId, Integer userId);

    void incrDailyRecommendCount(int videoId, String date, int increment);

    VideoTag getTag(int tagId);

    long getVideoCount(VideoCriteria criteria);

    List<Video> getVideoList(VideoCriteria criteria, Paginater<Object> paginater);

}
