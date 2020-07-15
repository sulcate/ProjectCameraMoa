package kr.icia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.icia.domain.Criteria;
import kr.icia.domain.NoticeVO;
import kr.icia.domain.PageDTO;
import kr.icia.service.NoticeService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {

	private NoticeService service;

//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list");
//		model.addAttribute("list", service.getList());	
//	}
	@GetMapping("/noticeList")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@PostMapping("/noticeRegister")
	public String register(NoticeVO notice, RedirectAttributes rttr) {

		service.register(notice);
		rttr.addFlashAttribute("result", notice.getNbno());

		return "redirect:/notice/noticeList";
	}

	@GetMapping("/noticeRegister")
	public void register() {

	}

	@GetMapping({ "/noticeGet", "/noticeModify" })
	public void get(@RequestParam("nbno") Long nbno, @ModelAttribute("cri") Criteria cri, Model model) {

		model.addAttribute("notice", service.get(nbno));
	}

	@PostMapping("/noticeModify")
	public String modify(NoticeVO notice, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		if (service.modify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/notice/noticeList" + cri.getListLink();
	}

	@PostMapping("/noticeRemove")
	public String remove(@RequestParam("nbno") Long nbno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		if (service.remove(nbno)) {

			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/notice/noticeList" + cri.getListLink();
	}

}
