package com.springboot.orm.dao;

import java.util.List;

public interface UserDao {
	List<Object[]> getImageList(String id);
	//계정을 조건으로 이미지 게시글 목록을 검색
}
