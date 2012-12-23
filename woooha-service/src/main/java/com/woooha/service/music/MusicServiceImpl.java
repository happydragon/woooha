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
package com.woooha.service.music;

import com.woooha.dao.MusicDao;
import com.woooha.entity.music.LyricRow;
import com.woooha.entity.music.Music;
import com.woooha.entity.music.MusicCategory;
import com.woooha.service.MusicService;
import org.apache.commons.lang.StringUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

/**
 * TODO Comment of The Class
 *
 * @author danson.liu
 */
public class MusicServiceImpl implements MusicService {

    private static final Logger logger = LoggerFactory.getLogger(MusicServiceImpl.class);

    @Autowired
    private MusicDao musicDao;

    @Override
    public List<MusicCategory> getAllCategory() {
        return musicDao.getAllCategory();
    }

    public List<MusicCategory> getRecommendCategoris() {
        List<MusicCategory> recommends = new ArrayList<MusicCategory>();
        for (MusicCategory category : getAllCategory()) {
            if (category.isRecommend()) {
                recommends.add(category);
            }
        }
        return recommends;
    }

    @Override
    public Map<MusicCategory, List<Music>> getHotMusics() {
        List<MusicCategory> recommendCategoris = getRecommendCategoris();
        if (recommendCategoris.isEmpty()) {
            return Collections.emptyMap();
        }
        Map<MusicCategory, List<Music>> resultMap = new LinkedHashMap<MusicCategory, List<Music>>();
        for (MusicCategory category : recommendCategoris) {
            List<Music> hotMusics = musicDao.getHotMusics(category.getId());
            if (!hotMusics.isEmpty()) {
                resultMap.put(category, hotMusics);
            }
        }
        return resultMap;
    }

    @Override
    public List<Music> getRecommendMusics() {
        return musicDao.getRecommendMusics();
    }

    @Override
    public List<LyricRow> getLyric(int musicId) {
        String lyric = musicDao.getLyric(musicId);
        if (StringUtils.isNotBlank(lyric)) {
            try {
                JSONArray lyricArr = new JSONArray(lyric);
                if (lyricArr.length() > 0) {
                    List<LyricRow> lyricRows = new ArrayList<LyricRow>();
                    for (int i = 0; i < lyricArr.length(); i++) {
                        JSONObject lyricObj = (JSONObject) lyricArr.get(i);
                        String tag = (String) lyricObj.keys().next();
                        String content = lyricObj.getString(tag);
                        lyricRows.add(new LyricRow(tag, content));
                    }
                    return lyricRows;
                }
            } catch (JSONException e) {
                logger.error("Music[id=" + musicId + "]'s lyric content is illegal format.", e);
            }
        }
        return Collections.emptyList();
    }

    public void setMusicDao(MusicDao musicDao) {
        this.musicDao = musicDao;
    }
}
