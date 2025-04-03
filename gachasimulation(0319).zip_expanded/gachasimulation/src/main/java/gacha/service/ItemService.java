package gacha.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gacha.mapper.ItemMapper;
import gacha.model.Item;
import gacha.model.ItemBox;
import gacha.model.Result;
import gacha.model.StartEnd;

@Service
public class ItemService {
	@Autowired
	private ItemMapper itemmapper;
	@Autowired
	private BoxService boxService;
		
	public void updateItem (Item item) { 
		double probability = item.getProbability()*0.01; //%를 소수점으로 초기화해서 재입력, 데이터베이스에 저장예정
		item.setProbability(probability);//입력한 아이템 객체 값에 할당
		this.itemmapper.updateItem(item);}
	public void deleteItemByCode(String code) { this.itemmapper.deleteItemByCode(code);}
	public Item getItemByCode(String code) {return this.itemmapper.getItemByCode(code);}
	
	
	public Integer getTotalCount() {
		return this.itemmapper.getTotalCount();//전체 항목 개수 리턴
	}
	

	
	public List<Item> getItemList(Integer pageNo){ //페이지 번호에 따라 출력하기
		if(pageNo == null) pageNo = 1; //페이지 번호 초기 설정
		int start = (pageNo - 1) * 5; 
		int end = ((pageNo - 1) * 5) + 6; //1부터 5번 항목까지 5개씩 출력
		StartEnd se = new StartEnd();
		se.setStart(start); se.setEnd(end);
		return this.itemmapper.getItemList(se); //5개씩 리스트 가져오기
		} 
	
	
	public void inputItem(Item item) { //아이템 입력 함수
		double probability = item.getProbability()*0.01; //%를 소수점으로 초기화해서 재입력, 데이터베이스에 저장예정
		item.setProbability(probability);//입력한 아이템 객체 값에 할당
		this.itemmapper.inputItem(item); //입력
		
	}
	
	public List<Item> getItemByBox(String box_code){ //소속 박스 코드로 아이템 찾는 함수
	
		return this.itemmapper.getItemByBox(box_code); //박스코드로 해당 아이템 박스에 포함된 모든 아이템 리스트 획득
	}
	
	public List<Item>gachaten(List<Item> list, Result result){
		
		
		List<Item> resultList=new ArrayList<>() ;
		String code = list.get(0).getBox_code(); //리스트에 있는 아이템의 박스코드 획득
		ItemBox box =this.boxService.getBoxByCode(code);
		double stack = 0.0; //아이템 확률 범위 누적
		double rand = Math.random(); //아이템이 뽑힐 확률
		List<Item> itemList =list;
		
		
	for(int i=0;i<10;i++) {
		
		for(Item item:itemList) { //아이템 리스트의 인덱스 개수만큼 반복
			stack +=item.getProbability(); //현재 아이템이 가진 확률을 누적
			
			if(rand<stack) { //현재 누적 확률이 뽑힐 확률 이상 일 경우
				System.out.println(item.getName());
				resultList.add(item);
				stack=0.0; //새로운 뽑기를 위해 스택 초기화
				rand = Math.random(); //아이템이 뽑힐 확률
				result.setCount(result.getCount()+1);
				result.setTotalpurchase(result.getTotalpurchase()+box.getPrice());
				if(item.getRate()>=6) result.setHighitemcount(result.getHighitemcount()+1); //실행 할 때 마다 결과 연산
				break;
			}//이하일 경우 다음 아이템으로 이동, 확률 누적.
			//뽑힐 확률이 현재 누적 확률의 이내로 들어가야 아이템이 출력된다.
		}
	}	
	
	
		return resultList;
		
	}
	public Item gacha(List<Item> list) { //아이템 박스 선택시 뽑기 실행
		double stack = 0.0; //아이템 확률 범위 누적
		double rand = Math.random(); //아이템이 뽑힐 확률
		List<Item> itemList =list;
	
		for(Item item:itemList) { //아이템 리스트의 인덱스 개수만큼 반복
			stack +=item.getProbability(); //현재 아이템이 가진 확률을 누적
			System.out.println(rand);
			if(rand<stack) { //현재 누적 확률이 뽑힐 확률 이상 일 경우
				return item; //해당 아이템 반환
				
			}//이하일 경우 다음 아이템으로 이동, 확률 누적.
			//뽑힐 확률이 현재 누적 확률의 이내로 들어가야 아이템이 출력된다.
		}
				
		return null; //문제 생기면 null로 리턴
	}
	

}
