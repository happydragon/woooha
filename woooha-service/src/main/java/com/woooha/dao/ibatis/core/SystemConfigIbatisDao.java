package com.woooha.dao.ibatis.core;

import com.woooha.dao.SystemConfigDao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-16
 * Time: 下午7:56
 * To change this template use File | Settings | File Templates.
 */
public class SystemConfigIbatisDao extends SqlMapClientDaoSupport implements SystemConfigDao {

    @Override
    public Map<String, String> getConfigs() {
        return getSqlMapClientTemplate().queryForMap("System.getAllConfig", null, "key", "value");
    }

}
