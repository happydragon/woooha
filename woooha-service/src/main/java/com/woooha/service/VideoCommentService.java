package com.woooha.service;

import com.woooha.entity.video.VideoComment;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-25
 * Time: 上午11:04
 * To change this template use File | Settings | File Templates.
 */
public interface VideoCommentService {

    List<VideoComment> findLatestComments(int limit);
}
