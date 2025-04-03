package gacha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gacha.mapper.LoginMapper;
import gacha.model.LoginUser;
import gacha.model.UserInfo;
/**
 * 📌 로그인 및 계정 관리 서비스
 * - 사용자 인증
 * - 아이디 찾기
 * - 비밀번호 찾기
 */
@Service
public class LoginService {

    @Autowired
    private LoginMapper loginMapper;
    
	/**
	   * 📌 사용자 정보 확인
	   *
	   * @param 사용자 ID
	   * @return ID로 찾은 사용자 정보
	   */
    public UserInfo getUserInfoById(String id) {return this.loginMapper.getUserInfoById(id);}
/**
 * 📌 비밀번호 변경
 *
 * @param 사용자 정보
 * @return 변경 실행
 */
    public void updateUserPwd(UserInfo userInfo) {this.loginMapper.updateUserPwd(userInfo);}

    /**
     * 📌 사용자 인증 (로그인)
     * - 입력된 계정 정보를 확인하고, DB에서 해당 사용자 정보를 가져옴
     *
     * @param loginUser 로그인할 사용자 정보 (ID, 비밀번호 포함)
     * @return 로그인된 사용자 정보 (성공 시) / null (실패 시)
     */
    public LoginUser authenticateUser(LoginUser loginUser) {
        return loginMapper.getUser(loginUser);
    }

    /**
     * 📌 아이디 찾기
     * - 입력된 정보(이메일, 이름)와 일치하는 아이디를 찾음
     *
     * @param userInfo 사용자 정보 (이메일, 이름 포함)
     * @return 찾은 아이디 (없으면 null)
     */
    public String findUserId(UserInfo userInfo) {
        return loginMapper.findUserId(userInfo);
    }

    /**
     * 📌 비밀번호 찾기
     * - 입력된 정보(이메일, 이름, 아이디)와 일치하는 비밀번호를 찾음
     *
     * @param userInfo 사용자 정보 (이메일, 이름, 아이디 포함)
     * @return 찾은 비밀번호 (없으면 null)
     */
    public String findUserPwd(UserInfo userInfo) {
        return loginMapper.findUserPwd(userInfo);
    }
}
