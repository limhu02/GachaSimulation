package com.springboot.myhome.exception;

public class LoginRequiredException extends RuntimeException {
	public LoginRequiredException(String msg) {
		super(msg);
	}
}
