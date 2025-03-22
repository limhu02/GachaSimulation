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
	private String box_code;
	private String name;
	private double probability;
	private int rate;
	private String image;
	private MultipartFile imagefile;
}
