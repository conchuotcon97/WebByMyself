package model;

public class User {
	private long id;
	private String email;
	private String password;
	private boolean userRole;

	public User(long id, String email, String password, boolean userRole) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.userRole = userRole;
	}

	public User() {
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public boolean isUserRole() {
		return userRole;
	}

	public void setUserRole(boolean userRole) {
		this.userRole = userRole;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
