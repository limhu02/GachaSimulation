package com.springboot.sample7.exception;

public class LoginRequiredException extends RuntimeException {
	public LoginRequiredException(String msg) {
		super(msg);
	}
}
