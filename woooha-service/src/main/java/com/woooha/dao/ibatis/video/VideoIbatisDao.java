package com.woooha.dao.ibatis.video;

import com.woooha.dao.VideoDao;
import com.woooha.entity.core.Paginater;
import com.woooha.entity.video.*;
import com.woooha.service.VideoCriteria;
import com.woooha.util.Maps;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
    public List<Video> findLatestRecommendVideos(int limit) {
        List<Video> recommendVideos = new ArrayList<Video>();
        Date currentDate = new Date();
        Date weekBefore = DateUtils.addDays(currentDate, -7);
        String currentDateStr = com.woooha.util.DateUtils.formatDate(currentDate);
        String weekBeforeStr = com.woooha.util.DateUtils.formatDate(weekBefore);
        List<Integer> videoIds = getSqlMapClientTemplate().queryForList("Video.findLatestRecommendList",
                Maps.entry("from", weekBeforeStr).entry("to", currentDateStr).entry("limit", limit).get());
        if (!videoIds.isEmpty()) {
            Map<Integer, Video> videosFound = findByIds(videoIds);
            for (Integer videoId : videoIds) {
                recommendVideos.add(videosFound.get(videoId));
            }
        }
        int remainder = limit - recommendVideos.size();
        if (remainder > 0) {
            recommendVideos.addAll(findTopRecommendVideos(remainder, videoIds));
        }
        return recommendVideos;
    }

    private List<Video> findTopRecommendVideos(int limit, List<Integer> excludeIds) {
        return getSqlMapClientTemplate().queryForList("Video.findTopRecommendVideos", Maps.entry("limit", limit)
                .entry("excludeIds", excludeIds).get());
    }

    @Override
    public List<Video> findTopNewVideos(int limit) {
        return getSqlMapClientTemplate().queryForList("Video.findTopNewVideos", limit);
    }

    @Override
    public Video findById(int id) {
        return (Video) getSqlMapClientTemplate().queryForObject("Video.findById", id);
    }

    public Map<Integer, Video> findByIds(List<Integer> ids) {
        return getSqlMapClientTemplate().queryForMap("Video.findByIds", ids, "id");
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
    public VideoScore findScore(int videoId, int userId) {
        return (VideoScore) getSqlMapClientTemplate().queryForObject("Video.findScore", Maps.entry("videoId", videoId)
                .entry("userId", userId).get());
    }

    @Override
    public void decrScoreStats(int videoId, int score) {
        getSqlMapClientTemplate().update("Video.decrScoreStats", Maps.entry("videoId", videoId).entry("score", score).get());
    }

    @Override
    public void incrScoreStats(int videoId, int score) {
        getSqlMapClientTemplate().update("Video.incrScoreStats", Maps.entry("videoId", videoId).entry("score", score).get());
    }

    @Override
    public void updateScore(int videoId, int userId, int score) {
        getSqlMapClientTemplate().update("Video.updateScore", Maps.entry("videoId", videoId).entry("userId", userId)
                .entry("score", score).get());
    }

    @Override
    public void insertScore(int videoId, int userId, int score) {
        getSqlMapClientTemplate().insert("Video.insertScore", Maps.entry("videoId", videoId).entry("userId", userId)
                .entry("score", score).get());
    }

    @Override
    public Float getAvgScoreFromStats(int videoId) {
        return (Float) getSqlMapClientTemplate().queryForObject("Video.getAvgScoreFromStats", videoId);
    }

    @Override
    public void updateUserScore(int videoId, float score) {
        getSqlMapClientTemplate().update("Video.updateUserScore", Maps.entry("videoId", videoId).entry("score", score).get());
    }

    @Override
    public void incrUserScoreCount(int videoId) {
        getSqlMapClientTemplate().update("Video.incrUserScoreCount", videoId);
    }

    @Override
    public Integer getUserScore(int videoId, int userId) {
        return (Integer) getSqlMapClientTemplate().queryForObject("Video.getScoreByUser", Maps.entry("videoId", videoId)
                .entry("userId", userId).get());
    }

    @Override
    public int insertRecommend(VideoRecommend recommend) {
        return getSqlMapClientTemplate().update("Video.insertRecommend", recommend);
    }

    @Override
    public int deleteRecommend(int videoId, int userId) {
        return getSqlMapClientTemplate().delete("Video.deleteRecommend", Maps.entry("videoId", videoId)
                .entry("userId", userId).get());
    }

    @Override
    public void incrRecommendCount(int videoId, int increment) {
        getSqlMapClientTemplate().update("Video.incrRecommendCount", Maps.entry("videoId", videoId)
                .entry("increment", increment).get());
    }

    @Override
    public VideoRecommend getVideoRecommend(int videoId, Integer userId) {
        return (VideoRecommend) getSqlMapClientTemplate().queryForObject("Video.getVideoRecommend", Maps.entry("videoId", videoId)
                .entry("userId", userId).get());
    }

    @Override
    public void incrDailyRecommendCount(int videoId, String date, int increment) {
        getSqlMapClientTemplate().update("Video.incrDailyRecommendCount", Maps.entry("videoId", videoId).entry("date", date)
                .entry("increment", increment).get());
    }

    @Override
    public VideoTag getTag(int tagId) {
        return (VideoTag) getSqlMapClientTemplate().queryForObject("Video.getTagById", tagId);
    }

    @Override
    public long getVideoCount(VideoCriteria criteria) {
        return (Long) getSqlMapClientTemplate().queryForObject("Video.getVideoCount", criteria);
    }

    @Override
    public List<Video> getVideoList(VideoCriteria criteria, Paginater<Object> paginater) {
        return getSqlMapClientTemplate().queryForList("Video.getVideoList", Maps.entry("criteria", criteria)
                .entry("paginater", paginater).get());
    }

    @Override
    public List<VideoTag> getVideoTags() {
        return getSqlMapClientTemplate().queryForList("Video.getAllVideoTags");
    }

}
