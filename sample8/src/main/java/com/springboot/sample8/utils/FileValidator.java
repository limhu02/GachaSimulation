package com.springboot.sample8.utils;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MultipartFile.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MultipartFile mf = (MultipartFile)target;
		if(mf.getOriginalFilename().equals("")) {//선택한 파일의 이름이 없는 경우
			errors.rejectValue("picture","error.code");
		}
	}

}






