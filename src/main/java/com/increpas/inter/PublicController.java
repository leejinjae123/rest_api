package com.increpas.inter;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Locale;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ev.vo.EvVO;


@Controller
public class PublicController {

	@RequestMapping("/public")
	public ModelAndView publicMenu(String city, String cityName) throws Exception{
		
		if(city == null)
			city="11";
		
		
		StringBuffer sb = new StringBuffer();
		sb.append("http://apis.data.go.kr/B552584/EvCharger/getChargerInfo?");
		sb.append("serviceKey=7yfjBSewGNvB0NcNfRBFLonKtEuR%2BDz1tMYF%2Fbamf8UY1tVjqPaRf2bF4NeeZ3g%2F1A9ubXY02UNaCLt1dQBOxw%3D%3D");
		sb.append("&pageNo=1&dataType=XML&zcode="+city);
		
		ModelAndView mv = new ModelAndView();
		
		URL url = new URL(sb.toString()); //웹상의 경로를 의미하는 객체 생성
		
		// 위에서 만든 웹상의 경로를 의미하는 객체와 연결하도록 하자!
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.connect();
		
		//서버쪽에서 보내는 자원이 XML이면 자바환경에서 쉽게 파싱하는 파서가 바로 JDOM파서다.
		//XML문서를 인지하기 위해 SAXBuilder라는 객체가 필요함!
		SAXBuilder builder = new SAXBuilder();
		
		//SAXBuilder를 통해 문서(Document)객체를 얻어낸다.
		Document doc = builder.build(conn.getInputStream());
		
		//위에서 구한 문서객체에서 루트엘리먼트를 구한다.
		Element root = doc.getRootElement();
		//System.out.println(root.getName());// response
		
		//루트를 구했다면 그 안에 있는 body엘리먼트를 구해보자!
		Element body = root.getChild("body");
		
		//body안에 있는 items라는 자식요소를 구한다.
		Element items = body.getChild("items");
		
		//items안에 있는 item들을 모두 가져온다.
		List<Element> item_list = items.getChildren("item");
		EvVO[] ar = new EvVO[item_list.size()];
		int i=0;		
		for(Element item: item_list) {
			//아이템이 가지는 자식들 중 이름이 "statNm"이라는 자식의 문자열을 가져온다.
			String statNm = item.getChildText("statNm");
			//System.out.println(statNm);
			String chgerId = item.getChildText("chgerId");
			String addr = item.getChildText("addr");
			String lat = item.getChildText("lat");
			String lng = item.getChildText("lng"); 
			String useTime = item.getChildText("useTime");
			String busiCall = item.getChildText("busiCall");
			String zcode = item.getChildText("zcode");
			
			//vo객체를 생성하여 저장하자!
			EvVO vo = new EvVO(statNm, chgerId, addr, lat, lng, useTime, busiCall, zcode);
			ar[i++] = vo;
		}
		mv.addObject("cityName",cityName);
		mv.addObject("list", ar);
		mv.setViewName("public");
		
		return mv;
	}	
}
