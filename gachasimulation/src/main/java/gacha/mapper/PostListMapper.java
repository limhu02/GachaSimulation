package gacha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gacha.model.PostList;
import gacha.model.StartEnd;

@Mapper
public interface PostListMapper {

   /**
    * 📌 게시글 목록 조회 (페이징 적용)
    * - 특정 게시판의 게시글을 조회 (시작-끝 범위 지정)
    *
    * @param se 시작-끝 범위 및 게시판 코드 포함 객체
    * @return 게시글 목록
    */
   List<PostList> getPostList(StartEnd se);

   /**
    * 📌 전체 게시글 개수 조회
    * - 특정 게시판의 전체 게시글 개수를 조회
    *
    * @param boardCode 조회할 게시판 코드
    * @return 게시글 개수
    */
   Integer getTotalCount(Integer boardCode);

   /**
    * 📌 게시글 검색 (제목 기준)
    * - 입력된 검색어가 제목에 포함된 게시글 조회 (페이징 적용)
    *
    * @param se 검색어 및 시작-끝 범위 포함 객체
    * @return 검색된 게시글 목록
    */
   List<PostList> searchPostsByTitle(StartEnd se);

   /**
    * 📌 검색된 게시글 개수 조회
    * - 특정 게시판에서 입력된 검색어가 포함된 게시글 개수를 조회
    *
    * @param se 검색어 및 게시판 코드 포함 객체
    * @return 검색된 게시글 개수
    */
   int getSearchTotalCount(StartEnd se);
}