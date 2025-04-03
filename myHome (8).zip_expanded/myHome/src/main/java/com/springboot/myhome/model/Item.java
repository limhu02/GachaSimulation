package com.springboot.myhome.model;

import org.hibernate.validator.constraints.Range;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Item {
	@NotEmpty(message="상품코드 중복검사를 해야합니다.")
	private String codeChecked;
	
	@NotEmpty(message="상품코드를 입력하세요.")
	private String item_code;
	@NotEmpty(message="상품이름 입력하세요.")
	private String item_title;
	@NotNull(message="가격을 입력하세요.")
	@Range(min=0,max=1000000,message="{min}과 {max} 사이로 입력하세요.")
	private Integer price;
	@NotEmpty(message="상품설명 입력하세요.")
	private String item_spec;
	private String reg_date;
	private String madein;
}
