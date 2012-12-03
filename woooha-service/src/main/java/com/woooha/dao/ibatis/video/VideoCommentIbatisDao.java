package com.woooha.dao.ibatis.video;

import com.woooha.dao.VideoCommentDao;
import com.woooha.entity.video.VideoComment;
import com.woooha.util.Maps;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-25
 * Time: 上午11:02
 * To change this template use File | Settings | File Templates.
 */
public class VideoCommentIbatisDao extends SqlMapClientDaoSupport implements VideoCommentDao {

    @Override
    public List<VideoComment> findLatestComments(int limit) {
        return getSqlMapClientTemplate().queryForList("VideoComment.findLatestComments", limit);
    }

    @Override
    public List<VideoComment> findLatestComments(int videoId, int limit) {
        return getSqlMapClientTemplate().queryForList("VideoComment.findLatestVideoComments", Maps.entry("videoId", videoId).entry("limit", limit).get());
    }

}
