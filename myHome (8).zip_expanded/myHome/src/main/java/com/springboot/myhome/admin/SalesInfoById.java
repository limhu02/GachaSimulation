package com.springboot.myhome.admin;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SalesInfoById {
	private String user_id;
	private Integer sale_detail_id;
	private Integer sale_id;
	private String item_id;
	private Integer quantity;
	private Integer delivery_state;
	
}
