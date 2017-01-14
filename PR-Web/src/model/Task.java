package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Task {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private User doer;/** the user who has to do the task */
	private String doBefore;/** the user has to do the task before this day */
	private String description; /** the description of the task */
	private boolean done; /** indicate whenever the task is done */
	
	@ManyToOne
	private Coloc coloc;

	public Task() {
		super();
		this.doer = null;
		this.doBefore = null;
		this.description = null;
		this.done = false;
		this.coloc = null;
	}
	
	public Task(User doer, String doBefore, String description) {
		super();
		this.doer = doer;
		this.doBefore = Utils.formatDay(doBefore);
		this.description = description;
		this.done = false;
		this.coloc = null;
	}

	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public User getDoer() {
		return doer;
	}
	
	public void setDoer(User doer) {
		this.doer = doer;
	}
	
	public String getDoBefore() {
		return doBefore;
	}
	
	public void setDoBefore(String doBefore) {
		this.doBefore = Utils.formatDay(doBefore);
	}
	
	public Coloc getColoc() {
		return coloc;
	}

	public void setColoc(Coloc coloc) {
		this.coloc = coloc;
	}
	
	public boolean isDone() {
		return done;
	}
	
	public void setDone(boolean done) {
		this.done = done;
	}

}
