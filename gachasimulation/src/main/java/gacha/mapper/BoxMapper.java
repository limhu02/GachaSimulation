package gacha.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import gacha.model.ItemBox;

@Mapper
public interface BoxMapper {
	void putBox(ItemBox box);
	List<String> getGameList();
	List<ItemBox> getBoxList();
	ItemBox getBoxByCode(String code);
	List<ItemBox> getBoxListByGame(String game);
}
