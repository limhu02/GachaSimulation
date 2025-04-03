package gacha.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import gacha.model.StartEnd;
import gacha.model.UserInfo;
import gacha.service.AdminService;
import gacha.service.CommentaryService;
import gacha.service.MypageService;
import gacha.service.PostService;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private MypageService mypageService;
	@Autowired
	private CommentaryService commentService;
	@Autowired
	private PostService postService;
	@Autowired
	private AuthService authService;
	
	@PostMapping("/admin/deleteSelectedUsers.html")
	public ModelAndView deleteSelect(@RequestParam(required = false) List<String>user_id) {
		ModelAndView mav =new ModelAndView();
		if (user_id == null || user_id.isEmpty()) { //선택한 리스트가 없는데 삭제버튼을 누를경우
			mav.setViewName("noSelectedUser"); //선택한 유저 없음 메세지가 뜨고 목록으로 이동하는 jsp 로 뷰 설정
			return mav; //리턴
		}
		for(String id:user_id) {
			this.commentService.deleteCommentaryByWriter(id);
			this.postService.deletePostByWriter(id);
			
			this.adminService.deleteUser(id);
		}
		mav.setViewName("deleteSelectComplete");
			
		return mav;
	}
	
	@PostMapping("/admin/userdeleteresult.html")
	public ModelAndView delete(String userId) {
		ModelAndView mav= new ModelAndView();
		this.commentService.deleteCommentaryByWriter(userId);
		this.postService.deletePostByWriter(userId);
		this.adminService.deleteUser(userId);
		mav.setViewName("userDeleteResult");
		return mav;
	}
	
	
	
	@PostMapping("/admin/update.html")
	public ModelAndView update( String user_id,String name,String email,MultipartFile profile_image,HttpSession session) {
		UserInfo user = this.adminService.getUserInfoById(user_id);
		
		
		  // 프로필 이미지 파일 업로드 처리
        String imageName = user.getProfile_image(); // 기존 이미지 유지
        if (profile_image != null && !profile_image.isEmpty()) {
            try {
                // 기존 이미지 삭제
                if (imageName != null) {
                    String oldImagePath = session.getServletContext().getRealPath("/userprofile/") + imageName;
                    File oldFile = new File(oldImagePath);
                    if (oldFile.exists()) {
                        oldFile.delete(); // 기존 파일 삭제
                    }
                }

                // 새로운 이미지 저장
                String uploadPath = session.getServletContext().getRealPath("/userprofile/");
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs(); // 폴더가 없으면 생성
                }

                imageName = System.currentTimeMillis() + "_" + profile_image.getOriginalFilename();
                File uploadFile = new File(uploadPath, imageName);
                profile_image.transferTo(uploadFile); // 파일 저장

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        user.setName(name);user.setEmail(email);user.setProfile_image(imageName);
		
		this.adminService.updateUserInfo(user);
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY","userEditSuccess.jsp");
		mav.addObject("user_id",user_id);
		return mav;
	}
	
	@PostMapping("/admin/useredit.html")
	public ModelAndView useredit(String user_id,HttpSession session) {
		
		ModelAndView mav =new ModelAndView("index");
		String id= (String) session.getAttribute("user_id");
		if(!id.equals("admin")||id=="") {mav.setViewName("redirect:/login/login.html");}
		UserInfo user = this.adminService.getUserInfoById(user_id);
		mav.addObject("BODY","userDetailModify.jsp");
		mav.addObject("userInfo", user);
		return mav;
	}
	
	
	@GetMapping("/admin/userdetail.html")
	public ModelAndView userDetail(String user_id,HttpSession session) {
		ModelAndView mav = new ModelAndView("index");
		String id= (String) session.getAttribute("user_id");
		if(!id.equals("admin")||id=="") {mav.setViewName("redirect:/login/login.html");
		return mav;}
		
		mav.addObject("BODY","userDetail.jsp");
		UserInfo user = this.mypageService.getUserInfoById(user_id);
		mav.addObject("userInfo",user);
		return mav;
	}
	
	@GetMapping("/admin/userlist.html")
	public ModelAndView userList(@RequestParam(required = false)String searchKeyword,Integer pageNo,HttpSession session) {
		ModelAndView mav = new ModelAndView("index");
		String id= (String) session.getAttribute("user_id");
		if(!id.equals("admin")||id=="") {mav.setViewName("redirect:/login/login.html");
		return mav;}
		
		int currentPage = 1;
		if(pageNo != null) currentPage = pageNo;
		int start = (currentPage - 1) * 5;
		int end = ((currentPage - 1) * 5) + 6;
		StartEnd se = new StartEnd(); se.setStart(start); se.setEnd(end);
		List<UserInfo> userList = new ArrayList<UserInfo>();
		Integer totalCount;
		if (searchKeyword != null && !searchKeyword.isEmpty()) {//게임이 비어있냐 아니냐에 따라
			userList=this.adminService.searchUserById(searchKeyword, pageNo);
			totalCount=this.adminService.getCountSearchUserById(searchKeyword);
		}
		else {
			userList=this.adminService.getUserList(pageNo);//5개의 상품목록을 검색
			
			 totalCount = this.adminService.getTotaUserlCount();//전체상품 갯수 검색
		}
		int pageCount = totalCount / 5;
		if(totalCount % 5 != 0) pageCount++;
		mav.addObject("BODY","userList.jsp");
		mav.addObject("userlist",userList);
		mav.addObject("currentPage", pageNo);
        mav.addObject("totalPages",  pageCount);
       
		
		return mav;
	}
	
	

}
