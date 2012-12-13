package com.woooha.service.video;

import com.woooha.dao.VideoCommentDao;
import com.woooha.entity.core.Paginater;
import com.woooha.entity.video.VideoComment;
import com.woooha.service.VideoCommentService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-25
 * Time: 上午11:06
 * To change this template use File | Settings | File Templates.
 */
public class VideoCommentServiceImpl implements VideoCommentService {

    @Autowired
    private VideoCommentDao videoCommentDao;

    @Override
    public List<VideoComment> findLatestComments(int limit) {
        return videoCommentDao.findLatestComments(limit);
    }

    @Override
    public List<VideoComment> getLatestComments(int videoId, int limit) {
        return videoCommentDao.findLatestComments(videoId, limit);
    }

    @Override
    public Paginater<VideoComment> paginateComments(int videoId, Paginater<VideoComment> paginater) {
        long commentCount = videoCommentDao.getCommentCount(videoId);
        List<VideoComment> commentList = videoCommentDao.getCommentList(videoId, paginater);
        paginater.setTotalCount(commentCount);
        paginater.setResults(commentList);
        return paginater;
    }

    @Override
    public void create(VideoComment comment) {
        videoCommentDao.create(comment);
    }
}
