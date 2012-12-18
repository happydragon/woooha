package com.woooha.dao;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-16
 * Time: 下午7:56
 * To change this template use File | Settings | File Templates.
 */
public interface SystemConfigDao {
    Map<String,String> getConfigs();
}
