package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Event {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String description;
	private Date day;
	private Date beginTime;
	private Date endTime;
	
	@ManyToOne
	private Coloc coloc;
	
	public Event() {
		super();
		this.description = "";
		this.day = null;
		this.beginTime = null;
		this.endTime = null;
		this.coloc = null;
	}
	
	public Event(String description, Date day, Date beginTime) {
		super();
		this.description = description;
		this.day = day;
		this.beginTime = beginTime;
		this.endTime = null;
		this.coloc = null;
	}
	
	public Event(String description, Date day, Date beginTime, Date endTime) {
		super();
		this.description = description;
		this.day = day;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.coloc = null;
	}

	public Coloc getColoc() {
		return coloc;
	}

	public void setColoc(Coloc coloc) {
		this.coloc = coloc;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}
	
	public static void main(String[] args) {
		SimpleDateFormat sdfTime = new SimpleDateFormat("hh:mm");
		Date d = null;
		try {
			d = sdfTime.parse("9:35");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar cal = Calendar.getInstance();
	    cal.setTime(d);
	    int min = cal.get(Calendar.MINUTE);
	    System.out.println(min);
	    System.out.println((new String("01:34")).substring(0,5));
	}
}
