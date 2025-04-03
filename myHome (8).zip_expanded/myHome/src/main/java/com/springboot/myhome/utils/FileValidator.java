package com.springboot.myhome.utils;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.springboot.myhome.model.Imagebbs;

@Service
public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Imagebbs.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Imagebbs bbs = (Imagebbs)target;
		if(bbs.getImage().getOriginalFilename().equals("")) {//파일의 이름이 없느냐?
			errors.rejectValue("image", "error.code");
		}//파일이 존재하지 않는 경우 즉, 파일을 선택하지 않은 경우
	}

}








