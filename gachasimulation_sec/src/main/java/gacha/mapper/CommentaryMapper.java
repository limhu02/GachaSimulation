package gacha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gacha.model.Commentary;

@Mapper
public interface CommentaryMapper {
	void deleteCommentaryByWriter(String writer);
	void deleteCommentaryByPostId(Integer post_id);
	void deleteCommentaryByCode(Integer code);
	void updateCommentary(Commentary comment); //댓글 수정
	Commentary getCommentaryByCode(Integer code); //코드로 댓글 리턴
	Integer getCommentaryMax(); //현재 작성된 댓글의 코드 번호 리턴 
	void putComment(Commentary comment); //댓글 입력함수
	List<Commentary> getCommentListByPost(Integer postId); //게시글 번호로 댓글 찾아서 리스트로 리턴
}
