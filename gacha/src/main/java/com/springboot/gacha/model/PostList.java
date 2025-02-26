package com.springboot.gacha.model;

import lombok.Getter;
import lombok.Setter;

/** 📌 게시글 목록 조회 */
@Getter
@Setter
public class PostList {
    private Integer postId;      // 게시글 ID
    private Integer boardCode;   // 게시판 코드
    private String boardName;    // 게시판 이름
    private String writerId;     // 작성자 ID
    private String title;        // 제목
    private String writeDate;    // 작성일
}
