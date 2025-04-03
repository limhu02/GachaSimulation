package com.springboot.myhome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.myhome.model.Notice;
import com.springboot.myhome.model.StartEnd;

@Mapper
public interface NoticeMapper {
	void updateNotice(Notice notice);
	void deleteNotice(Integer no);
	Notice getNotice(Integer no);
	Integer getNoticeCount();
	List<Notice> getNoticeList(StartEnd se);
	Integer getMaxNum();
	void putNotice(Notice notice);
}























