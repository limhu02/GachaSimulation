package com.springboot.myhome.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.myhome.model.Board;
import com.springboot.myhome.model.LoginUser;
import com.springboot.myhome.service.BoardService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@PostMapping(value="/board/modify.html")
	public ModelAndView modify(Integer SEQ,String TITLE,String CONTENT,String BTN) {
		if(BTN.equals("수정")) {
			Board bbs = new Board();
			bbs.setSeq(SEQ); bbs.setTitle(TITLE); bbs.setContent(CONTENT);
			//this.boardDao.updateBoard(bbs);//글번호의 게시글 변경
			this.boardService.updateBoard(bbs);
		}else if(BTN.equals("삭제")) {
			//this.boardDao.deleteBoard(SEQ);//글번호의 게시글 삭제
			this.boardService.deleteBoard(SEQ);
		}
		//수정 혹은 삭제 작업 후 다시 목록으로 돌아간다.
		ModelAndView mav = new ModelAndView("redirect:/board/read.html");
		return mav;
	}
	
	@GetMapping(value="/board/detail.html")
	public ModelAndView detail(Integer SEQ) {
		//Board bbs = this.boardDao.readDetail(SEQ);//글번호로 게시글 검색
		Board bbs = this.boardService.getBoard(SEQ);
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY","boardDetail.jsp");//검색된 게시글을 출력하는 JSP 이름
		mav.addObject("BOARD", bbs);//JSP에서 검색된 게시글 데이터를 가져갈 때 사용하는 이름
		return mav;
	}
	
	
	@GetMapping(value="/board/read.html")
	public ModelAndView read(Integer pageNo) {
		int currentPage = 1;
		if(pageNo != null) currentPage = pageNo;
		//List<Board> bbsList = this.boardDao.readBoard(pageNo);
		List<Board> bbsList = this.boardService.getBoardList(pageNo);
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY","boardList.jsp");
		mav.addObject("BOARD", bbsList);
		mav.addObject("currentPage",currentPage);
		//int totalCount = this.boardDao.totalCount();//전체 게시글의 갯수 검색
		int totalCount = this.boardService.getTotalCount();
		int pageCount = totalCount / 5;
		if(totalCount % 5 != 0) pageCount++;
		mav.addObject("PAGES",pageCount);
		return mav;
	}
	
	@PostMapping(value="/board/entryBoard.html")
	public ModelAndView entryBoard(@Valid Board board, BindingResult br, 
			HttpSession session) {
		ModelAndView mav = new ModelAndView("index");
		if(br.hasErrors()) {
			mav.addObject("BODY","write_board.jsp");
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
		board.setId(loginUser.getId());//작성자 계정 설정
		this.boardService.putBoard(board);//DB에 삽입
		mav.addObject("BODY","writeBoardResult.jsp");
		return mav;
	}
	
	@GetMapping(value="/board/write.html")
	public ModelAndView input() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject(new Board());//Board 인스턴스 주입
		mav.addObject("BODY","write_board.jsp");
		return mav;
	}
}









