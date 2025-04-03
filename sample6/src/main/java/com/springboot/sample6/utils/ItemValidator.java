package com.springboot.sample6.utils;



import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.springboot.sample6.model.Item;
@Service
public class ItemValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Item.class.isAssignableFrom(clazz);
	}
	@Override
	public void validate(Object target, Errors errors) {
		Item Item = (Item)target;
		if(! StringUtils.hasLength(Item.getItem_code())) {
			errors.rejectValue("item_code", "error.required.item");
		}
		if(! StringUtils.hasLength(Item.getItem_title())) {
			errors.rejectValue("item_title", "error.required.item");
		}
		if(Item.getPrice() == null) {
			errors.rejectValue("price", "error.required.item");
		}
		else if (!(Item.getPrice() instanceof Integer)) {
            errors.rejectValue("price", "error.invalid.number");
        }
		if(! StringUtils.hasLength(Item.getItem_spec())) {
			errors.rejectValue("item_spec", "error.required.item");
		}
		
		
		if( errors.hasErrors()) {
			errors.reject("error.input.item");
		}
	}

}









