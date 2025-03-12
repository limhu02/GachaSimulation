package gacha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gacha.mapper.BoxMapper;
import gacha.model.ItemBox;

@Service
public class BoxService {
	@Autowired
	private BoxMapper boxMapper;

	public void putBox(ItemBox box) {
		this.boxMapper.putBox(box);
	}
	public List<ItemBox> getBoxListByGame(String game){
		return this.boxMapper.getBoxListByGame(game);
	}
	public List<String> getGameList(){
		return this.boxMapper.getGameList();
	}
	public List<ItemBox> getBoxList(){
		return this.boxMapper.getBoxList();
	}
	public ItemBox getBoxByCode(String code) {
		return this.boxMapper.getBoxByCode(code);
	}

}
