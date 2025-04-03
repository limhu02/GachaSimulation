package gacha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import gacha.model.StartEnd;
import gacha.model.UserInfo;

@Mapper
public interface AdminMapper {
	
	Integer getCountSearchUserById(String keyword);
	List<UserInfo>searchUserById(StartEnd se);
	void deleteUser(String user);
	Integer getTotaUserlCount(); 
	List<UserInfo> getUserList(StartEnd se); 
	UserInfo getUserInfoById(@Param("userId") String userId);
    void updateUserInfo(UserInfo userInfo);
}
