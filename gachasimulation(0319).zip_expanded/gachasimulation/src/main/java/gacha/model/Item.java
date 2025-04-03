package gacha.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Item {
	private String code;
	private String box_code;
	private String name;
	private double probability;
	private int rate;
	private String image;
	private MultipartFile imagefile;
}
