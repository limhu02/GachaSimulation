package gacha.model;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Item {
	@NotEmpty(message = "코드를 입력하세요.")
	private String code;
	@NotEmpty(message = "박스 코드를 입력하세요.")
	private String box_code;
	@NotEmpty(message = "이름을 입력하세요.")
	private String name;
	@NotEmpty(message = "확률을 입력하세요.")
	private double probability;
	@NotEmpty(message = "등급을 입력하세요.")
	private int rate;
	private String image;
	private MultipartFile imagefile;
}
