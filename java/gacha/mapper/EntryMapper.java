package gacha.mapper;

import org.apache.ibatis.annotations.Mapper;

import gacha.model.UserEntry;

/**
 * 📌 회원가입 관련 데이터베이스 매퍼 인터페이스
 * - 사용자 등록
 * - 아이디 중복 체크
 */
@Mapper
public interface EntryMapper {

    /**
     * 📌 사용자 등록
     * - 회원가입 시 입력한 정보를 DB에 저장
     *
     * @param user 회원가입 정보 (UserEntry 객체)
     */
    void insertUser(UserEntry user);

    /**
     * 📌 아이디 중복 체크
     * - 입력한 아이디가 DB에 이미 존재하는지 확인
     *
     * @param user_id 확인할 사용자 아이디
     * @return 중복된 아이디 개수 (0: 사용 가능, 1 이상: 중복)
     */
    Integer checkDupId(String user_id);
}
