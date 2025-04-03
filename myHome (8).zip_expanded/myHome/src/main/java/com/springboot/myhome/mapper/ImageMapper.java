package com.springboot.myhome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.myhome.model.Imagebbs;
import com.springboot.myhome.model.StartEnd;

@Mapper
public interface ImageMapper {
	void updateOrderNo(Imagebbs bbs);
	void updateImageBBS(Imagebbs bbs);
	void deleteImageBBS(Integer no);
	Integer getReplyCount(Integer no);
	Imagebbs getImageDetail(Integer no);
	Integer getTotal();
	List<Imagebbs> imageList(StartEnd se);
	Integer getMaxWid();
	void putImagebbs(Imagebbs bbs);
}












