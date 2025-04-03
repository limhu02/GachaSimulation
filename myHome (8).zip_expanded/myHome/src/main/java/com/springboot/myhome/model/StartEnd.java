package com.springboot.myhome.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StartEnd {
	private String name;
	private int state;//배송상태:0,1,2
	private int start;
	private int end;
}
