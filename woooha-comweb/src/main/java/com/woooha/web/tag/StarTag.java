package com.woooha.web.tag;

import org.apache.struts2.views.jsp.StrutsBodyTagSupport;

import javax.servlet.jsp.JspException;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-11-25
 * Time: 下午1:37
 * To change this template use File | Settings | File Templates.
 */
public class StarTag extends StrutsBodyTagSupport {

    private String score;

    @Override
    public int doStartTag() throws JspException {
        float scoreval = (Float) findValue(score, Float.class);
        int round = Math.round(scoreval);
        int star = round * 5;
        try {
            pageContext.getOut().write("<span class=\"allstar" + star + "\"></span>");
        } catch (IOException e) {
        }
        return SKIP_BODY;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }
}
