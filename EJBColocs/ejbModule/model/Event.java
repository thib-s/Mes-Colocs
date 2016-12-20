package model;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Event {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String intitule;
	private Date dateDebut;
	private Date dateFin;
	
	public Event() {
		super();
		this.intitule = "";
		this.dateDebut = null;
		this.dateFin = null;
	}
	
	public Event(String intitule, Date dateDebut, Date dateFin) {
		super();
		this.intitule = intitule;
		this.dateDebut = dateDebut;
		this.dateFin = dateFin;
	}

	public String getIntitule() {
		return intitule;
	}

	public void setIntitule(String intitule) {
		this.intitule = intitule;
	}

	public Date getDateDebut() {
		return dateDebut;
	}

	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
	}

	public Date getDateFin() {
		return dateFin;
	}

	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}

}
