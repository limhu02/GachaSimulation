package com.springboot.gacha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.gacha.model.UserEntry;
import com.springboot.gacha.service.EntryService;

import jakarta.validation.Valid;

@Controller
public class EntryController {

    @Autowired
    private EntryService entryService;

    /**
     * 📌 [GET 요청] 회원가입 폼 열기
     * - 사용자가 회원가입 페이지 (`register.jsp`)로 이동
     */
    @GetMapping("/entry/register.html")
    public ModelAndView showRegisterPage() {
        return new ModelAndView("register");
    }

    /**
     * 📌 [POST 요청] 회원가입 처리
     * - 유효성 검사 후 회원가입 수행
     * - 성공 시 `registerSuccess.jsp`로 이동
     */
    @PostMapping("/entry/register.html")
    public ModelAndView registerUser(@Valid UserEntry user, BindingResult br) {
        ModelAndView mav = new ModelAndView("register");

        // 유효성 검증 실패 시 오류 메시지 전달
        if (br.hasErrors()) {
            mav.getModel().putAll(br.getModel());
            return mav;
        }

        // 회원가입 실행
        entryService.registerUser(user);

        // 회원가입 성공 시 성공 페이지로 이동
        mav.setViewName("registerSuccess");
        return mav;
    }

    /**
     * 📌 계정 중복 검사
     * - 사용자가 입력한 ID (`USER_ID`)가 이미 존재하는지 확인
     * - 중복일 경우 "YES", 사용 가능하면 "NO" 반환
     */
    @RequestMapping(value = "/entry/idcheck.html")
    public ModelAndView idcheck(String USER_ID) {
        ModelAndView mav = new ModelAndView("idCheckResult");

        // 중복된 계정 개수 조회
        Integer count = entryService.checkIdDupService(USER_ID);

        if (count > 0) {
            mav.addObject("DUP", "YES"); // 중복 계정 존재
        } else {
            mav.addObject("DUP", "NO"); // 사용 가능
        }

        // 입력된 아이디를 결과 페이지에 전달
        mav.addObject("ID", USER_ID);
        return mav;
    }
}
