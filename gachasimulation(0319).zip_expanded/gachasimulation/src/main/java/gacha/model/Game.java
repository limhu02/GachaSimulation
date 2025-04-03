package gacha.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Game {
	private String name;
	private String image;
	private MultipartFile imagefile;

}
