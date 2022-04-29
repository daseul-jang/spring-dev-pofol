package com.jds.web.util;

import java.util.Random;

public class TempKey {
	private int size;
	private boolean lowerCheck;
	
	public String getKey(int size, boolean lowerCheck) {
		this.size = size;
		this.lowerCheck = lowerCheck;
		return init();
	}

	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		
		int num = 0;
		
		do {
			num = ran.nextInt(75) + 48;
			
			// 아스키코드 참조
			if((num >= 48 && num <= 57) || // 0~9 
				(num >= 65 && num <= 90) || // A~Z
				(num >= 97 && num <= 122 )) { // a~z
				sb.append((char)num);
			} else {
				continue;
			}
		} while(sb.length() < size);
		
		if(lowerCheck) {
			return sb.toString().toLowerCase();
		}
		
		return sb.toString();
	}
}
