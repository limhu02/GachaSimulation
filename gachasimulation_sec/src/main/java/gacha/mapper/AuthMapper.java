package gacha.mapper;

import org.apache.ibatis.annotations.Mapper;

import gacha.model.UserAuth;

@Mapper
public interface AuthMapper {
	void updateAuth(UserAuth auth);
	void deleteAuthById(String id);
	void putBasicAuth(String id);
	String getAuthById(String id);
}
