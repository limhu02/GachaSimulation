package gacha.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StartEnd {
	private int start;
	private int end;
    private Integer boardCode;  // 게시판 코드
    private String searchKeyword; // 검색어


}
