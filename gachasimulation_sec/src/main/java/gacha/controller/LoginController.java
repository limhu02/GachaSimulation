package gacha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import gacha.model.LoginUser;
import gacha.model.UserInfo;
import gacha.service.LoginService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;
    
    @GetMapping("/login/loginsec.html")
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView("login");
      
          
        return mav;
    }

    //로그인 처리
    @PostMapping("/login/login.html")
    public ModelAndView loginProcess(@Valid LoginUser loginUser, BindingResult br, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("index");
        if (br.hasErrors()) {
            mav.setViewName("login");
            return mav;
        }
        // 로그인 검증: user 객체를 반환
        LoginUser authenticatedUser = loginService.authenticateUser(loginUser);
        if (authenticatedUser != null) {  // 로그인 성공
            HttpSession session = request.getSession();
            session.setAttribute("user_id", authenticatedUser.getUser_id());
            mav.setViewName("redirect:/index/index.html"); 
        } else {  // 로그인 실패
            mav.setViewName("loginFail");
        }
        return mav;
    }
    
    
    // [로그아웃 처리] 세션 종료 후 메인 페이지로 이동
    @GetMapping(value = "/login/logout.html")
    public ModelAndView logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false); // 기존 세션 가져오기
        if (session != null) {
            session.invalidate(); // 세션 만료
        }
        return new ModelAndView("redirect:/index/index.html"); // 로그아웃 
    }
    
    // [아이디/비밀번호 찾기 페이지 이동]
    @GetMapping("/login/find.html")
    public ModelAndView showFindPage() {
        return new ModelAndView("find"); // find.jsp로 이동
    }
    
 // 아이디 찾기 처리
    @PostMapping("/login/find_id.html")
    public ModelAndView findId(UserInfo userInfo) {
        ModelAndView mav = new ModelAndView("findResult");
        String userId = loginService.findUserId(userInfo);
        
        if (userId != null) {
            mav.addObject("message", "아이디: " + userId);
        } else {
            mav.addObject("message", "해당 정보로 등록된 아이디가 없습니다.");
        }
        
        return mav;
    }

    // 비밀번호 찾기 처리
    @PostMapping("/login/find_pwd.html")
    public ModelAndView findPassword(UserInfo userInfo) {
        ModelAndView mav = new ModelAndView("findResult");
        String password = loginService.findUserPwd(userInfo);
        
        if (password != null) {
            mav.addObject("message", "비밀번호: " + password);
        } else {
            mav.addObject("message", "해당 정보로 등록된 계정이 없습니다.");
        }
        
        return mav;
    }
}