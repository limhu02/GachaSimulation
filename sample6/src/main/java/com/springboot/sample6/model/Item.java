package com.springboot.sample6.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Item {
	private String item_code;
	private String item_title;
	private Integer price;
	private String item_spec;
	private String reg_date;
	private String madeIn;

}
