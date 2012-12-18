package com.woooha.service.core;

import com.woooha.dao.SystemConfigDao;
import com.woooha.service.SystemConfigService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-16
 * Time: 下午7:55
 * To change this template use File | Settings | File Templates.
 */
public class SystemConfigServiceImpl implements SystemConfigService {

    @Autowired
    private SystemConfigDao systemConfigDao;
    private static Map<String, String> configMap;

    public Map<String, String> getConfigs() {
        if (configMap == null) {
            configMap = systemConfigDao.getConfigs();
        }
        return configMap;
    }

    @Override
    public String getConfig(String key) {
        return getConfigs().get(key);
    }

    @Override
    public List<String> getListConfig(String key) {
        String configVal = getConfig(key);
        if (configVal == null) {
            return Collections.emptyList();
        }
        String[] fragments = StringUtils.split(configVal, ",，");
        return Arrays.asList(fragments);
    }

}
