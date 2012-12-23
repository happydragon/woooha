package com.woooha.service;

import com.woooha.entity.music.LyricRow;
import com.woooha.entity.music.Music;
import com.woooha.entity.music.MusicCategory;

import java.util.List;
import java.util.Map;

/**
 * TODO Comment of The Class
 *
 * @author danson.liu
 */
public interface MusicService {

    List<MusicCategory> getAllCategory();

    Map<MusicCategory, List<Music>> getHotMusics();

    List<Music> getRecommendMusics();

    List<LyricRow> getLyric(int musicId);

}
