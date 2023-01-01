package com.increpas.inter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	//MemberDAO등 필요한 객체들 선언...
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView login(String id, String pw) {
		ModelAndView mv = new ModelAndView();
		
		//id와 pw를 가지고 DB로부터 검증!!!!!
		
		//세션처리
		session.setAttribute("mvo", id);
		
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("/logout")
	public String logout() {
		
		// 세션 처리
		session.removeAttribute("mvo");
		
		return "index";
	}
}














