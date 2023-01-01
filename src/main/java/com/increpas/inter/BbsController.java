package com.increpas.inter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;
import spring.util.Paging;

@Controller
public class BbsController {
	@Autowired
	private BbsDAO b_dao;
	
	int nowPage;
	int totalCount;
	int numPerPage = 10;
	int pagePerBlock = 5;
	
	@RequestMapping("/bbs/list")
	public ModelAndView list(String bname, String cPage) {
		ModelAndView mv = new ModelAndView();
		
		if(cPage == null)// 파라미터로 넘어오지 않았다면
			nowPage = 1;
		else
			nowPage = Integer.parseInt(cPage);
		
		if(bname == null)
			bname = "BBS";//일반게시판
		
		totalCount = b_dao.getTotalCount(bname);
		
		//페이징 처리를 위한 객체 생성
		Paging page = new Paging(nowPage, totalCount, pagePerBlock, numPerPage);
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		BbsVO[] ar = b_dao.getList(begin, end, bname);
		
		//JSP에서 표현하고 하는 값들을 모두 mv에 저장한다.
		mv.addObject("ar", ar);
		mv.addObject("pageCode", page.getSb().toString());// 페이징에 쓰이는 HTML코드
		mv.addObject("numPerPage", numPerPage);
		mv.addObject("totalCount", totalCount);
		mv.addObject("nowPage", nowPage);
		
		mv.setViewName("bbs/list"); // views/bbs/list.jsp로 forward됨!
		
		
		return mv;
	}
}
