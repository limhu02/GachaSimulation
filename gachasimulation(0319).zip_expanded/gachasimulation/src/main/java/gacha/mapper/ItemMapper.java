package gacha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gacha.model.Item;
import gacha.model.StartEnd;

@Mapper
public interface ItemMapper {
	
	void updateItem (Item item);
	void deleteItemByCode(String code);
	Item getItemByCode(String code);
	
	List<Item> getItemByBox(String box_code); //박스코드로 박스에 있는 아이템 전부 호출
	void inputItem(Item item); // 아이템 입력
	List<Item> getItemList(StartEnd se); //아이템 출력(페이지처리)
	Integer getTotalCount(); //아이템 전체 개수
}
