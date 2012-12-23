package com.woooha.dao;

import com.woooha.entity.music.Music;
import com.woooha.entity.music.MusicCategory;

import java.util.List;

/**
 * TODO Comment of The Class
 *
 * @author danson.liu
 */
public interface MusicDao {

    List<Music> getRecommendMusics();

    List<MusicCategory> getAllCategory();

    List<Music> getHotMusics(Integer categoryId);

    String getLyric(int musicId);

}
