package gacha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class IndexController {
    /**
     * 📌 [GET 요청] 메인 페이지 (`index.jsp`) 열기
     * - 세션에서 현재 로그인된 사용자 정보 (`user_id`) 확인
     * - `index.jsp`에서 `user_id`를 활용할 수 있도록 전달
     */
    @GetMapping("/index/index.html")
    public ModelAndView showIndex(HttpSession session) {
        ModelAndView mav = new ModelAndView("index");

        // 현재 로그인된 사용자 ID 확인 (세션)
        String userId = (String) session.getAttribute("user_id");

        // JSP에서 사용할 user_id 전달
        mav.addObject("user_id", userId);

        return mav;
    }}


