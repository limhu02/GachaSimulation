package com.springboot.sample7.exception;

public class CartEmptyException extends RuntimeException {
	public CartEmptyException(String msg) {
		super(msg);
	}//생성자
}
