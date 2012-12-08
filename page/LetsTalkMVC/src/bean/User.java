package bean;

import java.io.Serializable;

public class User implements Serializable {
	private static final long serialVersionUID = 4284572555216108008L;
	
	private int user_id;
	private String email;
	private String nickname;
	private String name;
	private String password;
	private String photo;
	
	public User() {}
	
	public User(int user_id, String email, String nickname, String name, String password,
			String photo) {
		super();
		this.user_id = user_id;
		this.email = email;
		this.nickname = nickname;
		this.name = name;
		this.password = password;
		this.photo = photo;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
}
