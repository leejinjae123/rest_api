package com.increpas.inter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class KakaoController {

	@RequestMapping("/kakao/login")
	public ModelAndView login(String code) {
		//카카오 서버에서 인증코드를 전달해 주는 곳
		//카카오 서버가 인자로 전달해준 인증코드가 code라는 변수로 바든ㄴ다.
		ModelAndView mv = new ModelAndView();
		
		System.out.println("CODE:"+code);
		
		return mv;
	}
}

