package model;

import java.util.Collection;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
	
	public void addColoc(User user,String name,String address,String city, String country, String password){
		Coloc coloc = new Coloc();
		coloc.setBlazColoc(name);
		coloc.setAddressColoc(address);
		coloc.setCityColoc(city);
		coloc.setCountryColoc(country);
		coloc.setPasswordColoc(password);
		coloc.addMember(user);
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

}
