package com.springboot.gacha.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.gacha.model.Post;
import com.springboot.gacha.service.PostService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PostController {

    @Autowired
    private HttpSession session;

    @Autowired
    private PostService postService;

    /**
     * 📌 게시글 작성 페이지 이동
     * - 로그인 여부 확인 후 접근 가능
     * - 로그인하지 않은 경우 로그인 페이지로 이동
     */
    @GetMapping("/board/write.html")
    public ModelAndView showWritePage() {
        ModelAndView mav = new ModelAndView();

        // 로그인 여부 확인
        String userId = (String) session.getAttribute("user_id");
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
	    public ModelAndView savePost(Integer boardCode, String title, String content, MultipartFile image) {
	        ModelAndView mav = new ModelAndView("index");
	
	        // 로그인된 사용자 ID 가져오기
	        String writerId = (String) session.getAttribute("user_id");
	
	        // 이미지 업로드 처리 (선택 사항)
	        String imageName = null;
	        if (image != null && !image.isEmpty()) {
	            try {
	                imageName = System.currentTimeMillis() + "_" + image.getOriginalFilename();
	                String uploadPath = "src/main/webapp/upload/"; // 업로드 경로 설정
	                File uploadFile = new File(uploadPath + imageName);
	                image.transferTo(uploadFile);
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
    public ModelAndView viewPost(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("index");

        // 요청에서 postId 가져오기
        String postIdParam = request.getParameter("postId");

        // postId가 없으면 오류 페이지로 이동
        if (postIdParam == null || postIdParam.isEmpty()) {
            mav.setViewName("redirect:/errorPage.html");
            return mav;
        }

        try {
            // String → Integer 변환
            Integer postId = Integer.parseInt(postIdParam);

            // 게시글 정보 가져오기
            Post post = postService.getPostById(postId);
            if (post == null) {
                mav.setViewName("redirect:/errorPage.html");
                return mav;
            }

            // JSP에 데이터 전달 (postId 추가!)
            mav.addObject("BODY", "detailPost.jsp");
            mav.addObject("post", post);
            mav.addObject("postId", postId); // 📌 postId 추가!

        } catch (NumberFormatException e) {
            mav.setViewName("redirect:/errorPage.html"); // postId가 숫자가 아닐 경우 예외 처리
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
        @RequestParam("content") String content
    ) {
        // 게시글 객체 생성 후 업데이트
        Post post = new Post();
        post.setPostId(postId);
        post.setTitle(title);
        post.setContent(content);

        postService.updatePost(post);

        // 수정 완료 페이지로 이동
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("BODY", "updateSuccess.jsp");
        mav.addObject("postId", postId); // 상세 페이지 이동을 위해 postId 전달
        return mav;
    }

    /**
     * 📌 게시글 삭제 처리
     */
    @PostMapping("/board/deletePost.html")
    public ModelAndView deletePost(@RequestParam("postId") Integer postId) {
        postService.deletePost(postId);
        return new ModelAndView("redirect:/index/index.html"); // 삭제 후 목록 페이지로 이동
    }
}
