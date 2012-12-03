package com.woooha.dao;

import com.woooha.entity.video.VideoComment;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-25
 * Time: 上午10:57
 * To change this template use File | Settings | File Templates.
 */
public interface VideoCommentDao {

    List<VideoComment> findLatestComments(int limit);

    List<VideoComment> findLatestComments(int videoId, int limit);
}
