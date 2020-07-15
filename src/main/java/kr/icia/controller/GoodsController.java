package kr.icia.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.icia.domain.GoodsVO;
import kr.icia.service.AdminService;
import kr.icia.utils.UploadFileUtils;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/goods/*")
@AllArgsConstructor
public class GoodsController {
	
	private AdminService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
		
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

	}
	
	@GetMapping("/list1")
	public void list1(Model model) {
		log.info("list1");
		model.addAttribute("list", service.getList1());
		
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

	}
	
	@GetMapping("/list2")
	public void list2(Model model) {
		log.info("list2");
		model.addAttribute("list", service.getList2());
		
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
	}
	
	@GetMapping("/list3")
	public void list3(Model model) {
		log.info("list3");
		model.addAttribute("list", service.getList3());
		
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
	}
	
	@GetMapping("/list4")
	public void list4(Model model) {
		log.info("list4");
		model.addAttribute("list", service.getList4());
		
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
	}
	
	@GetMapping("/list5")
	public void list5(Model model) {
		log.info("list5");
		model.addAttribute("list", service.getList5());
		
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
	}
	
	// 글쓰기 버튼 누를시, 입력폼 보이게
	@GetMapping("/register")
	public void register(Model model) {

	}
	
	// 실제 등록처리.
	@PostMapping("/register")
	public String register(GoodsVO vo, MultipartFile file, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
			log.info("파일명이 넘어오는지 확인");
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		log.info("register : " + vo);
		service.register(vo);
		rttr.addFlashAttribute("result", vo.getGdsNum());
		
		return "redirect:/goods/list";
	}
	
	@GetMapping({"/detail", "/modify"})
	public void get(@RequestParam("n") int gdsnum, Model model) {
		log.info("/detail");
		model.addAttribute("goods", service.get(gdsnum));
	}
	
	@PostMapping("/modify")
	public String modify(GoodsVO vo, RedirectAttributes rttr) {
		log.info("modify:" + vo);
		if (service.modify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/goods/list";	
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("pno") int gdsnum, RedirectAttributes rttr) {
		log.info("remove..." + gdsnum);
		if (service.remove(gdsnum)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/goods/list";
	}

}
