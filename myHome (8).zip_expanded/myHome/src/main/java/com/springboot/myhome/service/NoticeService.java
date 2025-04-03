package com.springboot.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.myhome.mapper.NoticeMapper;
import com.springboot.myhome.model.Notice;
import com.springboot.myhome.model.StartEnd;

@Service
public class NoticeService {
	@Autowired
	private NoticeMapper noticeMapper;
	
	public void updateNotice(Notice notice) {
		this.noticeMapper.updateNotice(notice);
	}
	public void deleteNotice(Integer no) {
		this.noticeMapper.deleteNotice(no);
	}
	public Notice getNotice(Integer no) {
		return this.noticeMapper.getNotice(no);
	}
	public Integer getNoticeCount() {
		return this.noticeMapper.getNoticeCount();
	}
	public List<Notice> getNoticeList(Integer pageNo){
		if(pageNo==null) pageNo =1;
		int start = (pageNo - 1) * 5;
		int end = ((pageNo - 1) * 5) + 6;
		StartEnd se = new StartEnd();
		se.setStart(start); se.setEnd(end);
		return this.noticeMapper.getNoticeList(se);
	}
	public Integer getMaxNum() {
		Integer max = this.noticeMapper.getMaxNum();
		if(max == null) return 0;
		else return max;
	}
	public void putNotice(Notice notice) {
		notice.setNum(getMaxNum()+1);//글번호 증가
		this.noticeMapper.putNotice(notice);
	}
}




























