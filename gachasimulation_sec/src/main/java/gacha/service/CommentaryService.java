package gacha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gacha.mapper.CommentaryMapper;
import gacha.model.Commentary;

@Service
public class CommentaryService {
	@Autowired
	private CommentaryMapper cmapper;
	
	public void deleteCommentaryByWriter(String writer) {
		this.cmapper.deleteCommentaryByWriter(writer);
	}
	public void deleteCommentaryByPostId(Integer post_id) {
		this.cmapper.deleteCommentaryByPostId(post_id);
	}
	public void deleteCommentaryByCode(Integer code) {
		this.cmapper.deleteCommentaryByCode(code);
	}
	
	public void updateCommentary(Commentary comment) {
		this.cmapper.updateCommentary(comment);
	}
	
	public Commentary getCommentaryByCode(Integer code) {
		return this.cmapper.getCommentaryByCode(code);
	}
	public Integer getCommentaryMax() {
		return this.cmapper.getCommentaryMax();
	}
	
	public List<Commentary> getCommentListByPost(Integer postId){
		return this.cmapper.getCommentListByPost(postId);
	}
	public void putComment(Commentary comment) {
		this.cmapper.putComment(comment);
	}
}
