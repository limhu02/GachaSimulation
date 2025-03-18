package gacha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gacha.model.Game;

@Mapper
public interface GameMapper {
	Integer countBoxByGame(String game); //게임에 연결된 아이템박스 조회
	void deleteGame(String name);
	void updateGameImage(Game game);
	List<Game> getGameList ();
	void inputGame(Game game);
}
