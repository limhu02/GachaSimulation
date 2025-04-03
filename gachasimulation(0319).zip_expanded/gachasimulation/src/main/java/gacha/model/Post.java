package gacha.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

/** 📌 게시글 상세 정보 */
@Getter
@Setter
public class Post {
    private Integer postId;    // 게시글 ID
    private Integer boardCode; // 게시판 코드
    private String writerId;   // 작성자 ID
    private String title;      // 제목
    private String content;    // 내용
    private String writeDate;  // 작성일
    private String imageName;  // 이미지 파일 이름 (선택)
    private Integer good = 0;  // 추천 수 (기본값 0)
    private Integer bad = 0;   // 비추천 수 (기본값 0)
}