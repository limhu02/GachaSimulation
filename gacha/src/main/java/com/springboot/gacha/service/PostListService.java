package com.springboot.gacha.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.springboot.gacha.mapper.PostListMapper;
import com.springboot.gacha.model.PostList;
import com.springboot.gacha.model.StartEnd;

/**
 * 📌 게시글 목록 관리 서비스
 * - 게시판 별 게시글 조회 (페이징 지원)
 * - 게시글 검색 (페이징 지원)
 * - 게시글 개수 조회
 */
@Service
public class PostListService {

    @Autowired
    private PostListMapper postListMapper;

    /**
     * 📌 특정 게시판의 게시글 목록을 조회 (페이징 적용)
     *
     * @param boardCode 게시판 코드 (1=자랑게시판, 2=폭망게시판, 3=요청게시판)
     * @param pageNo 현재 페이지 번호 (1부터 시작)
     * @return 게시글 목록 (페이징 처리된 결과)
     */
    public List<PostList> getPostList(Integer boardCode, Integer pageNo) {
        if (pageNo == null || pageNo < 1) pageNo = 1;

        int pageSize = 5; // 페이지당 게시글 수
        int start = (pageNo - 1) * pageSize + 1;
        int end = pageNo * pageSize;

        StartEnd se = new StartEnd();
        se.setStart(start);
        se.setEnd(end);
        se.setBoardCode(boardCode);

        // 🚀 디버깅: 게시판 코드 및 페이징 정보 확인
        System.out.println("[DEBUG] boardCode: " + boardCode);
        System.out.println("[DEBUG] start: " + start + ", end: " + end);

        return this.postListMapper.getPostList(se);
    }

    /**
     * 📌 특정 게시판의 전체 게시글 개수 조회
     *
     * @param boardCode 게시판 코드
     * @return 총 게시글 개수
     */
    public Integer getTotalCount(Integer boardCode) {
        return this.postListMapper.getTotalCount(boardCode);
    }

    /**
     * 📌 게시글 검색 기능 (제목 포함 검색)
     * - 특정 게시판에서 입력된 검색어를 포함하는 게시글을 조회 (페이징 적용)
     *
     * @param boardCode 게시판 코드
     * @param searchKeyword 검색어 (제목에 포함된 글자)
     * @param pageNo 현재 페이지 번호
     * @return 검색된 게시글 목록
     */
    public List<PostList> searchPosts(Integer boardCode, String searchKeyword, Integer pageNo) {
        if (pageNo == null || pageNo < 1) pageNo = 1;

        int pageSize = 5;
        int start = (pageNo - 1) * pageSize + 1;
        int end = pageNo * pageSize;

        StartEnd se = new StartEnd();
        se.setBoardCode(boardCode);
        se.setSearchKeyword(searchKeyword);
        se.setStart(start);
        se.setEnd(end);

        List<PostList> result = postListMapper.searchPostsByTitle(se);

        // 🚀 디버깅: 검색 결과 출력
        for (PostList post : result) {
            System.out.println("[DEBUG] 검색 결과 postId: " + post.getPostId());
        }

        return result;
    }

    /**
     * 📌 검색된 게시글 개수 조회
     * - 특정 게시판에서 입력된 검색어를 포함하는 게시글 개수 반환
     *
     * @param boardCode 게시판 코드
     * @param searchKeyword 검색어
     * @return 검색된 게시글 개수
     */
    public int getSearchTotalCount(Integer boardCode, String searchKeyword) {
        StartEnd se = new StartEnd();
        se.setBoardCode(boardCode);
        se.setSearchKeyword(searchKeyword);
        return postListMapper.getSearchTotalCount(se);
    }
}
