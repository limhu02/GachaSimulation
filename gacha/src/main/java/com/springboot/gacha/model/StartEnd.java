package com.springboot.gacha.model;

import lombok.Getter;
import lombok.Setter;

/** 📌 페이징 및 검색 처리 */
@Getter
@Setter
public class StartEnd {
    private int start;          // 시작 인덱스
    private int end;            // 끝 인덱스
    private Integer boardCode;  // 게시판 코드
    private String searchKeyword; // 검색어
}
