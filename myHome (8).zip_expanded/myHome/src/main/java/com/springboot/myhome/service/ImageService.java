package com.springboot.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.myhome.mapper.ImageMapper;
import com.springboot.myhome.model.Imagebbs;
import com.springboot.myhome.model.StartEnd;

@Service
public class ImageService {
	@Autowired
	private ImageMapper imageMapper;
	
	public void updateOrderNo(Imagebbs bbs) {
		this.imageMapper.updateOrderNo(bbs);
	}
	public void updateImageBBS(Imagebbs bbs) {
		this.imageMapper.updateImageBBS(bbs);
	}
	public void deleteImageBBS(Integer no) {
		this.imageMapper.deleteImageBBS(no);
	}
	public Integer getReplyCount(Integer no) {
		return this.imageMapper.getReplyCount(no);
	}
	public Imagebbs getImageDetail(Integer no) {
		return this.imageMapper.getImageDetail(no);
	}
	public Integer getTotal() {
		return this.imageMapper.getTotal();
	}
	public List<Imagebbs> imageList(Integer pageNo){
		if(pageNo == null) pageNo = 1;
		int start = (pageNo - 1) * 5;
		int end = ((pageNo - 1) * 5) + 6;
		StartEnd se = new StartEnd();
		se.setStart(start); se.setEnd(end);
		return this.imageMapper.imageList(se);
	}
	public Integer getMaxWid() {
		Integer max = this.imageMapper.getMaxWid();
		if(max == null) return 0;
		else return max;
	}
	public void putImagebbs(Imagebbs bbs) {
		this.imageMapper.putImagebbs(bbs);
	}
}
























