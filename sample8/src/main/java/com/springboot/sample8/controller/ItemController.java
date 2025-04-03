package com.springboot.sample8.controller;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.sample8.model.Item;
import com.springboot.sample8.service.ItemService;
import com.springboot.sample8.utils.FileValidator;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ItemController {
	@Autowired
	private ItemService itemService;
	@Autowired
	private FileValidator fileValidator;
	
	@PostMapping(value="/item/search.html")
	public ModelAndView search(String itemName) {
		if(itemName == null || itemName.equals("")) {//상품이름이 없거나 비어있는 문자열인 경우
			return index();//상품목록을 출력한다.
		}
		List<Item> itemList = this.itemService.findItem(itemName);//입력된 이름으로 상품 검색
		if(itemList == null || itemList.isEmpty()) {//검색된 결과가 존재하지 않는 경우
			return index();//상품목록을 출력한다.
		}
		ModelAndView mav = new ModelAndView("index");//뷰이름 설정
		mav.addObject("itemList", itemList);//검색 결과를 ModelAndView에 저장한다.
		return mav;
	}
	
	@GetMapping(value="/item/index.html")
	public ModelAndView index() {
		List<Item> itemList = this.itemService.getItemList();//과일목록을 검색
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("itemList",itemList);
		return mav;
	}
	
	@GetMapping(value="/item/confirm.html")
	public ModelAndView confirm(Integer itemId) {
		ModelAndView mav = new ModelAndView("delete");
		Item item = this.itemService.getItem(itemId);//상품번호로 상품을 찾음
		mav.addObject(item);//조회 결과를 ModelAndView에 저장
		mav.addObject("imageName",item.getImage_name());//파일 이름만 별도로  ModelAndView에 저장
		return mav;
	}
	
	@PostMapping(value="/item/register.html")
	public ModelAndView register(@Valid Item item, BindingResult br,
			HttpSession session, HttpServletRequest request) throws Exception {
		this.fileValidator.validate(item.getPicture(), br);//파일 선택 유무 검사
		if(br.hasErrors()) {
			ModelAndView mav = new ModelAndView("add");
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		//파일 업로드 시작
		MultipartFile multiFile = item.getPicture();//선택한 파일을 불러온다.
		String fileName = null;//파일이름이 저장될 변수 선언
		String path = null;//파일이 저장될 폴더이름이 저장될 변수 선언
		OutputStream out = null;//파일 생성에 사용될 변수 선언
		fileName = multiFile.getOriginalFilename();//파일 이름을 찾는다.
		if( ! fileName.equals("")) {//파일 이름이 존재하는 경우 즉, 업로드 할 파일이 존재하는 경우
			ServletContext ctx = session.getServletContext();//ServletContext 생성
			path = ctx.getRealPath("/upload/"+fileName);//upload폴더의 절대경로 획득
			System.out.println("업로드 위치:"+path);
			BufferedInputStream bis = null;//파일 내용을 읽을 때 사용될 변수 선언
			try {
				out = new FileOutputStream(path);//파일을 생성한다.
				bis = new BufferedInputStream(multiFile.getInputStream());
				//선택한 파일의 내용을 읽기 위해, 파일을 open한다.
				byte[] buffer = new byte[8192];//8k크기로 변수를 선언
				int read = 0;
				while( (read = bis.read(buffer)) > 0) {//bis에서 읽은 내용을 out에 출력한다.
					out.write(buffer, 0, read);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(out != null) out.close();
					if(bis != null) bis.close();
				}catch(Exception e) {}
			}//try의 끝
			item.setImage_name(fileName);//파일의 이름을  Item에 설정한다.
		}//if의 끝
		this.itemService.putItem(item);//DB에 삽입
		ModelAndView mav = new ModelAndView("redirect:/item/index.html");
		return mav;//목록을 출력한다.
	}
	
	@GetMapping(value="/item/create.html")
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView("add");
		mav.addObject(new Item());
		return mav;
	}
	@PostMapping(value="/item/delete.html")
	public ModelAndView delete(Integer seqno) {
		this.itemService.deleteItem(seqno);
		ModelAndView mav = new ModelAndView("redirect:/item/index.html");
		return mav;//상품목록으로 돌아간다.
	}
	
	@PostMapping(value="/item/update.html")
	public ModelAndView update(Item item, BindingResult br, 
			HttpSession session, HttpServletRequest request, String image_name) throws Exception {
		if(br.hasErrors()) {
			ModelAndView mav = new ModelAndView("update");
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		MultipartFile multiFile = item.getPicture();
		String fileName=null; String path=null; OutputStream out = null;
		fileName = multiFile.getOriginalFilename();
		if(! fileName.equals("")) {//업로드 파일이 존재하는 경우, 즉, 이미지를 변경하는 경우
			ServletContext ctx = session.getServletContext();//ServletContext 생성
			path = ctx.getRealPath("/upload/"+fileName);//upload폴더의 절대경로 획득
			System.out.println("업로드 위치:"+path);
			BufferedInputStream bis = null;//파일 내용을 읽을 때 사용될 변수 선언
			try {
				out = new FileOutputStream(path);//파일을 생성한다.
				bis = new BufferedInputStream(multiFile.getInputStream());
				//선택한 파일의 내용을 읽기 위해, 파일을 open한다.
				byte[] buffer = new byte[8192];//8k크기로 변수를 선언
				int read = 0;
				while( (read = bis.read(buffer)) > 0) {//bis에서 읽은 내용을 out에 출력한다.
					out.write(buffer, 0, read);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(out != null) out.close();
					if(bis != null) bis.close();
				}catch(Exception e) {}
			}//try의 끝
			item.setImage_name(fileName);//파일의 이름을  Item에 설정한다.
		}else {//업로드 파일이 존재하지 않는 경우, 즉, 이미지를 변경하지 않는 경우
			item.setImage_name(image_name);//기존의 이미지 이름으로 설정
		}
		this.itemService.updateItem(item);//DB에서 update
		ModelAndView mav = new ModelAndView("redirect:/item/index.html");
		return mav;
	}
	
	@GetMapping(value="/item/edit.html")
	public ModelAndView edit(Integer itemId) {
		ModelAndView mav = new ModelAndView("update");
		Item item = this.itemService.getItem(itemId);//상품번호로 상품 검색
		mav.addObject(item);//검색 결과를 ModelAndView에 저장한다.
		return mav;
	}
}













