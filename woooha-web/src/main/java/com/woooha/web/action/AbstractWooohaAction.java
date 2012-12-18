package com.woooha.web.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-4
 * Time: 下午2:10
 * To change this template use File | Settings | File Templates.
 */
public class AbstractWooohaAction extends ActionSupport implements ServletRequestAware, Preparable {

    protected Logger logger = LoggerFactory.getLogger(getClass());

    protected HttpServletRequest request;
    protected InputStream inputStream;
    private String module;

    public AbstractWooohaAction(String module) {
        this.module = module;
    }

    protected void createStreamResponse(String content) {
        try {
            this.inputStream = new ByteArrayInputStream(content.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            //never be here
            throw new RuntimeException("Create content inputstream[response fetch content from] failed.", e);
        }
    }

    @Override
    public void prepare() throws Exception {
    }

    protected String ajaxSucceedResult() {
        createStreamResponse("{}");
        return SUCCESS;
    }

    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getModule() {
        return module;
    }

}
