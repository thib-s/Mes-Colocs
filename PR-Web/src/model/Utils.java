package model;

import java.util.Calendar;

public class Utils {

	public static String intToDay(int num) {
		switch (num) {
			case Calendar.SUNDAY:
				return "Sunday";
			case Calendar.MONDAY:
				return "Monday";
			case Calendar.TUESDAY:
				return "Tuesday";
			case Calendar.WEDNESDAY:
				return "Wednesday";
			case Calendar.THURSDAY:
				return "Thursday";
			case Calendar.FRIDAY:
				return "Friday";
			case Calendar.SATURDAY:
				return "Saturday";
			default:
				return "Error";
		}
	}
	
	public static String intToMonth(int num) {
		switch (num) {
			case Calendar.JANUARY:
				return "January";
			case Calendar.FEBRUARY:
				return "February";
			case Calendar.MARCH:
				return "March";
			case Calendar.APRIL:
				return "April";
			case Calendar.MAY:
				return "May";
			case Calendar.JUNE:
				return "June";
			case Calendar.JULY:
				return "July";
			case Calendar.AUGUST:
				return "August";
			case Calendar.SEPTEMBER:
				return "September";
			case Calendar.OCTOBER:
				return "October";
			case Calendar.NOVEMBER:
				return "November";
			case Calendar.DECEMBER:
				return "December";
			default:
				return "Error";
		}
	}
	
	public static String format(int time) {
		String res = null;
		if (time >= 0 && time < 10) {
			res = "0" + time;
		} else {
			res = Integer.toString(time);
		}
		return res;
	}
	
	public static String formatDay(String input) {
		String res;
		switch(input.toLowerCase().substring(0, 3)) {
			case "mon":
				res = "Monday";
			case "tue":
				res = "Tuesday";
			case "wed":
				res = "Wednesday";
			case "thu":
				res = "Thursday";
			case "fri":
				res = "Friday";
			case "sat":
				res = "Saturday";
			case "sun":
				res = "Sunday";
			default:
				res = "Unknown";
		}
		return res;	
	}
	
}
