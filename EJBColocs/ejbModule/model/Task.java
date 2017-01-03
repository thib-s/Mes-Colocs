package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Task {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private User doer;/** the user who has to do the task */
	private Date doBefore;/** the user has to do the task before this date */
	private boolean done; /** indicate whenever the task is done */
	
	public User getDoer() {
		return doer;
	}
	public void setDoer(User doer) {
		this.doer = doer;
	}
	public Date getDoBefore() {
		return doBefore;
	}
	public void setDoBefore(Date doBefore) {
		this.doBefore = doBefore;
	}
	public boolean isDone() {
		return done;
	}
	public void setDone(boolean done) {
		this.done = done;
	}
	
	

}
