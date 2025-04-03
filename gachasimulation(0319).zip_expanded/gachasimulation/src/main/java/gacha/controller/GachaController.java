package gacha.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import gacha.model.Item;
import gacha.model.ItemBox;
import gacha.model.Result;
import gacha.service.BoxService;
import gacha.service.ItemService;
import jakarta.servlet.http.HttpSession;

@Controller
public class GachaController {
	@Autowired
	ItemService itemService;
	@Autowired
	private BoxService boxService;
	@GetMapping("/gacha")
	public ModelAndView gachaSelect(String game) {
		List<ItemBox> boxList = this.boxService.getBoxListByGame(game);
		ModelAndView mav = new ModelAndView("gameselect");
		mav.addObject("boxList",boxList);
		mav.addObject("game",game);
		return mav;
	}
	
	@GetMapping("/gacha/gacha1.html")
	public ModelAndView gachaItem(HttpSession session,String code) {
		ItemBox box = this.boxService.getBoxByCode(code); //선택한 박스 가져오기
		
		
		List<Item> itemList=this.itemService.getItemByBox(code); //해당 박스코드에 소속된 아이템 목록 가져오기
		ModelAndView mav = new ModelAndView("1time"); //뷰 생성
		Item item = this.itemService.gacha(itemList); //뽑기 돌리기
		Result result = (Result)session.getAttribute("result"); //결과 정산 클래스
		if (result ==null) { //세션에 저장된 결과값이 없을경우
			result = new Result();
			result.setCount(0); result.setHighitemcount(0); result.setTotalpurchase(0); //인스턴스 생성후 초기화
		}
		result.setCount(result.getCount()+1);
		result.setTotalpurchase(result.getTotalpurchase()+box.getPrice());
		if(item.getRate()>=6) result.setHighitemcount(result.getHighitemcount()+1); //실행 할 때 마다 결과 연산
		result.setHighitemrate(result.getHighitemcount()/result.getCount());
		session.setAttribute("result", result); //result 값 설정 후 세션에 전송
	
		System.out.print(item.getName());
		mav.addObject("item",item); //결과를 뷰에 전송
		mav.addObject("code",code);
		return mav;
	}
	@GetMapping("/gacha/gacha10.html")
	public ModelAndView tentime(HttpSession session,String code) {
		List<Item> itemList=this.itemService.getItemByBox(code); //아이템 박스에 있는 아이템들 호출
		Result result = (Result)session.getAttribute("result"); //세션에 있는 result 가져오기
		if (result ==null) { //세션에 저장된 결과값이 없을경우
			result = new Result();
			result.setCount(0); result.setHighitemcount(0); result.setTotalpurchase(0); //인스턴스 생성후 초기화
		}
		List<Item> resultList = this.itemService.gachaten(itemList,result); //10번 뽑기 진행
		System.out.print(resultList.size()); 
		result.setHighitemrate(result.getHighitemcount() / result.getCount());
		session.setAttribute("result", result); //정산 결과값 세션에 저장
		ModelAndView mav =new ModelAndView("10time"); 
		mav.addObject("itemList",resultList);
		mav.addObject("code",code);
		
		return mav;
	}
	
	@GetMapping("/gacha/result.html")
	public ModelAndView resultView(HttpSession session) {
		Result result =(Result)session.getAttribute("result");
		ModelAndView mav = new ModelAndView("result");
		mav.addObject("result",result);
		
		return mav;
	}
	@GetMapping("/gacha/gotoGameList.html")
	public ModelAndView gotoIndex(HttpSession session) {
		session.setAttribute("result",new Result());
		ModelAndView mav = new ModelAndView("gotoGameList");
		return mav;
	}
	
	

}
