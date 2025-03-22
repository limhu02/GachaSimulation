package gacha.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import gacha.model.Commentary;
import gacha.model.Post;
import gacha.service.AuthService;
import gacha.service.CommentaryService;
import gacha.service.PostService;
import jakarta.servlet.http.HttpSession;

@Controller
public class PostController {

    @Autowired
    private CommentaryService commentService;

    @Autowired
    private PostService postService;
    @Autowired
    private AuthService authService;

    /**
     * 📌 게시글 작성 페이지 이동
     * - 로그인 여부 확인 후 접근 가능
     * - 로그인하지 않은 경우 로그인 페이지로 이동
     */
    @GetMapping("/board/write.html")
    public ModelAndView showWritePage() {
        ModelAndView mav = new ModelAndView();

        // 로그인 여부 확인 (SecurityContextHolder 사용)
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userId = (authentication != null && authentication.isAuthenticated()) ? authentication.getName() : null;

        if (userId == null) {
            mav.setViewName("redirect:/login/login.html"); // 로그인 페이지로 이동
            return mav;
        }

        // 로그인 상태면 게시글 작성 페이지로 이동
        mav.setViewName("index");
        mav.addObject("BODY", "writePost.jsp"); // 작성 페이지
        return mav;
    }

    /**
     * 📌 게시글 작성 처리
     * - 입력된 제목, 내용, 이미지 파일을 저장
     * - 로그인된 사용자만 작성 가능
     */
    @PostMapping("/board/postEntry.html")
    public ModelAndView savePost(Integer boardCode, String title, String content, MultipartFile image,HttpSession session) {
        ModelAndView mav = new ModelAndView("index");

        // 로그인된 사용자 ID 가져오기 (SecurityContextHolder 사용)
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String writerId = (authentication != null && authentication.isAuthenticated()) ? authentication.getName() : null;

        // 로그인되지 않은 경우
        if (writerId == null) {
            mav.setViewName("redirect:/login/login.html");
            return mav;
        }

        // 이미지 업로드 처리 (선택 사항)
        String imageName = null;
        if (image != null && !image.isEmpty()) {
            try {
                // 현재 프로젝트의 실제 업로드 폴더 경로 설정
                String uploadPath = session.getServletContext().getRealPath("/upload/");
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs(); // 폴더가 없으면 생성
                }

                // 저장할 이미지 파일명
                imageName = System.currentTimeMillis() + "_" + image.getOriginalFilename();
                File uploadFile = new File(uploadPath, imageName);
                image.transferTo(uploadFile); // 파일 저장

            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 게시글 객체 생성 후 저장 
        Post post = new Post();
        post.setBoardCode(boardCode);
        post.setTitle(title);
        post.setContent(content);
        post.setWriterId(writerId);
        post.setImageName(imageName);

        // 서비스에서 DB에 저장
        postService.savePost(post);

        // 저장 완료 후 결과 페이지로 이동
        mav.addObject("BODY", "writePostResult.jsp");
        return mav;
    }

    /**
     * 📌 게시글 상세보기
     * - 요청된 `postId`를 기반으로 게시글 조회
     * - 조회 실패 시 오류 페이지로 이동
     */
    @GetMapping("/board/detail.html")
    public ModelAndView viewPost(@RequestParam("postId") Integer postId) {
    	System.out.println("### board/detail.html ok ###");
        ModelAndView mav = new ModelAndView("index");

        if (postId == null) {
            mav.setViewName("redirect:/errorPage.html");
            return mav;
        }

        try {
            // 게시글 정보 가져오기
            Post post = postService.getPostById(postId);
            if (post == null) {
                mav.setViewName("redirect:/errorPage.html");
                return mav;
            }
            List<Commentary> commentList = commentService.getCommentListByPost(postId);
          

            // JSP에 데이터 전달 (postId 추가!)
            mav.addObject("BODY", "detailPost.jsp");
            mav.addObject("post", post);
            mav.addObject("postId", postId); // postId 추가!
            mav.addObject("comment", commentList);

        } catch (Exception e) {
            mav.setViewName("redirect:/errorPage.html"); // 예외 처리
        }

        return mav;
    }

    /**
     * 📌 게시글 수정 처리 (POST 요청)
     */
    @PostMapping("/board/updatePost.html")
    public ModelAndView updatePost(
        @RequestParam("postId") Integer postId,
        @RequestParam("title") String title,
        @RequestParam("content") String content,
        @RequestParam(value = "image", required = false) MultipartFile image,
        HttpSession session
    ) {
        ModelAndView mav = new ModelAndView("redirect:/board/detail.html?postId=" + postId);

        // 기존 게시글 가져오기
        Post existingPost = postService.getPostById(postId);
        if (existingPost == null) {
            mav.setViewName("redirect:/errorPage.html");
            return mav;
        }

   

        // 이미지 업로드 처리
        String imageName = existingPost.getImageName(); // 기존 이미지 유지
        if (image != null && !image.isEmpty()) {
            try {
                // 기존 이미지 삭제
                if (imageName != null) {
                    String oldImagePath = session.getServletContext().getRealPath("/upload/") + imageName;
                    File oldFile = new File(oldImagePath);
                    if (oldFile.exists()) {
                        oldFile.delete(); // 기존 파일 삭제
                    }
                }

                // 새로운 이미지 저장
                String uploadPath = session.getServletContext().getRealPath("/upload/");
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs(); // 폴더가 없으면 생성
                }

                imageName = System.currentTimeMillis() + "_" + image.getOriginalFilename();
                File uploadFile = new File(uploadPath, imageName);
                image.transferTo(uploadFile); // 파일 저장

            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 수정된 내용 저장
        Post updatedPost = new Post();
        updatedPost.setPostId(postId);
        updatedPost.setTitle(title);
        updatedPost.setContent(content);
        updatedPost.setImageName(imageName); // 변경된 이미지 저장

        postService.updatePost(updatedPost);

        return mav;
    }

    /**
     * 📌 게시글 삭제 처리
     */
    @PostMapping("/board/deletePost.html")
    public ModelAndView deletePost(@RequestParam("postId") Integer postId) {
        postService.deletePost(postId);
        commentService.deleteCommentaryByPostId(postId);
        return new ModelAndView("redirect:/index/index.html"); // 삭제 후 목록 페이지로 이동
    }

}
