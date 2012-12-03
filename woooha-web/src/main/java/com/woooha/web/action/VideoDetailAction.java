/**
 *
 */
package com.woooha.web.action;

import com.opensymphony.xwork2.ActionSupport;
import com.woooha.entity.video.Video;
import com.woooha.entity.video.VideoComment;
import com.woooha.entity.video.VideoScoreStats;
import com.woooha.entity.video.VideoTag;
import com.woooha.service.VideoCommentService;
import com.woooha.service.VideoService;
import com.woooha.vo.VideoScoreStatsVo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

/**
 * @author jian.liu
 */
@SuppressWarnings("serial")
public class VideoDetailAction extends ActionSupport {

    @Autowired
    private VideoService videoService;
    @Autowired
    private VideoCommentService videoCommentService;

    private int id;
    private Video video;
    private List<VideoTag> tags;
    private Map<String, VideoScoreStatsVo> scoreStatsMap;
    private List<VideoComment> comments;

    public String detail() {
        this.video = videoService.findById(id);
        this.tags = videoService.getTags(id);
        this.comments = videoCommentService.getLatestComments(id, 30);
        buildScoreStatsMap();
        return SUCCESS;
    }

    private void buildScoreStatsMap() {
        scoreStatsMap = new HashMap<String, VideoScoreStatsVo>();
        List<VideoScoreStats> statsList = videoService.getScoreStats(id);
        Map<Integer, VideoScoreStats> statsMap = new HashMap<Integer, VideoScoreStats>();
        int totalCount = 0;
        for (VideoScoreStats stats : statsList) {
            statsMap.put(stats.getScore(), stats);
            totalCount += stats.getCount();
        }
        for (int i = 2; i <= 10; i += 2) {
            if (statsMap.containsKey(i)) {
                VideoScoreStats scoreStats = statsMap.get(i);
                float percentage = totalCount > 0 ? Math.round(scoreStats.getCount() * 1000.0f / totalCount) / 10.0f : 0;
                scoreStatsMap.put(String.valueOf(i), new VideoScoreStatsVo(scoreStats, percentage));
            } else {
                scoreStatsMap.put(String.valueOf(i), new VideoScoreStatsVo(new VideoScoreStats(id, i, 0), 0));
            }
        }

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Video getVideo() {
        return video;
    }

    public List<VideoTag> getTags() {
        return tags;
    }

    public void setTags(List<VideoTag> tags) {
        this.tags = tags;
    }

    public Map<String, VideoScoreStatsVo> getScoreStatsMap() {
        return scoreStatsMap;
    }

    public List<VideoComment> getComments() {
        return comments;
    }
}
