package gacha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gacha.model.BoxAndItem;
import gacha.model.StartEnd;

@Mapper
public interface BoxAndItemMapper {
	Integer getCountByName(String name);
	List<BoxAndItem>getItemAndBoxByName(StartEnd se);
	Integer getCountByGame(String game);
	List<BoxAndItem>getItemAndGameByGame(StartEnd se);
	List<BoxAndItem> getItemAndGameList(StartEnd se);
	Integer getTotalCount();

}
