package com.korea.first;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class YoilTellerMVC {
	
	@RequestMapping("/getYoil")//getYoil?year=2024&month=7&day=1
	public String main(int year, int month, int day, Model model) throws IOException{		

	
		
		if(!isValid(year,month,day)) {
			return "yoilError";
		}
		
		char yoil = getYoil(year,month,day);
		
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("day",day);
		model.addAttribute("yoil",yoil);
		
		
		return "yoil";
			
	}
	
	
	private boolean isValid(int year, int month, int day) {
	    // year, month, day 중 하나라도 -1이면 false를 반환
	    if (year == 0 || month == 0 || day == 0) {
	        return false;
	    }

	    // month가 1부터 12 사이이고, day가 1부터 31 사이면 true를 반환
	    return (1 <= month && month <= 12) && (1 <= day && day <= 31);
	}
	
	private char getYoil(int year, int month, int day) {
	    Calendar cal = Calendar.getInstance();
	    cal.set(year, month - 1, day);

	    int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); // 일요일 1, 월요일 2, 화요일 3
	    char yoil = " 일월화수목금토".charAt(dayOfWeek);

	    return yoil;
	}
}
