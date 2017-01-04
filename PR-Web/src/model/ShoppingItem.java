/**
 * model of ShoppingItem (item in a shopping list)
 */
package model;

import java.util.Date;
import javax.persistence.*;


@Entity
public class ShoppingItem {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;/** automatically generated id*/
	
	private String itemName;/** the name of the item */
	private int quantity;/** the quantity bought the last time */
	private Date lastBuyDate;/** last buy date */
	
	
	public ShoppingItem() {
		super();
		this.itemName = "";
		this.quantity = 0;
	}
	
	/**
	 * construct an item from it's name
	 * @param itemName
	 */
	public ShoppingItem(String itemName) {
		super();
		this.itemName = itemName;
		this.quantity = 0;
	}
	
	/**
	 * indicate that you just bought a quantity of this item
	 * @param quantity
	 * @throws InvalidQuantityException if the quantity is invalid (ie. negative)
	 */
	public void buyItem(int quantity) throws InvalidQuantityException{
		if (quantity > 0){
			this.lastBuyDate = new Date(System.currentTimeMillis());
			this.quantity = quantity;
		} else {
			throw new InvalidQuantityException();
		}
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getQuantity() {
		return quantity;
	}

	public Date getLastBuyDate() {
		return lastBuyDate;
	}
	
}
