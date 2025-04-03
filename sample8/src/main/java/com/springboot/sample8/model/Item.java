package com.springboot.sample8.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Item {
	@NotNull(message="상품번호를 입력해야 합니다.")
	private Integer seqno;//상품번호
	@NotEmpty(message="이름을 입력하세요.")
	private String title;//상품이름
	@Range(min=0,max=1000000,message="{min}보다 크고 {max}보다 작아야 합니다.")
	@NotNull(message="가격을 입력하세요.")
	private Integer price;//가격
	@NotEmpty(message="상품설명을 입력하세요.")
	private String info;//상품설명
	
	private String image_name;//업로드 파일의 이름
	private MultipartFile picture;//업로드될 파일이 저장될 변수 선언
}





