/**
 * File Created at 12-12-18
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
package com.woooha;

import org.apache.commons.codec.binary.Base64;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;

/**
 * TODO Comment of The Class
 *
 * @author danson.liu
 */
public class FooTest {

    public static void main(String[] args) throws UnsupportedEncodingException, JSONException {
        JSONArray result = new JSONArray("[{}]");
        System.out.println(result.get(0).getClass());
        byte[] bytes = "http://192.168.1.5:3477/woooha/upload/music/x13939426.mp3".getBytes("UTF-8");
        System.out.println(new String(Base64.encodeBase64(bytes)));
        bytes = "http://192.168.1.5:3477/woooha/upload/music/x13850595.mp3".getBytes("UTF-8");
        System.out.println(new String(Base64.encodeBase64(bytes)));
        bytes = "http://192.168.1.5:3477/woooha/upload/music/x13918712.mp3".getBytes("UTF-8");
        System.out.println(new String(Base64.encodeBase64(bytes)));
    }

}
