package com.springboot.myhome.model;

import org.springframework.context.annotation.Scope;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Scope("session")
public class Imagebbs {
	private Integer w_id;
	private Integer group_id;
	private Integer parent_id;
	private Integer order_no;
	@NotEmpty(message="제목을 입력하세요.")
	private String title;
	@NotEmpty(message="내용을 입력하세요.")
	private String content;
	private String writer;
	private String w_date;
	private String imagename;
	@NotEmpty(message="암호를 입력하세요. 수정 및 삭제시 필요합니다.")
	private String password;
	private MultipartFile image;
}
