/**
 * the model of a shopping list
 */
package model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;


@Entity
public class ShoppingList {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;/** the id of the list (automatically generated*/
	private String name;/**the name of the list */
	@OneToMany (fetch=FetchType.EAGER)
	private List<ShoppingItem> items;/** the item list */
	
	public ShoppingList(){
		this.name = "";
		this.items = new ArrayList<ShoppingItem>();
	}
	
	/**
	 * create an empty list with it's name
	 * @param name
	 */
	public ShoppingList(String name) {
		super();
		this.name = name;
		this.items = new ArrayList<ShoppingItem>();
	}
	
	public List<ShoppingItem> getItems() {
		return items;
	}

	public boolean addItem(ShoppingItem item){
		return this.items.add(item);
	}
	
	public boolean removeItem(ShoppingItem item){
		return this.items.remove(item);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
