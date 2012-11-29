package com.woooha.dao;

import com.woooha.entity.video.Video;
import com.woooha.entity.video.VideoTag;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-25
 * Time: 上午10:56
 * To change this template use File | Settings | File Templates.
 */
public interface VideoDao {

    List<Video> findTopHotVideos();

    List<Video> findTopRecommendVideos(int limit);

    List<VideoTag> getVideoTags();

    List<Video> findTopNewVideos(int limit);

    Video findById(int id);
}
