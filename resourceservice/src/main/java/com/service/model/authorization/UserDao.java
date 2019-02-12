package com.service.model.authorization;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;

@Stateless
public class UserDao {

	List<User> userList = new ArrayList<>();

	@PostConstruct
	public void init(){
		userList.add(new User("admin", "admin"));
	}

	public User findUser(String login){
		User user = userList.stream().filter(e -> e.getLogin().equals(login)).findFirst().orElse(null);
		return user;
	}
}
