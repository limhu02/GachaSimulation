package com.springboot.sample7.utils;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.springboot.sample7.model.User;

@Service
public class LoginValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.isAssignableFrom(clazz);
	}
	@Override
	public void validate(Object target, Errors errors) {
		User user = (User)target;
		if( ! StringUtils.hasLength(user.getUserId())) {
			errors.rejectValue("userId", "error.required.user");//프로퍼티즈파일에서 메세지를 불러서 Errors로 출력
		}
		if( ! StringUtils.hasLength(user.getPassword())) {
			errors.rejectValue("password", "error.required.user");
		}
		if(errors.hasErrors()) {
			errors.reject("error.input.user");
		}
	}

}









