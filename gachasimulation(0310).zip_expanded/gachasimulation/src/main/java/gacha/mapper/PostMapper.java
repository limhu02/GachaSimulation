package gacha.mapper;


import org.apache.ibatis.annotations.Mapper;

import gacha.model.Post;



/**
 * 📌 게시글 관련 데이터베이스 매퍼 인터페이스
 * - 게시글 작성
 * - 게시글 상세 조회
 */
@Mapper
public interface PostMapper {
	void deletePostByWriter(String writer);
    void insertPost(Post post); //게시글 작성
    
    Post getPostById(Integer postId);//게시글 상세 조회
 // 게시글 수정
    void updatePost(Post post);

    // 게시글 삭제
    void deletePost(Integer postId);
}