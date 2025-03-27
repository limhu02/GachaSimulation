package gacha.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import gacha.model.BoxAndItem;
import gacha.model.Game;
import gacha.model.Item;
import gacha.model.ItemBox;
import gacha.model.StartEnd;
import gacha.service.BoxAndItemService;
import gacha.service.BoxService;
import gacha.service.GameService;
import gacha.service.ItemService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ItemController {
	@Autowired
	private GameService gameService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private BoxService boxService;
	@Autowired
	private BoxAndItemService boxAndItemService;
	
	//Box 수정
	@PostMapping("/item/updateBox.html")
	public ModelAndView updateBox(String code, String name, Integer price, MultipartFile image,HttpSession session) {
		ItemBox box = this.boxService.getBoxByCode(code);
		System.out.println(image);
		  // 프로필 이미지 파일 업로드 처리
        String imageName = box.getImage(); // 기존 이미지 유지
        if (image != null && !image.isEmpty()) {
            try {
                // 기존 이미지 삭제
                if (imageName != null) {
                    String oldImagePath = session.getServletContext().getRealPath("/boxImage/") + imageName;
                    File oldFile = new File(oldImagePath);
                    if (oldFile.exists()) {
                        oldFile.delete(); // 기존 파일 삭제
                    }
                }

                // 새로운 이미지 저장
                String uploadPath = session.getServletContext().getRealPath("/boxImage/");
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
        System.out.println(imageName);
       
        box.setImageFile(image);box.setImage(imageName);box.setName(name);box.setPrice(price);
        this.boxService.updateBoxByCode(box);
        String game= box.getGame();
        ModelAndView mav = new ModelAndView("boxUpdateResult");
        mav.addObject("game",game);
        return mav;
        
	}
	
	
	//game 삭제
	@GetMapping("/game/deleteGame.html")
    public ModelAndView deleteGame(String gameName) {

        ModelAndView mav = new ModelAndView();

        // ✅ 1. 해당 게임에 연결된 아이템 박스가 몇 개인지 확인
        int boxCount = this.gameService.countBoxByGame(gameName);

        if (boxCount > 0) {
            // ✅ 2. 연결된 박스가 있으면 삭제 실패 페이지로 이동
            mav.addObject("gameName", gameName);
            mav.addObject("boxCount", boxCount);
            mav.setViewName("gameDeleteFail");  // ❗ 삭제 실패 뷰로 이동 (jsp 파일명)
        } else {
            // ✅ 3. 연결된 박스가 없으면 게임 삭제
            gameService.deleteGame(gameName);

            // ✅ 4. 삭제 완료 페이지로 이동 (팝업 후 목록으로 리다이렉트할 수도 있음)
            mav.setViewName("gameDeleteSuccess"); // ❗ 삭제 성공 뷰로 이동 (jsp 파일명)
        }

        return mav;
    }
	
	//item_box 삭제
	@PostMapping("/item/deleteBox.html")
    public ModelAndView deleteBox(String code) {
		System.out.println(code);
		ModelAndView mav = new ModelAndView();

	    // 해당 박스에 포함된 아이템 존재 여부 확인
	    List<Item> itemList = itemService.getItemByBox(code);

	    if (itemList != null && !itemList.isEmpty()) {
	        // 아이템이 존재할 경우 경고 메시지와 함께 item 존재 페이지로 이동
	        mav.addObject("boxCode", code);
	        mav.addObject("itemCount", itemList.size());
	        mav.setViewName("itemBoxDeleteFail");
	    } else {
	        // 아이템이 없으면 삭제
	        boxService.deleteBoxByCode(code);
	        mav.setViewName("itemBoxDeleteSuccess");
	    }

	    return mav;
    }
	
	@GetMapping("/item/itemBoxManage.html")
	public ModelAndView itemBoxManage(String game) {

	    // 이걸로 해당 게임에 속한 아이템 박스 리스트 조회
	    List<ItemBox> boxList = boxService.getBoxListByGame(game);

	    ModelAndView mav = new ModelAndView("itemBoxManage");
	    mav.addObject("game", game);
	    mav.addObject("boxList", boxList);

	    return mav;
	}
	
	@PostMapping("/item/namesearch.html")
	public ModelAndView nameSearch(String name,Integer PAGE_NUM,HttpSession session) {
		
		int currentPage = 1;
		if(PAGE_NUM != null) currentPage = PAGE_NUM;
		int start = (currentPage - 1) * 5;
		int end = ((currentPage - 1) * 5) + 6;
		StartEnd se = new StartEnd(); se.setStart(start); se.setEnd(end);
		List<BoxAndItem> itemList = this.boxAndItemService.getItemAndBoxByName(PAGE_NUM,name); //명칭으로 검색
		Integer totalCount = this.boxAndItemService.getCountByName(name); //갯수 검색
		
		int pageCount = totalCount / 5;
		if(totalCount % 5 != 0) pageCount++;
		ModelAndView mav = new ModelAndView("itemlist");
		
		mav.addObject("startRow",start); mav.addObject("endRow",end); 
		mav.addObject("total",totalCount); mav.addObject("itemlist", itemList);
		mav.addObject("pageCount", pageCount); mav.addObject("currentPage",currentPage);
		return mav;
	}
	
	
	@GetMapping("/item/inputItembox.html")
	public ModelAndView inputBox() {
		 ModelAndView mav = new ModelAndView("input_itemBox"); //뷰 가져오기
		 List<Game> gameList = this.gameService.getGameList(); 
		 mav.addObject("gamelist",gameList); //뷰에 box리스트를 삽입, 코드에 따라 box의 이름이 나올 예정
	   	 mav.addObject(new ItemBox()); //form:form이므로 객체 하나 삽입
		 return mav;//리턴
	}
	@PostMapping(value = "/item/BoxinputResult.html")
	public 	ModelAndView inputBoxResult(@Valid ItemBox box,BindingResult br,HttpSession session) { //입력 폼에서 가져온 item 객체를 받아온다.
		ModelAndView mav = new ModelAndView();
		if(br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			mav.setViewName("input_itemBox");
			 List<Game> gameList = this.gameService.getGameList(); 
			 mav.addObject("gamelist",gameList); //뷰에 box리스트를 삽입, 코드에 따라 box의 이름이 나올 예정
		   	 mav.addObject(new ItemBox()); //form:form이므로 객체 하나 삽입
		   	 return mav;
			
		}
		///이미지 파일 업로드 및 DB에 삽입 
		MultipartFile multipart = box.getImageFile();//선택한 파일을 불러온다.
		String fileName = null; String path = null; OutputStream os = null;
		fileName = multipart.getOriginalFilename();//선택한 파일의 이름을 찾는다.
		ServletContext ctx = session.getServletContext();//ServletContext 생성
		path = ctx.getRealPath("/boxImage/"+fileName);// itemImage 폴더의 절대 경로를 획득
		System.out.println("업로드 경로:"+path);
		try {
			os = new FileOutputStream(path);//OutputStream을 생성한다.즉, 파일 생성
			BufferedInputStream bis = new BufferedInputStream(multipart.getInputStream());
			//InputStream을 생성한다. 즉, 원본파일을 읽을 수 있도록 연다.
			byte[] buffer = new byte[8156];//8K 크기로 배열을 생성한다.
			int read = 0;//원본 파일에서 읽은 바이트 수를 저장할 변수 선언
			while( (read = bis.read(buffer)) > 0) {//원본 파일에서 읽은 바이트 수가 0이상인 경우 반복
				os.write(buffer, 0, read);//생성된 파일에 출력(원본 파일에서 읽은 바이트를 파일에 출력)
			}
		}catch(Exception e) {
			System.out.println("파일 업로드 중 문제 발생!");
		}finally {
			try { if(os != null) os.close(); }catch(Exception e) {}
		}
		box.setImage(fileName);//업로드 된 파일 이름을 item에 설정
		
		this.boxService.putBox(box);
		mav.setViewName("BoxInputResult");	
		return mav;
	}
	
	
	
	@GetMapping(value = "/item/inputgame.html")
	public ModelAndView inputgame() {
		 ModelAndView mav = new ModelAndView("input_game"); //뷰 가져오기
		 mav.addObject(new Game());
		 return mav;//리턴
	}
	
	@PostMapping(value = "/item/GameInputResult.html")
	public 	ModelAndView inputGameResult(Game game,HttpSession session) { //입력 폼에서 가져온 item 객체를 받아온다.
		
		
		///이미지 파일 업로드 및 DB에 삽입 
		MultipartFile multipart = game.getImagefile();//선택한 파일을 불러온다.
		String fileName = null; String path = null; OutputStream os = null;
		fileName = multipart.getOriginalFilename();//선택한 파일의 이름을 찾는다.
		ServletContext ctx = session.getServletContext();//ServletContext 생성
		path = ctx.getRealPath("/gameImage/"+fileName);// itemImage 폴더의 절대 경로를 획득
		System.out.println("업로드 경로:"+path);
		try {
			os = new FileOutputStream(path);//OutputStream을 생성한다.즉, 파일 생성
			BufferedInputStream bis = new BufferedInputStream(multipart.getInputStream());
			//InputStream을 생성한다. 즉, 원본파일을 읽을 수 있도록 연다.
			byte[] buffer = new byte[8156];//8K 크기로 배열을 생성한다.
			int read = 0;//원본 파일에서 읽은 바이트 수를 저장할 변수 선언
			while( (read = bis.read(buffer)) > 0) {//원본 파일에서 읽은 바이트 수가 0이상인 경우 반복
				os.write(buffer, 0, read);//생성된 파일에 출력(원본 파일에서 읽은 바이트를 파일에 출력)
			}
		}catch(Exception e) {
			System.out.println("파일 업로드 중 문제 발생!");
		}finally {
			try { if(os != null) os.close(); }catch(Exception e) {}
		}
		game.setImage(fileName);//업로드 된 파일 이름을 설정
		
		this.gameService.inputGame(game);
		ModelAndView mav = new ModelAndView("GameInputResult");	
		return mav;
	}
	
	//item 삭제
	@PostMapping(value = "/item/delete.html")
	public ModelAndView deleteItem(String code) {
		ModelAndView mav = new ModelAndView();
		
	    this.itemService.deleteItemByCode(code);
	    mav.setViewName("itemDeleteResult");
	    return mav;
	}
	
	@PostMapping( value = "/item/modify.html")
	public ModelAndView modify(String code) {
		Item item = this.itemService.getItemByCode(code);
		ModelAndView mav = new ModelAndView("itemModifyForm");
		mav.addObject("item",item);
		ItemBox box = this.boxService.getBoxByCode(item.getBox_code());
		mav.addObject("box",box);
		return mav;
	}
	@PostMapping(value = "/item/update.html")
	public ModelAndView update(Item item,HttpSession session) {
		ModelAndView mav = new ModelAndView("itemUpdateResult");
		MultipartFile multiFile = item.getImagefile();//선택한 파일을 불러온다.
		if(! multiFile.getOriginalFilename().equals("")) {//파일이름이 존재하는 경우,즉 이미지 변경
			String fileName = null; String path = null; OutputStream os = null;
			fileName = multiFile.getOriginalFilename();//이미지 파일의 이름을 획득
			ServletContext ctx = session.getServletContext();//ServletContext 생성
			path = ctx.getRealPath("/itemImage/"+fileName);//itemImage폴더의 절대경로를 획득
			System.out.println("변경된 이미지 경로:"+path);
			try {
				os = new FileOutputStream(path);//itemImage 폴더에 파일 생성
				BufferedInputStream bis = 
					new BufferedInputStream(multiFile.getInputStream());//선택한 파일을 연다.
				byte[] buffer = new byte[8156];//8K 크기로 배열 생성(한번에 8K씩 복사가 진행)
				int read = 0;//실제로 읽은 바이트 수
				while((read = bis.read(buffer)) > 0) {//원본 파일에서 읽은 바이트 수가 0이상인 동안 반복
					os.write(buffer, 0, read);//원본파일에서 읽은 데이터를 itemImage폴더의 파일에 출력
				}
			}catch(Exception e) {
				System.out.println("변경된 이미지 업로드 중 문제발생!");
			}finally {
				try {
					if(os != null) os.close();
				}catch(Exception e) {}
			}//업로드 종료
			item.setImage(fileName);//item의 파일이름을 새 파일이름으로 설정
		}
		else if(multiFile.getOriginalFilename().equals("") ||multiFile.getOriginalFilename()==null) {
			String beforeImage = item.getImage();
			item.setImage(beforeImage);
		}
		//this.imageDao.updateitem(item);//DB에서 이미지 게시글을 수정한다.
		this.itemService.updateItem(item);
		
		
		return mav;
	}
	@GetMapping(value = "/item/detailAdmin.html")
	public ModelAndView detailAdmin(String CODE) { //코드 값을 받아서 함수 실행
		Item item = this.itemService.getItemByCode(CODE); //받은 코드로 아이템 찾기
		ModelAndView mav = new ModelAndView("itemDetailAdmin"); // 뷰 설정
		ItemBox box = this.boxService.getBoxByCode(item.getBox_code());//찾은 아이템의 코드로 소속 박스 찾기
		mav.addObject("item",item); //아이템 뷰에 추가
		mav.addObject("box",box); //박스 뷰에 추가
		return mav; //리턴
	}
	
	@GetMapping(value = "/item/detail.html")
	public ModelAndView detail(String CODE) { //코드 값을 받아서 함수 실행
		Item item = this.itemService.getItemByCode(CODE); //받은 코드로 아이템 찾기
		ModelAndView mav = new ModelAndView("itemDetail"); // 뷰 설정
		ItemBox box = this.boxService.getBoxByCode(item.getBox_code());//찾은 아이템의 코드로 소속 박스 찾기
		mav.addObject("item",item); //아이템 뷰에 추가
		mav.addObject("box",box); //박스 뷰에 추가
		return mav; //리턴
	}
	
	
	@GetMapping(value = "/item/input.html")
	public ModelAndView inputItem() {
		 ModelAndView mav = new ModelAndView("input_item"); //뷰 가져오기
		 List<ItemBox> boxList= this.boxService.getBoxList(); 
		 mav.addObject("boxlist",boxList); //뷰에 box리스트를 삽입, 코드에 따라 box의 이름이 나올 예정
	   	 mav.addObject(new Item()); //form:form이므로 객체 하나 삽입
		 return mav;//리턴
	}
	@PostMapping(value = "/item/inputResult.html")
	public 	ModelAndView inputResult(@Valid Item item,BindingResult br,HttpSession session) { //입력 폼에서 가져온 item 객체를 받아온다.
		ModelAndView mav =new ModelAndView();
		if(br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			mav.setViewName("input_item");
			 List<ItemBox> boxList= this.boxService.getBoxList(); 
			 mav.addObject("boxlist",boxList); //뷰에 box리스트를 삽입, 코드에 따라 box의 이름이 나올 예정
		   	 mav.addObject(new Item()); //form:form이므로 객체 하나 삽입
			 return mav;//리턴
			
		}
		///이미지 파일 업로드 및 DB에 삽입 
		MultipartFile multipart = item.getImagefile();//선택한 파일을 불러온다.
		String fileName = null; String path = null; OutputStream os = null;
		fileName = multipart.getOriginalFilename();//선택한 파일의 이름을 찾는다.
		ServletContext ctx = session.getServletContext();//ServletContext 생성
		path = ctx.getRealPath("/itemImage/"+fileName);// itemImage 폴더의 절대 경로를 획득
		System.out.println("업로드 경로:"+path);
		try {
			os = new FileOutputStream(path);//OutputStream을 생성한다.즉, 파일 생성
			BufferedInputStream bis = new BufferedInputStream(multipart.getInputStream());
			//InputStream을 생성한다. 즉, 원본파일을 읽을 수 있도록 연다.
			byte[] buffer = new byte[8156];//8K 크기로 배열을 생성한다.
			int read = 0;//원본 파일에서 읽은 바이트 수를 저장할 변수 선언
			while( (read = bis.read(buffer)) > 0) {//원본 파일에서 읽은 바이트 수가 0이상인 경우 반복
				os.write(buffer, 0, read);//생성된 파일에 출력(원본 파일에서 읽은 바이트를 파일에 출력)
			}
		}catch(Exception e) {
			System.out.println("파일 업로드 중 문제 발생!");
		}finally {
			try { if(os != null) os.close(); }catch(Exception e) {}
		}
		item.setImage(fileName);//업로드 된 파일 이름을 item에 설정
		//int maxNum = this.imageDao.getMaxWid() + 1;//글번호 생성
		this.itemService.inputItem(item);
		 mav.setViewName("ItemInputResult");	
		return mav;
	}
	
	
	
	

	@GetMapping(value = "/item/itemList.html")
	public ModelAndView itemList(@RequestParam(required = false) String game,Integer PAGE_NUM,HttpSession session) {
		
		int currentPage = 1;
		if(PAGE_NUM != null) currentPage = PAGE_NUM;
		int start = (currentPage - 1) * 5;
		int end = ((currentPage - 1) * 5) + 6;
		StartEnd se = new StartEnd(); se.setStart(start); se.setEnd(end);
		List<BoxAndItem> itemList =new ArrayList();
		Integer totalCount;
	
		if (game != null && !game.isEmpty()) {//게임이 비어있냐 아니냐에 따라
			itemList=this.boxAndItemService.getItemAndGameByGame(PAGE_NUM, game);
			totalCount=this.boxAndItemService.getCountByGame(game);
			
		}
		else {
			itemList=this.boxAndItemService.getItemAndGameList(PAGE_NUM);//5개의 목록을 검색
			
			 totalCount = this.boxAndItemService.getTotalCount();//전체 갯수 검색
		}
		 
	
		
		int pageCount = totalCount / 5;
		if(totalCount % 5 != 0) pageCount++;
		ModelAndView mav = new ModelAndView("itemlist");
		mav.addObject("game",game);
		mav.addObject("startRow",start); mav.addObject("endRow",end); 
		mav.addObject("total",totalCount); mav.addObject("itemlist", itemList);
		mav.addObject("pageCount", pageCount); mav.addObject("currentPage",currentPage);
		
		return mav;
	}
	

}
