package gacha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gacha.mapper.AuthMapper;
import gacha.model.UserAuth;

@Service
public class AuthService {
	@Autowired
	private AuthMapper authMapper;
	
	public String getAuthById(String id) {return this.authMapper.getAuthById(id);}
	public void updateAuth(UserAuth auth) {this.authMapper.updateAuth(auth);}
	public void deleteAuthById(String id) {this.authMapper.deleteAuthById(id);}
	public void putBasicAuth(String id) {this.authMapper.putBasicAuth(id);}

}
