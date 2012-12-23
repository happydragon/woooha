/**
 * File Created at 12-12-21
 *
 * Copyright 2010 dianping.com.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of
 * Dianping Company. ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with dianping.com.
 */
package com.woooha.dao.ibatis.music;

import com.woooha.dao.MusicDao;
import com.woooha.entity.music.Music;
import com.woooha.entity.music.MusicCategory;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.List;

/**
 * TODO Comment of The Class
 *
 * @author danson.liu
 */
public class MusicIbatisDao extends SqlMapClientDaoSupport implements MusicDao {

    @Override
    public List<Music> getHotMusics(Integer categoryId) {
        return getSqlMapClientTemplate().queryForList("Music.getHotMusics", categoryId);
    }

    @Override
    public String getLyric(int musicId) {
        return (String) getSqlMapClientTemplate().queryForObject("Music.getLyric", musicId);
    }

    @Override
    public List<Music> getRecommendMusics() {
        return getSqlMapClientTemplate().queryForList("Music.getRecommendMusics");
    }

    @Override
    public List<MusicCategory> getAllCategory() {
        return getSqlMapClientTemplate().queryForList("Music.getAllCategory");
    }

}
