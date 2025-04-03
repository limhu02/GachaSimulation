package com.springboot.myhome.admin;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderModify {
	private String user_id;
	private Integer sale_id;
	private Integer sale_detail_id;
	private Integer state;
	private String sale_time;
	private String item_id;
	private Integer quantity;
	private Integer delivery_state;
	
}
