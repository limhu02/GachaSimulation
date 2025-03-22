package gacha.model;


import java.sql.Date;

import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Commentary {
	private int code;
	private int post_id;
	private String writer;
	@NotEmpty(message = "내용을 입력해주세요.")
	private String content;
	private Date write_date;

}
