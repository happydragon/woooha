package com.woooha.util;

import org.apache.commons.lang.time.FastDateFormat;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-7
 * Time: 上午12:18
 * To change this template use File | Settings | File Templates.
 */
public class DateUtils {

    private static final FastDateFormat YYMMDD = FastDateFormat.getInstance("yyyy-MM-dd");

    /**
     * return "yyyy-MM-dd" format string
     * @param date
     * @return
     */
    public static String formatDate(Date date) {
        return YYMMDD.format(date);
    }

    public static String currentFormatDate() {
        return formatDate(new Date());
    }

}
