package gacha.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import gacha.model.UserInfo;
import gacha.service.AuthService;
import gacha.service.CommentaryService;
import gacha.service.MypageService;
import gacha.service.PostService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MypageController {
	@Autowired
    private MypageService mypageService;
	@Autowired
	private CommentaryService commentaryService;
	@Autowired 
	private PostService postService;
	@Autowired
	private AuthService authService;
	/**
     * 📌 마이페이지 수정 페이지 이동
     * - 로그인한 사용자만 접근 가능
     */
    @GetMapping("/mypage/edit.html")
    public ModelAndView showEditMyPage(@AuthenticationPrincipal UserDetails userDetails) {
        // 세션에서 로그인한 사용자 ID 가져오기
       

        // 로그인하지 않은 경우 로그인 페이지로 리디렉트
        if (userDetails == null) {
            return new ModelAndView("redirect:/login/login.html");
        }
        String userId = userDetails.getUsername();

        // 사용자 정보 가져오기
        UserInfo userInfo = mypageService.getUserInfoById(userId);

        // 마이페이지 수정 페이지로 이동
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("BODY", "mypageEdit.jsp");
        mav.addObject("userInfo", userInfo);
        return mav;
    }

    /**
     * 📌 마이페이지 수정 처리
     * - 이름, 이메일, 프로필 이미지 변경 가능
     * - ID(user_id)는 변경 불가능
     */
    @PostMapping("/mypage/update.html")
    public ModelAndView updateUserInfo(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam(value = "profile_image", required = false) MultipartFile profileImage,
            @AuthenticationPrincipal UserDetails userDetails,HttpSession session) {

       String userId= userDetails.getUsername();

        // 기존 사용자 정보 가져오기
        UserInfo existingUser = mypageService.getUserInfoById(userId);

        // 프로필 이미지 파일 업로드 처리
        String imageName = existingUser.getProfile_image(); // 기존 이미지 유지
        if (profileImage != null && !profileImage.isEmpty()) {
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

                imageName = System.currentTimeMillis() + "_" + profileImage.getOriginalFilename();
                File uploadFile = new File(uploadPath, imageName);
                profileImage.transferTo(uploadFile); // 파일 저장

            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 수정된 사용자 정보 설정
        UserInfo updatedUser = new UserInfo();
        updatedUser.setUser_id(userId);
        updatedUser.setName(name);
        updatedUser.setEmail(email);
        updatedUser.setProfile_image(imageName); // 프로필 이미지 (새로운 이미지 or 기존 이미지 유지)

        // 서비스에서 DB 업데이트 실행
        mypageService.updateUserInfo(updatedUser);

        return new ModelAndView("mypageEditSuccess");
    }
    
    @GetMapping("/mypage/delete.html")
    public ModelAndView deleteUser(@AuthenticationPrincipal UserDetails userDetails, HttpServletRequest request, HttpServletResponse response) {
        if (userDetails == null) {
            return new ModelAndView("redirect:/");
        }

        String userId = userDetails.getUsername();

        // 사용자가 작성한 댓글 삭제
        this.commentaryService.deleteCommentaryByWriter(userId);
        // 사용자가 작성한 게시글 삭제
        this.postService.deletePostByWriter(userId);
        // 권한 정보 삭제
        this.authService.deleteAuthById(userId);
        // 사용자 계정 삭제
        mypageService.deleteUser(userId);

        // 🔹 Spring Security에서 로그아웃 처리
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }

        // 탈퇴 완료 페이지로 이동
        return new ModelAndView("redirect:/mypage/deleted.html");
    }


    /**
     * 📌 회원 탈퇴 완료 페이지
     * - 탈퇴가 정상적으로 완료되었음을 알리는 페이지
     */
    @GetMapping("/mypage/deleted.html")
    public ModelAndView showDeletedPage() {
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("BODY", "userDeleted.jsp"); // 탈퇴 완료 메시지 페이지
        return mav;
    }
}
