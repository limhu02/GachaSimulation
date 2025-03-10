package gacha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gacha.model.BoxAndItem;
import gacha.model.StartEnd;

@Mapper
public interface BoxAndItemMapper {
	List<BoxAndItem> getItemAndGame(StartEnd se);
	Integer getTotalCount();

}
