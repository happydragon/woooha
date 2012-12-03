package com.woooha.service;

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

    List<Video> findTopRecommendVideos(int limit);

    List<Video> findTopNewVideos(int limit);

    List<VideoTag> getVideoTags();

    Video findById(int id);

    List<VideoTag> getTags(int videoId);

    List<VideoScoreStats> getScoreStats(int videoId);
}
