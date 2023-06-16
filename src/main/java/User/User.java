package User;

public class User {
	
	private int userId ;
	private String userName ;
	private String firstName ;
	private String lastName ;
	private String email ;
	private String password ;
	private String type ;
	
	
	private static User uniqueinstance ;
	
	private User() {} ;
	
	public static User getInstance() {
		
		if(uniqueinstance ==  null) {
			synchronized(User.class) {
				if( uniqueinstance ==  null ) {
					uniqueinstance =  new User() ;
				}
			}
		}
		return uniqueinstance;
	}
	
	
	
	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setType(String type) {
		this.type = type;
	}

	public User(int userId, String userName, String firstName, String lastName, String email, String password,
			String type) {
		
		this.userId = userId;
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.type = type;
	}

	public int getUserId() {
		return userId;
	}


	public String getUserName() {
		return userName;
	}

	
	public String getFirstName() {
		return firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public String getEmail() {
		return email;
	}


	public String getPassword() {
		return password;
	}


	public String getType() {
		return type;
	}


	
	
	
	
}
