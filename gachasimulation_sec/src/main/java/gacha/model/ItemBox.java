package gacha.model;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ItemBox {
	@NotEmpty(message = "코드를 입력하세요.")
	private String code;
	@NotEmpty(message = "이름을 입력하세요.")
	private String name;
	private String game;
	@NotEmpty(message = "가격을 입력하세요.")
	private Integer price;
	private String image;
	private MultipartFile imageFile;
}
