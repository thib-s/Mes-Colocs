package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import apiGoogle.*;

@Singleton
public class Facade {
	
	@PersistenceContext
	EntityManager em;

	public void addUser(String username, String firstname, String lastName, String password, String email) {
		User user = new User();
		user.setFirstName(firstname);
		user.setLastName(lastName);
		user.setUsername(username);
		user.setPasswordHash(password);
		em.persist(user);

	}

	public boolean userExists(String username, String password) {
		Collection<User> listUser = em.createQuery("from User", User.class).getResultList();
		for(User u : listUser) {
			if(u.getUsername().equals(username) && u.getPasswordHash().equals(password)) {
				return true;
			}
		}
		return false;
	}

	public User getUser(String username) {
		Collection<User> listUser = em.createQuery("from User", User.class).getResultList();
		for(User u : listUser){
			if(u.getUsername().equals(username)){
				return u;
			}
		}
		return null;
	}

	public boolean userHasColoc(User user) {
		if(user.getMyColoc() != null) {
			return true;
		}
		return false;
	}

	public void bindUserColoc(User user,Coloc coloc) {
		User u = em.find(User.class, user.getUsername());
		Coloc c = em.find(Coloc.class, coloc.getId_coloc());
		u.setMyColoc(c);
		c.addMember(u);
		u = em.find(User.class, user.getUsername());
		System.out.println("ma colloc : " + u.getMyColoc().getBlazColoc());

	}

	public void removeUserFromColoc(User user) {
		User u = em.find(User.class, user.getUsername());
		u.setMyColoc(null);
	}

	public Coloc getColoc(String colocname) {
		Collection<Coloc> listColoc = em.createQuery("from Coloc", Coloc.class).getResultList();
		for(Coloc c : listColoc){
			if(c.getBlazColoc().equals(colocname)) {
				return c;
			}
		}
		return null;
	}

	public boolean colocMatchPass(Coloc c,String pass){
		Coloc coloc = em.find(Coloc.class, c.getId_coloc());
		return coloc.getPasswordColoc().equals(pass);
	}
	public void changeColocName(Coloc c, String cName){
		Coloc coloc = em.find(Coloc.class, c.getId_coloc());
		coloc.setBlazColoc(cName);
	}

	public void changeColocAddress(Coloc c,String cAddress,String cCity,String cCountry) {
		Coloc coloc = em.find(Coloc.class, c.getId_coloc());
		coloc.setAddressColoc(cAddress);
		coloc.setCityColoc(cCity);
		coloc.setCountryColoc(cCountry);
	}

	public List<Tuple<Float,Coloc>> getNearbyColoc(Coloc c) {
		String add1;
		String add2;
		List<Tuple<Float,Coloc>> hresult = new ArrayList<Tuple<Float,Coloc>>();
		add1 = c.getAddressColoc().replace(" ", "+") + "+" + c.getCityColoc();

		Collection<Coloc> listColoc = em.createQuery("from Coloc",Coloc.class).getResultList();
		for(Coloc coloc : listColoc){
			if(!coloc.getBlazColoc().equals(c.getBlazColoc()) && coloc.getCityColoc().equals(c.getCityColoc())){
				add2 = coloc.getAddressColoc().replace(" ", "+") + "+" + coloc.getCityColoc();
				System.out.println(add1 +"\n");
				System.out.println(add2 +"\n");
				float test = apiGoogle.ApiMaps.getDistance(add1, add2);
				System.out.println(test + "\n");
				hresult.add(new Tuple<Float,Coloc>(apiGoogle.ApiMaps.getDistance(add1, add2),coloc));
			}
		}

		return hresult;
	}

	public List<Location> getNearbyColocPins(Coloc c) {
		String add1;
		String add2;
		List<Location> presult = new ArrayList<Location>();
		add1 = c.getAddressColoc().replace(" ", "+") + "+" + c.getCityColoc();

		Collection<Coloc> listColoc = em.createQuery("from Coloc", Coloc.class).getResultList();
		for(Coloc coloc : listColoc){
			if(!coloc.getBlazColoc().equals(c.getBlazColoc()) && coloc.getCityColoc().equals(c.getCityColoc())){
				add2 = coloc.getAddressColoc().replace(" ", "+") + "+" + coloc.getCityColoc();
				Tuple<Location,Location> location = apiGoogle.ApiMaps.getLocation(add1, add2);
				if(!presult.contains(location.x)){
					presult.add(location.x);
				}
				if(!presult.contains(location.y)){
					presult.add(location.y);
				}

			}
		}

		return presult;
	}
	public Coloc addColoc(User user,String name,String address,String city, String country, String password){
		Coloc coloc = new Coloc();
		coloc.setBlazColoc(name);
		coloc.setAddressColoc(address);
		coloc.setCityColoc(city);
		coloc.setCountryColoc(country);
		coloc.setPasswordColoc(password);
		coloc.addMember(user);
		em.persist(coloc);
		return coloc;
	}

	public boolean colocExists(String colocname, String password) {
		Collection<Coloc> listColoc = em.createQuery("from Coloc",Coloc.class).getResultList();
		for(Coloc c : listColoc) {
			if(c.getBlazColoc().equals(colocname) && c.getPasswordColoc().equals(password)) {
				return true;
			}
		}
		return false;
	}
	
	public void addEvent(String inputDate, String inputTime, String description, Coloc coloc) {
		SimpleDateFormat sdfDay = new SimpleDateFormat("dd/MM/yyyy"); 
		SimpleDateFormat sdfTime = new SimpleDateFormat("hh:mm");
		String beginDateString = inputTime.substring(0,5);
		Date begin = null;
		Date day = null;
		Event event = null;
		try {
			day = sdfDay.parse(inputDate);
			begin = sdfTime.parse(beginDateString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if (inputTime.length() > 5) {
			String endDateString = inputTime.substring(6,11);
			Date end = null;
			try {
				end = sdfTime.parse(endDateString);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			event = new Event(description, day, begin, end);
		} else {
			event = new Event(description, day, begin);
		}
		em.persist(event);
		Coloc c = em.find(Coloc.class, coloc.getId_coloc());
		event.setColoc(c);
	}
	
	public void removeEvent(String inputDate, String inputTime, String description, Coloc coloc) {
		SimpleDateFormat sdfDay = new SimpleDateFormat("dd/MM/yyyy"); 
		SimpleDateFormat sdfTime = new SimpleDateFormat("hh:mm");
		String beginDateString = inputTime.substring(0,5);
		Date begin = null;
		Date day = null;
		Date end = null;
		try {
			day = sdfDay.parse(inputDate);
			begin = sdfTime.parse(beginDateString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if (inputTime.length() > 5) {
			String endDateString = inputTime.substring(6,11);
			try {
				end = sdfTime.parse(endDateString);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		Coloc c = em.find(Coloc.class, coloc.getId_coloc());
		c.removeEvent(description, day, begin, end);
	}

	public void addTask(String date, String doer, String description, Coloc coloc) {
		User user = em.find(User.class, doer);
		Task task = new Task(user, date, description);
		em.persist(task);
		Coloc c = em.find(Coloc.class, coloc.getId_coloc());
		task.setColoc(c);
	}

	
	public void addItemToShoppingList(Coloc coloc,String item,int quantity) {

	}

	public static void main(String[] args){
		
	}

}
