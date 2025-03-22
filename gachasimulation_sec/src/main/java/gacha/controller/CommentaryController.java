package gacha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import gacha.model.Commentary;
import gacha.service.CommentaryService;
import jakarta.validation.Valid;

@Controller
public class CommentaryController {
	@Autowired
	private CommentaryService cService; //서비스 객체 참조
	@PostMapping("/comment/deleteComment.html")
	public ModelAndView deleteCommentary(Integer code,Integer postId) {
		ModelAndView mav = new ModelAndView();
		this.cService.deleteCommentaryByCode(code);
		mav.addObject("postId", postId);
		mav.setViewName("deleteCommentResult");
		return mav;
	}
	@PostMapping("/comment/updateResult.html") //댓글 수정 처리 함수
	public ModelAndView updateResult(@Valid Commentary comment, BindingResult br,Integer code,Integer postId) {//수정값, 게시글 받아오기
		ModelAndView mav= new ModelAndView();
		if(br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			mav.addObject("code",code);
			mav.setViewName("redirect:/comment/modifyComment.html");
			return mav;
		}
		this.cService.updateCommentary(comment); //내용 수정 처리
		mav.addObject("postId",postId); //다시 돌아갈 게시글의 글번호 받아오기
		mav.setViewName("updateCommentResult"); //뷰 리턴
		return mav;
		
	}
	
	

@PostMapping("/comment/write") // 댓글 작성
public ModelAndView write(@Valid Commentary comment, BindingResult br, Integer post_id) {
    ModelAndView mav = new ModelAndView();
    if (br.hasErrors()) { // 댓글 작성에 문제 있을 시 (변수 값 문제)
        mav.getModel().putAll(br.getModel());
        mav.setViewName("redirect:/board/detail.html?postId=" + post_id); // 에러 메시지 출력 후 게시글로 리다이렉트
    }

    // 현재 인증된 사용자 정보 가져오기
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String user_id = (authentication != null && authentication.isAuthenticated()) ? authentication.getName() : null;

    if (user_id == null) { // 로그인 안 한 상태에서 댓글 작성 시도시
        mav.setViewName("redirect:/login/login.html"); // 로그인 페이지로 이동
        return mav;
    }

    Integer max = this.cService.getCommentaryMax();
    comment.setCode(max + 1);
    comment.setWriter(user_id);
    comment.setPost_id(post_id);
    this.cService.putComment(comment); // 값 받아서 댓글 작성

    mav.setViewName("commentInputResult");
    mav.addObject("postId", post_id);
    return mav; // 리턴
}
	
	@RequestMapping("/comment/modifyComment.html") //댓글 수정
	public ModelAndView updateForm (Integer code) {
		System.out.println("### modifyComment ok ###");
		Commentary comment = this.cService.getCommentaryByCode(code); //코드로 댓글 찾기
		ModelAndView mav =new ModelAndView("modifyComment"); 
		mav.addObject("comment",comment); //찾은 댓글 뷰에 할당
		System.out.println("### modifyComment return ok ###");
		return mav; //리턴
	}
}
