package gacha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gacha.mapper.BoxAndItemMapper;
import gacha.model.BoxAndItem;
import gacha.model.StartEnd;

@Service
public class BoxAndItemService {
	@Autowired
	private BoxAndItemMapper boxAndItemMapper;
	
	public Integer getTotalCount() { //쿼리 결과의 전체 갯수 리턴
		return this.boxAndItemMapper.getTotalCount();
	}
	
	public List<BoxAndItem> getItemAndGame(Integer pageNo){
		if(pageNo == null) pageNo = 1; //페이지 번호 초기 설정
		int start = (pageNo - 1) * 5; 
		int end = ((pageNo - 1) * 5) + 6; //1부터 5번 항목까지 5개씩 출력
		StartEnd se = new StartEnd();
		se.setStart(start); se.setEnd(end);
		return this.boxAndItemMapper.getItemAndGame(se);
	}
}
