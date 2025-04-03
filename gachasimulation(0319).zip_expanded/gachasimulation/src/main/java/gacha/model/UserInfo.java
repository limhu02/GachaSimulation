package gacha.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
/** 📌 사용자 정보 */
@Getter
@Setter
public class UserInfo {
    private String user_id;
    private String user_pwd;
    private String name;
    private String email;
    private Date reg_date;
    private String profile_image;
}