package com.springboot.sample6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.sample6.model.Item;
import com.springboot.sample6.model.Nation;
import com.springboot.sample6.service.ItemService;
import com.springboot.sample6.utils.ItemValidator;

@Controller
public class ItemController {
	@Autowired
	private ItemService itemService;
	@Autowired
	private ItemValidator itemValidator;
	
	@GetMapping(value = "/inputitem")
	public ModelAndView form() {
		ModelAndView mav= new ModelAndView("input_item");
		mav.addObject(new Item());
		List<Nation> nationList = this.itemService.getNations();
		mav.addObject("NATIONS",nationList);
		return mav;
	}
	@PostMapping(value = "/inputitem")
	public ModelAndView inputItem(Item item, BindingResult br) {
		this.itemValidator.validate(item, br);
		ModelAndView mav =new ModelAndView("input_item");
		if(br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			List<Nation> nationList = this.itemService.getNations();
			mav.addObject("NATIONS",nationList);
			return mav;
		}
		this.itemService.putItems(item);
		Item input = this.itemService.getItem(item.getItem_code());
		mav.setViewName("inputResult");
		mav.addObject("item",input);
		return mav;
		
	}

}
