package com.springboot.myhome.model;

import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginUser {
	@NotEmpty(message="계정을 입력하세요.")
	private String id;
	@NotEmpty(message="암호를 입력하세요.")
	private String password;
}
