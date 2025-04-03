package com.springboot.orm.dao;

import com.springboot.orm.model.Imagebbs_tbl;

public interface ImageDao {
	Imagebbs_tbl getImagebbs(Integer id);
	//글번호(id)로 이미지 게시글 조회 
}
