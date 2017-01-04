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

}
