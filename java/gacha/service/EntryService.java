package gacha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gacha.mapper.EntryMapper;
import gacha.model.UserEntry;

/**
 * 📌 회원가입 관련 서비스 클래스
 * - 회원가입 처리
 * - 아이디 중복 체크
 */
@Service
public class EntryService {

    @Autowired
    private EntryMapper entryMapper;

    /**
     * 📌 회원가입 처리
     * - 입력된 회원 정보를 데이터베이스에 저장
     *
     * @param user 저장할 사용자 정보
     */
    public void registerUser(UserEntry user) {
        this.entryMapper.insertUser(user);
    }

    /**
     * 📌 아이디 중복 체크
     * - 데이터베이스에서 해당 아이디가 존재하는지 확인
     *
     * @param userId 중복 확인할 사용자 ID
     * @return 중복된 개수 (0이면 사용 가능, 1 이상이면 중복)
     */
    public Integer checkIdDupService(String userId) {
        return entryMapper.checkDupId(userId);
    }
}