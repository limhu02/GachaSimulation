package gacha.model;

import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

/** 📌 로그인 사용자 정보 */
@Getter
@Setter
public class LoginUser {
    @NotEmpty(message="계정을 입력하세요.")
    private String user_id;

    @NotEmpty(message="암호를 입력하세요.")
    private String user_pwd;
}