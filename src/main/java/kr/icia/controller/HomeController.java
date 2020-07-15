package kr.icia.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.icia.domain.GoodsVO;
import kr.icia.service.AdminService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@AllArgsConstructor
public class HomeController {
	
	private AdminService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		List<GoodsVO> bestGdsN = service.bestGdsN();
		
		log.info("bestGdsN뽑아오기값" + service.bestGdsN());
		GoodsVO goods = new GoodsVO();
		List<GoodsVO> bestView = new ArrayList<GoodsVO>();
		
		for(GoodsVO i : bestGdsN) {
			goods.setGdsNum(i.getGdsNum());
			bestView.add(service.getbest(goods));
			log.info("bestView에 담긴값" + bestView);
		}
		
		if (bestGdsN.isEmpty()) {
			model.addAttribute("bestView", "fail");
			log.info("bestView에 담긴값22" + bestView);
		} else {
		
		model.addAttribute("bestView", bestView);
		
		}
		
		return "home";
	}
	
}
