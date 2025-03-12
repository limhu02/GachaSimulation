package gacha.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ItemBox {
	private String code;
	private String name;
	private String game;
	private Integer price;
	private String image;
	private MultipartFile imageFile;
}
