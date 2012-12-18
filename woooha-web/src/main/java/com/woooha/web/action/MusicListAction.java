package com.woooha.web.action;

import com.woooha.Constants;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-17
 * Time: 下午3:11
 * To change this template use File | Settings | File Templates.
 */
public class MusicListAction extends AbstractWooohaAction {

    public MusicListAction() {
        super(Constants.MODULE_MUSIC);
    }

    public String index() {

        return SUCCESS;
    }

}
