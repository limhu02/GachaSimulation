package com.springboot.myhome.model;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Board {
	private Integer seq;
	private String id;
	@NotEmpty(message="제목을 입력하세요.")
	@Size(min=0,max=10,message="{min}보다 크고 {max}보다 적어야 합니다.")
	private String title;
	@NotEmpty(message="내용을 입력하세요.")
	@Size(min=0,max=30,message="{min}보다 크고 {max}보다 적어야 합니다.")
	private String content;
	private String write_date;
}
