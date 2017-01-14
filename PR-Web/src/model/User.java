/**
 * User: the model of an user.
 * 
 * note: it's Id in the database is the username, meaning that we have to 
 * manually check if the choosen username is not yet present in the database
 */
package model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.*;

@Entity
public class User implements Serializable{
	
	
	/*@GeneratedValue(strategy=GenerationType.IDENTITY)
	 * 
	 */
	@Id
	private String username;/** Id of the user */
	private String firstName;/** first name of the user */
	private String lastName;/** last name of the user */
	private String passwordHash;/** Hash of the user password */
	private Timestamp createdAt;/** timestamp of the account creation */
	@ManyToOne
	private Coloc myColoc;/** the coloc which the user belongs to*/

	public User(){
		this.username = "";
		this.firstName = "";
		this.lastName="";
		this.passwordHash="";
		this.createdAt = new Timestamp(System.currentTimeMillis());
		this.myColoc = null;
	}
	
	/**
	 * Constructor for the user, the timestamp is automatically generated from system date
	 * @param firstName
	 * @param lastName
	 * @param username : IMPORTANT you have to check if there is no user with same username
	 * 					 in the database or the user will be overwritten
	 * @param passHash : hash of the user's password
	 */
	public User(String firstName, String lastName, String username, String passHash ){
		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
		this.passwordHash = passHash;
		this.createdAt = new Timestamp(System.currentTimeMillis());
		this.myColoc = null;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Coloc getMyColoc() {
		return myColoc;
	}

	public void setMyColoc(Coloc myColoc) {
		this.myColoc = myColoc;
	}

	public void setPasswordHash(String passwordHash) {
		this.passwordHash = passwordHash;
	}

	public String getPasswordHash() {
		return passwordHash;
	}

	
}
