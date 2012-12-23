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
package com.woooha.web.tag;

import com.woooha.service.SystemConfigService;
import com.woooha.util.UrlUtil;
import org.apache.commons.codec.binary.Base64;
import org.apache.struts2.views.jsp.StrutsBodyTagSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * TODO Comment of The Class
 *
 * @author danson.liu
 */
public class StaticTag extends StrutsTagSupport {
    private static final Logger logger = LoggerFactory.getLogger(StaticTag.class);

    private String type;    //video-img, video-avi, music-img, music-mp3

    private String resource;

    private String outputBase64;

    @Autowired
    private SystemConfigService systemConfigService;

    @Override
    public int doFinalStartTag() throws JspException {
        String finalUrl = "";
        if (resource.startsWith("/res/")) {
            String staticServer = getStaticServer();
            finalUrl = staticServer + resource;
        } else {
            finalUrl = resource;
        }
        try {
            pageContext.getOut().write("true".equalsIgnoreCase(outputBase64) ? toBase64(finalUrl): finalUrl);
        } catch (IOException e) {
            logger.error("Write static resource[" + finalUrl + "] failed.", e);
        }
        return SKIP_BODY;
    }

    private String toBase64(String str) throws UnsupportedEncodingException {
        return new String(Base64.encodeBase64(str.getBytes("UTF-8")));
    }

    private String getStaticServer() {
        String staticServer = null;
        if (type != null) {
            staticServer = systemConfigService.getConfig(type + ".server");
        }
        if (staticServer == null) {
            staticServer = systemConfigService.getConfig("static.server");
        }
        if (staticServer == null) {
            staticServer = UrlUtil.getFullContextPath((HttpServletRequest) pageContext.getRequest());
        }
        return staticServer.endsWith("/") ? staticServer.substring(0, staticServer.length() - 1) : staticServer;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setResource(String resource) {
        this.resource = resource;
    }

    public void setSystemConfigService(SystemConfigService systemConfigService) {
        this.systemConfigService = systemConfigService;
    }

    public void setOutputBase64(String outputBase64) {
        this.outputBase64 = outputBase64;
    }
}
