package com.woooha.service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-16
 * Time: 下午7:54
 * To change this template use File | Settings | File Templates.
 */
public interface SystemConfigService {

    String getConfig(String key);

    List<String> getListConfig(String key);

}
