package gacha.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gacha.mapper.AdminMapper;
import gacha.model.StartEnd;
import gacha.model.UserInfo;

@Service
public class AdminService {
	@Autowired
	private AdminMapper adminmapper;
	public Integer getCountSearchUserById(String keyword) {return this.adminmapper.getCountSearchUserById(keyword);}
	public List<UserInfo>searchUserById(String searchKeyword, Integer pageNo){
		 if (pageNo == null || pageNo < 1) pageNo = 1;

	        int pageSize = 5;
	        int start = (pageNo - 1) * pageSize + 1;
	        int end = pageNo * pageSize;

	        StartEnd se = new StartEnd();	       
	        se.setSearchKeyword(searchKeyword);
	        se.setStart(start);
	        se.setEnd(end);

	        List<UserInfo> result = this.adminmapper.searchUserById(se);

	        // 🚀 디버깅: 검색 결과 출력
	        for (UserInfo user : result) {
	            System.out.println("[DEBUG] 검색 결과 user_id: " + user.getUser_id());
	        }
	        return result;

	}
	
	public void deleteUser(String user) {this.adminmapper.deleteUser(user);}
	
	public Integer getTotaUserlCount() {return this.adminmapper.getTotaUserlCount();}
	public List<UserInfo> getUserList(Integer pageNo){
		if(pageNo == null) pageNo = 1; //페이지 번호 초기 설정
		int start = (pageNo - 1) * 5; 
		int end = ((pageNo - 1) * 5) + 6; //1부터 5번 항목까지 5개씩 출력
		StartEnd se = new StartEnd();
		se.setStart(start); se.setEnd(end);
		return this.adminmapper.getUserList(se);
	}
	public UserInfo getUserInfoById(String userId) {return this.adminmapper.getUserInfoById(userId);}
    public void updateUserInfo(UserInfo userInfo) {this.adminmapper.updateUserInfo(userInfo);}

}
