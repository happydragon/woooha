package com.woooha.dao.ibatis.video;

import com.woooha.dao.VideoDao;
import com.woooha.entity.video.Video;
import com.woooha.entity.video.VideoScoreStats;
import com.woooha.entity.video.VideoTag;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-25
 * Time: 上午11:01
 * To change this template use File | Settings | File Templates.
 */
public class VideoIbatisDao extends SqlMapClientDaoSupport implements VideoDao {

    @Override
    public List<Video> findTopHotVideos() {
        return getSqlMapClientTemplate().queryForList("Video.findTopHotList");
    }

    @Override
    public List<Video> findTopRecommendVideos(int limit) {
        return getSqlMapClientTemplate().queryForList("Video.findTopRecommendList", limit);
    }

    @Override
    public List<Video> findTopNewVideos(int limit) {
        return getSqlMapClientTemplate().queryForList("Video.findTopNewVideos", limit);
    }

    @Override
    public Video findById(int id) {
        return (Video) getSqlMapClientTemplate().queryForObject("Video.findById", id);
    }

    @Override
    public List<VideoTag> getTags(int videoId) {
        return getSqlMapClientTemplate().queryForList("Video.getVideoTags", videoId);
    }

    @Override
    public List<VideoScoreStats> getScoreStats(int videoId) {
        return getSqlMapClientTemplate().queryForList("Video.getScoreStats", videoId);
    }

    @Override
    public List<VideoTag> getVideoTags() {
        return getSqlMapClientTemplate().queryForList("Video.getAllVideoTags");
    }

}
