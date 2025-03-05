package gacha.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import gacha.model.Post;
import gacha.model.PostList;
import gacha.model.UserInfo;
import gacha.service.BoxService;
import gacha.service.MypageService;
import gacha.service.PostListService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {

    @Autowired
    private PostListService postListService;
    @Autowired
    private BoxService boxService;
    @Autowired
    private MypageService mypageService;

    /**
     * 📌 자랑 게시판 (priceList)
     * - 제목 검색 기능 포함
     * - 게시글 목록 + 페이징 처리
     */
    @GetMapping("/board/priceList.html")
    public ModelAndView showPriceBoard(HttpServletRequest request) {
        return getBoardView(request, 1, "priceList.jsp");
    }

    /**
     * 📌 폭망 게시판 (failList)
     * - 제목 검색 기능 포함
     * - 게시글 목록 + 페이징 처리
     */
    @GetMapping("/board/failList.html")
    public ModelAndView showFailBoard(HttpServletRequest request) {
        return getBoardView(request, 2, "failList.jsp");
    }

    /**
     * 📌 요청/질문 게시판 (requestList)
     * - 제목 검색 기능 포함
     * - 게시글 목록 + 페이징 처리
     */
    @GetMapping("/board/requestList.html")
    public ModelAndView showRequestBoard(HttpServletRequest request) {
        return getBoardView(request, 3, "requestList.jsp");
    }

    /**
     * 📌 검색 기능 포함 게시판 조회 메서드
     * - boardCode에 따라 게시판 분기 처리
     * - 검색 키워드가 있으면 검색 결과 조회
     * - 검색 키워드가 없으면 전체 게시글 조회
     */
    private ModelAndView getBoardView(HttpServletRequest request, int boardCode, String jspPage) {
        ModelAndView mav = new ModelAndView("index");

        // 검색어 가져오기 (없으면 null)
        String searchKeyword = request.getParameter("searchKeyword");

        // 페이지 번호 가져오기 (디폴트: 1)
        String pageNoParam = request.getParameter("pageNo");
        int pageNo = (pageNoParam != null) ? Integer.parseInt(pageNoParam) : 1;

        List<PostList> postList;
        int totalCount;

        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
            // 🔎 검색 실행
            postList = postListService.searchPosts(boardCode, searchKeyword, pageNo);
            totalCount = postListService.getSearchTotalCount(boardCode, searchKeyword);
        } else {
            // 일반 게시판 조회
            postList = postListService.getPostList(boardCode, pageNo);
            totalCount = postListService.getTotalCount(boardCode);
        }

        // 총 페이지 개수 계산 (한 페이지당 5개 게시글)
        int totalPages = (int) Math.ceil((double) totalCount / 5);

        // 📌 JSP에 데이터 전달
        mav.addObject("BODY", jspPage);
        mav.addObject("postList", postList);
        mav.addObject("currentPage", pageNo);
        mav.addObject("totalPages", totalPages);
        mav.addObject("searchKeyword", searchKeyword); // 검색어 유지

        return mav;
    }

    /**
     * 📌 시뮬레이션 페이지 이동
     */
    @GetMapping("/board/simulation")
    public ModelAndView showSimulationBoard() {
        ModelAndView mav = new ModelAndView("index");
        List<String> gameList = this.boxService.getGameList();
        mav.addObject("BODY", "simulation.jsp");
        mav.addObject("gameList",gameList);
        return mav;
    }

    /**
     * 📌 마이페이지
     * - 로그인한 사용자만 접근 가능
     * - 사용자 정보 및 최근 작성한 게시글 조회 후 전달
     *
     * @param session 현재 로그인한 사용자 세션
     * @return ModelAndView (마이페이지 View)
     */
    @GetMapping("/board/mypage.html")
    public ModelAndView showMyPage(HttpSession session) {
        // 세션에서 user_id 가져오기
        String userId = (String) session.getAttribute("user_id");

        // 로그인하지 않은 경우 → 로그인 페이지로 리디렉트
        if (userId == null) {
            return new ModelAndView("redirect:/login/login.html");
        }

        // 사용자 정보 조회
        UserInfo userInfo = mypageService.getUserInfoById(userId);

        // 최근 작성한 게시글 조회 (1개만)
        List<Post> recentPosts = mypageService.getRecentPost(userId);

        // ModelAndView 설정
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("BODY", "mypage.jsp");
        mav.addObject("userInfo", userInfo);
        
        // 최신 게시글 1개만 전달
        if (recentPosts != null && !recentPosts.isEmpty()) {
            mav.addObject("recentPost", recentPosts.get(0));
        } else {
            mav.addObject("recentPost", null);
        }

        return mav;
    }
    

}