/**
 * the model of a coloc
 */
package model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;


@Entity
public class Coloc {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id_coloc;/** Id of a coloc (generated automatically)*/
	private String blazColoc;/** name for a coloc */
	@OneToMany
	private Set<User> members;/** the users associated to a coloc */
	@OneToMany
	private Set<ShoppingList> shoppingLists;/** the various shopping lists associated to the coloc*/
	@OneToMany
	private Set<Event> events;/** various events assoicated to the coloc */
	
	public Coloc(){
		this.blazColoc = "";
		this.members = new HashSet<User>();
		this.shoppingLists = new HashSet<ShoppingList>();
	}
	
	public Coloc(String blazColoc) {
		super();
		this.blazColoc = blazColoc;
		this.members = new HashSet<User>();
		this.shoppingLists = new HashSet<ShoppingList>();
	}
	
	/**
	 * adds a user to the coloc
	 * @param user: the user to add
	 * @return the result of the operation
	 */
	public boolean addMemeber(User user){
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
	 * adds a new shopping list to the coloc 
	 * @param list: the list to add
	 * @return the result of the operation
	 */
	public boolean addShoppingList(ShoppingList list){
		return this.shoppingLists.add(list);
	}
	
	/**
	 * adds an event to the coloc
	 * @param event
	 * @return the result of the operation
	 */
	public boolean addEvent(Event event){
		return this.events.add(event);
	}
	
	/**
	 * remove an event from the coloc
	 * @param event
	 * @return the result of the operation
	 */
	public boolean removeEvent(Event event){
		return this.events.remove(event);
	}
	
}
