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
package com.woooha.util;

import javax.servlet.http.HttpServletRequest;

/**
 * TODO Comment of The Class
 *
 * @author danson.liu
 */
public class UrlUtil {

    public static String getFullContextPath(HttpServletRequest request) {
        StringBuilder url = new StringBuilder();
        String scheme = request.getScheme();
        int serverPort = request.getServerPort();
        if (serverPort < 0) {
            serverPort = 80;
        }
        url.append(scheme);
        url.append("://");
        url.append(request.getServerName());
        if ((scheme.equals("http") && (serverPort != 80))
                || (scheme.equals("https") && (serverPort != 443))) {
            url.append(':');
            url.append(serverPort);
        }
        url.append(request.getContextPath());
        return url.toString();
    }

}
