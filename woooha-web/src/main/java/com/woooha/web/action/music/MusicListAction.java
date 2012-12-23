package com.woooha.web.action.music;

import com.woooha.Constants;
import com.woooha.entity.music.LyricRow;
import com.woooha.entity.music.Music;
import com.woooha.entity.music.MusicCategory;
import com.woooha.service.MusicService;
import com.woooha.web.action.AbstractWooohaAction;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-17
 * Time: 下午3:11
 * To change this template use File | Settings | File Templates.
 */
public class MusicListAction extends AbstractWooohaAction {

    @Autowired
    private MusicService musicService;

    private List<Music> recommendMusics;
    private Map<MusicCategory, List<Music>> hotMusics;
    private List<LyricRow> lyricRows;

    public MusicListAction() {
        super(Constants.MODULE_MUSIC);
    }

    public String index() throws JSONException {
        recommendMusics = musicService.getRecommendMusics();
        hotMusics = musicService.getHotMusics();
        if (!recommendMusics.isEmpty()) {
            Integer musicId = recommendMusics.get(0).getId();
            lyricRows = musicService.getLyric(musicId);
        }
        return SUCCESS;
    }

    public List<Music> getRecommendMusics() {
        return recommendMusics;
    }

    public Map<MusicCategory, List<Music>> getHotMusics() {
        return hotMusics;
    }

    public List<LyricRow> getLyricRows() {
        return lyricRows;
    }

}
