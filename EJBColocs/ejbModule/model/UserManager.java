package model;

public interface UserManager {
	
	public String startSession(String username, String passwordHash) throws InvalidCredentialException;
	
	public void finishSession(String token) throws InvalidTokenException;
	
	public User getUser(String token) throws InvalidTokenException;

}
