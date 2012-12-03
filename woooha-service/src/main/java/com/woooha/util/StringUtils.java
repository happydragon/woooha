package com.woooha.util;

import java.io.UnsupportedEncodingException;
import static org.apache.commons.lang.StringUtils.isEmpty;


/**
 * @author danson.liu
 *
 */
public class StringUtils {
    
    public static final String CUT_EXT_SYMBOL = "...";

	public static String cutString(String inputString, int byteCount) {
		return cutString(inputString, byteCount, CUT_EXT_SYMBOL);
	}
	
	public static String cutString(String inputString, int byteCount, String nfix) {
		if (isEmpty(inputString)) {
			return "";
		}
		try {
			if (byteCount < 0) {
				return nfix;
			} else if (byteCount < inputString.getBytes("gbk").length && byteCount >= 0) {
				int count = byteCount - 1;
				byte[] bytes = inputString.getBytes("gbk");
				int chinessCharCount = 0;
				while (count >= 0 && !isLetter(bytes[count])) {
					++chinessCharCount;
					count--;
				}
				if (chinessCharCount % 2 == 1) {
					count = byteCount - 1;
				} else {
					count = byteCount;
				}
				String output = new String(bytes, 0, count, "gbk");
				output = inputString.substring(0, output.length());
				return output + (nfix != null ? nfix : "");
			} else {
				return inputString;
			}
		} catch (UnsupportedEncodingException e) {
			return inputString;
		}
	}

	private static boolean isLetter(byte c) {
		int k = 0x80;
		return (c >= 0 && c / k == 0) ? true : false;
	}
	
}
