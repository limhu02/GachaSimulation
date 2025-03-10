package gacha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gacha.model.Game;

@Mapper
public interface GameMapper {
	void deleteGame(String name);
	void updateGameImage(Game game);
	List<Game> getGameList ();
	void inputGame(Game game);
}
