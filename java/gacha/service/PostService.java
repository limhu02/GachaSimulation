package gacha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gacha.mapper.PostMapper;
import gacha.model.Post;
/**
 * 📌 게시글 관리 서비스
 * - 게시글 저장
 * - 게시글 상세 조회
 */
@Service
public class PostService {

    @Autowired
    private PostMapper postMapper;

    /**
     * 📌 게시글 저장
     * - 새 게시글을 데이터베이스에 저장
     *
     * @param post 저장할 게시글 객체
     */
    public void savePost(Post post) {
        this.postMapper.insertPost(post);
    }

    /**
     * 📌 게시글 상세 조회
     * - postId를 기반으로 특정 게시글을 조회
     *
     * @param postId 조회할 게시글 ID
     * @return 조회된 게시글 객체 (없으면 null)
     */
    public Post getPostById(Integer postId) {
        return this.postMapper.getPostById(postId);
    }
    /**
     * 📌 게시글 수정
     */
    public void updatePost(Post post) {
        postMapper.updatePost(post);
    }

    public void deletePost(Integer postId) {
        postMapper.deletePost(postId);
    }
}