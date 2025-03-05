package gacha.model;


import lombok.Getter;
import lombok.Setter;

/** 📌 게시판 정보 */
@Getter
@Setter
public class Board {
    private Integer code;  // 게시판 코드 (PK)
    private String name;   // 게시판 이름
}