/**
 *
 */
package com.woooha.web.action.video;

import com.woooha.Constants;
import com.woooha.entity.core.Paginater;
import com.woooha.entity.video.Video;
import com.woooha.entity.video.VideoComment;
import com.woooha.entity.video.VideoScoreStats;
import com.woooha.entity.video.VideoTag;
import com.woooha.service.VideoCommentService;
import com.woooha.service.VideoService;
import com.woooha.vo.VideoScoreStatsVo;
import com.woooha.web.action.AbstractWooohaAction;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

/**
 * @author jian.liu
 */
@SuppressWarnings("serial")
public class VideoDetailAction extends AbstractWooohaAction {

    @Autowired
    private VideoService videoService;
    @Autowired
    private VideoCommentService videoCommentService;

    private int id;
    private Video video;
    private Integer currentUserScore;
    private boolean recommend;
    private boolean recommended;
    private VideoComment comment;
    private int score;
    private List<VideoTag> tags;
    private Map<String, VideoScoreStatsVo> scoreStatsMap;
    private Paginater<VideoComment> commentPaginater = new Paginater<VideoComment>(20);

    public VideoDetailAction() {
        super(Constants.MODULE_VIDEO);
    }

    public String detail() {
        this.video = videoService.findById(id);
        this.tags = videoService.getTags(id);
        this.commentPaginater = videoCommentService.paginateComments(id, commentPaginater);
        buildScoreStatsInfo();
        return SUCCESS;
    }

    public String makeScore() {
        int userId = 1; //TODO change to current userId
        videoService.score(id, userId, score);
        this.video = videoService.findById(id);
        buildScoreStatsInfo();
        return SUCCESS;
    }

    public String recommend() {
        int userId = 1;
        if (recommend) {
            videoService.recommend(id, userId);
        } else {
            videoService.unrecommend(id, userId);
        }
        this.video = videoService.findById(id);
        buildScoreStatsInfo();
        return SUCCESS;
    }

    public String comments() {
        this.commentPaginater = videoCommentService.paginateComments(id, commentPaginater);
        return SUCCESS;
    }

    public String addComment() {
        checkComment();
        comment.setVideoId(id);
        comment.setUserId(1);   //TODO change to current userId
        videoCommentService.create(comment);
        return comments();
    }

    private void checkComment() {
        if (comment.getContent().length() > 200) {
            throw new RuntimeException("评论内容不超过200字.");
        }
    }

    private void buildScoreStatsInfo() {
        Integer userId = 1; //TODO change to current userId
        if (userId != null) {
            currentUserScore = videoService.getUserScore(id, userId);
            recommended = videoService.hasRecommended(id, userId);
        }
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

    public VideoComment getComment() {
        return comment;
    }

    public void setComment(VideoComment comment) {
        this.comment = comment;
    }

    public Map<String, VideoScoreStatsVo> getScoreStatsMap() {
        return scoreStatsMap;
    }

    public Paginater<VideoComment> getCommentPaginater() {
        return commentPaginater;
    }

    public void setCommentPaginater(Paginater<VideoComment> commentPaginater) {
        this.commentPaginater = commentPaginater;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Integer getCurrentUserScore() {
        return currentUserScore;
    }

    public boolean isRecommended() {
        return recommended;
    }

    public void setRecommended(boolean recommended) {
        this.recommended = recommended;
    }

    public boolean isRecommend() {
        return recommend;
    }

    public void setRecommend(boolean recommend) {
        this.recommend = recommend;
    }
}
