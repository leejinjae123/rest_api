package com.increpas.inter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

@Controller
public class IndexController {
	
	@Autowired
	private BbsDAO b_dao;
	
	@RequestMapping("/")
	public String index(Model model) {
		// 공지사항 Top3 목록 가져오기
		BbsVO[] n_list = b_dao.topList("NOTICES", 3);
		
		//트위터 Top1 목록 가져오기
		BbsVO[] t_list = b_dao.topList("TWIT", 1);
		
		model.addAttribute("n_list", n_list);
		model.addAttribute("t_list", t_list);
		
		return "index";
	}
	
	@RequestMapping("/bravo/sub1")
	public ModelAndView sub1() {
		ModelAndView mv = new ModelAndView();
		
		//할일들....
		
		mv.setViewName("bravo/sub1");
		
		return mv;
	}
}
