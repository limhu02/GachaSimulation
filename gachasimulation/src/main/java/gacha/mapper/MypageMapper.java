package gacha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import gacha.model.Post;
import gacha.model.UserInfo;

@Mapper
public interface MypageMapper {
	UserInfo getUserInfoById(@Param("userId") String userId);
    List<Post> getRecentPost(@Param("userId") String userId);
    void updateUserInfo(UserInfo userInfo);
    void deleteUser(@Param("userId") String userId);
    void deleteUserPosts(@Param("userId") String userId);
}
