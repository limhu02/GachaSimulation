package gacha.mapper;

import org.apache.ibatis.annotations.Mapper;

import gacha.model.LoginUser;
import gacha.model.UserInfo;


@Mapper
public interface LoginMapper {

   /**
    * 📌 로그인 사용자 조회
    * - 입력된 사용자 정보로 로그인 검증
    *
    * @param loginUser 로그인 요청 사용자 정보
    * @return 로그인 성공 시 사용자 정보 반환, 실패 시 null
    */
   LoginUser getUser(LoginUser loginUser);

   /**
    * 📌 아이디 찾기
    * - 이메일과 닉네임을 이용해 사용자 아이디 조회
    *
    * @param userInfo 사용자 이메일 및 닉네임 정보
    * @return 찾은 사용자 아이디 (없으면 null)
    */
   String findUserId(UserInfo userInfo);

   /**
    * 📌 비밀번호 찾기
    * - 이메일, 닉네임, 아이디가 일치하는 경우 비밀번호 반환
    *
    * @param userInfo 사용자 정보 (아이디, 이메일, 닉네임)
    * @return 찾은 사용자 비밀번호 (없으면 null)
    */
   String findUserPwd(UserInfo userInfo);
}