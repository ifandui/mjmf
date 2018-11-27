package com.extr.util;

public class StringUtils {

	public static boolean isBlank(String ip) {
		if("".equals(ip)||ip==null)
			return true;		
		return false;
	}

}
