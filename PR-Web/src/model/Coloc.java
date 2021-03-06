/**
 * the model of a coloc
 */
package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity
public class Coloc  {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id_coloc;/** Id of a coloc (generated automatically)*/
	private String blazColoc;/** name for a coloc */
	private String passwordColoc; /** password of the coloc**/
	private String addressColoc; /** address of the coloc **/
	private String cityColoc; /** city of the coloc **/
	private String countryColoc; /** county of the coloc**/
	
	@OneToMany(mappedBy="myColoc")
	private Set<User> members;/** the users associated to a coloc */	
	@OneToMany(mappedBy="coloc", fetch=FetchType.EAGER, orphanRemoval=true)
	private List<Event> eventsList;/** various events associated with the coloc */
	@OneToMany(mappedBy="coloc", fetch=FetchType.EAGER, orphanRemoval=true)
	private List<Task> tasksList;/** tasks to do weekly */
	@OneToOne(cascade=CascadeType.ALL)
	private ShoppingList shoppingList;/** the shopping list associated to the coloc*/
	
	public Coloc(){
		this.blazColoc = "";
		this.members = new HashSet<User>();
		this.shoppingList = new ShoppingList();
		this.eventsList = new ArrayList<Event>();
		this.tasksList = new ArrayList<Task>();
	}

	public Coloc(String blazColoc) {
		super();
		this.blazColoc = blazColoc;
		this.members = new HashSet<User>();
		this.shoppingList = new ShoppingList();
		this.tasksList = new ArrayList<Task>();
		this.eventsList = new ArrayList<Event>();
	}

	public Map<Date, List<Event>> getEvents() {
		Map<Date, List<Event>> map = new HashMap<Date, List<Event>>();
		for (Event e : eventsList) {
			Date day = e.getDay();
			if (map.containsKey(day)) {
				map.get(day).add(e);
			} else {
				List<Event> list = new ArrayList<Event>();
				list.add(e);
				map.put(day, list);
			}
		}
		return map;
	}

	public Map<String, List<Task>> getTasks() {
		Map<String, List<Task>> map = new HashMap<String, List<Task>>();
		for (Task t : tasksList) {
			String day = t.getDoBefore();
			if (map.containsKey(day)) {
				map.get(day).add(t);
			} else {
				List<Task> list = new ArrayList<Task>();
				list.add(t);
				map.put(day, list);
			}
		}
		return map;
	}
	

	public List<Task> getTasksList() {
		return tasksList;
	}

	public void setTasksList(List<Task> tasksList) {
		this.tasksList = tasksList;
	}
	
	public void addTask(Task task) {
		this.tasksList.add(task);
	}

	/**
	 * adds a user to the coloc
	 * @param user: the user to add
	 * @return the result of the operation
	 */
	public boolean addMember(User user){
		return this.members.add(user);
	}
	
	/**
	 * remove a user from the coloc
	 * @param user: the user to remove
	 * @return the result of the operation
	 */
	public boolean removeMember(User user){
		return this.members.remove(user);
	}

	/**
	 * adds an event to the coloc
	 * @param event
	 * @return the result of the operation
	 */
	public void addEvent(Event event){
		eventsList.add(event);
	}
	
	/**
	 * remove an event from the coloc
	 * @param event
	 * @return the result of the operation
	 */
	public void removeEvent(String description, Date day, Date beginTime, Date endTime){
		for (Event e : eventsList) {
			if (e.getDescription() == description && e.getDay() == day && e.getBeginTime() == beginTime && e.getEndTime() == endTime) {
				eventsList.remove(e);
			}
		}
	}

	public String getBlazColoc() {
		return blazColoc;
	}

	public void setBlazColoc(String blazColoc) {
		
		this.blazColoc = blazColoc;
	}

	public String getPasswordColoc() {
		return passwordColoc;
	}

	public void setPasswordColoc(String passwordColoc) {
		this.passwordColoc = passwordColoc;
	}

	public String getAddressColoc() {
		return addressColoc;
	}

	public void setAddressColoc(String addressColoc) {
		this.addressColoc = addressColoc;
	}

	public String getCityColoc() {
		return cityColoc;
	}

	public void setCityColoc(String cityColoc) {
		this.cityColoc = cityColoc;
	}

	public String getCountryColoc() {
		return countryColoc;
	}

	public void setCountryColoc(String countryColoc) {
		this.countryColoc = countryColoc;
	}

	public int getId_coloc() {
		return id_coloc;
	}

	public ShoppingList getShoppingList() {
		return shoppingList;
	}

	public List<Event> getEventsList() {
		return eventsList;
	}

	public void setEventsList(List<Event> eventsList) {
		this.eventsList = eventsList;
	}
	
}
