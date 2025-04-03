package gacha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gacha.mapper.GameMapper;
import gacha.model.Game;

@Service
public class GameService {
	@Autowired
	private GameMapper gameMapper;
	
	public int countBoxByGame(String game) {
	       Integer count = gameMapper.countBoxByGame(game);
	       return count != null ? count : 0; // Null 방지
	   }
	public void deleteGame(String name) {this.gameMapper.deleteGame(name);}
	public void updateGameImage(Game game) {this.gameMapper.updateGameImage(game);}
	public List<Game> getGameList (){return this.gameMapper.getGameList();}
	public void inputGame(Game game) {this.gameMapper.inputGame(game);}

}
