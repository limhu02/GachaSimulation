package gacha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gacha.mapper.MypageMapper;
import gacha.model.Post;
import gacha.model.UserInfo;

@Service
public class MypageService {
	@Autowired
	private MypageMapper mypageMapper;

	public UserInfo getUserInfoById(String userId) {
		return this.mypageMapper.getUserInfoById(userId);
	}

	public List<Post> getRecentPost(String userId){
		return this.mypageMapper.getRecentPost(userId);
	}
	public void updateUserInfo(UserInfo userInfo) {
        this.mypageMapper.updateUserInfo(userInfo);
    }
	public void deleteUser(String userId) {
		// 1. 회원이 작성한 게시글 삭제
		this.mypageMapper.deleteUserPosts(userId);
		// 2. 회원 정보 삭제
        this.mypageMapper.deleteUser(userId);
    }
}
