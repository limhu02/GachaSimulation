package com.springboot.gacha.model;

import java.util.Date;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

/** 📌 회원가입 정보 */
@Getter
@Setter
public class UserEntry {
    @NotEmpty(message = "아이디를 입력하세요.")
    private String userId;

    @NotEmpty(message = "비밀번호를 입력하세요.")
    private String userPwd;

    @NotEmpty(message = "이름을 입력하세요.")
    private String name;

    @NotEmpty(message = "이메일을 입력하세요.")
    @Email(message = "유효한 이메일 주소를 입력하세요.")
    private String email;

    private Date regDate;      // 자동 추가 (DB에서 SYSDATE)
    private String profileImage; // 선택 입력
}
