package com.springboot.lomboksample.model;



import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
	private String userId;
	private String password;
	private String userName;
	private String address;
	private String birthday;
	private String email;
	private String job;

}
