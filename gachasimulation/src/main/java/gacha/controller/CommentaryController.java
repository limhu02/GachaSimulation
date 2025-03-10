package gacha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import gacha.model.Commentary;
import gacha.model.LoginUser;
import gacha.service.CommentaryService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.Getter;

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
	
	
	@PostMapping("/comment/write") //댓글 작성
	public ModelAndView write(@Valid Commentary comment,BindingResult br,Integer post_id,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(br.hasErrors()) { //댓글 작성에 문제있을 시 (변수 값 문제)
			mav.getModel().putAll(br.getModel());
			mav.setViewName("redirect:/board/detail.html?postId="+post_id); //에러 메세지 출력 후 게시글로 리다이렉트
		}
		String user_id = (String)session.getAttribute("user_id");
		 if (user_id == null) { //미로그인 상태로 댓글 작성 시도시
	            mav.setViewName("redirect:/login/login.html"); // 로그인 페이지로 이동
	            return mav;
	        }
		Integer max=this.cService.getCommentaryMax();
		comment.setCode(max+1);
		comment.setWriter(user_id);
		comment.setPost_id(post_id);
		this.cService.putComment(comment); //값 받아서 댓글 작성
		
		mav.setViewName("commentInputResult");
		mav.addObject("postId",post_id);
		return mav; //리턴
	}
	
	@GetMapping("/comment/modifyComment.html") //댓글 수정
	public ModelAndView updateForm (Integer code) {
		Commentary comment = this.cService.getCommentaryByCode(code); //코드로 댓글 찾기
		ModelAndView mav =new ModelAndView("modifyComment"); 
		mav.addObject("comment",comment); //찾은 댓글 뷰에 할당
		return mav; //리턴
	}
}
