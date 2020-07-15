package kr.icia.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.icia.domain.BoardAttachVO;
import kr.icia.domain.BoardVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.PageDTO;
import kr.icia.service.BoardService;
import kr.icia.service.InquiryService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	private InquiryService iservice;

//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list");
//		model.addAttribute("list", service.getList());	
//	}
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {

		if (board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/board/list";
	}

	@GetMapping("/register")
	public void register() {

	}
	
	@PostMapping("/myPageRegister")
	public String register2(BoardVO board, RedirectAttributes rttr) {

		if (board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = null;
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		        userDetails = (UserDetails) auth.getPrincipal();
		        userId = userDetails.getUsername();
		}

		return "redirect:/board/myBoard?keyword="+userId;
	}

	@GetMapping("/myPageRegister")
	public void register2() {

	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

		model.addAttribute("board", service.get(bno));
	}
	
	@GetMapping({ "/myPageGet", "/myPageModify" })
	public void get2(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/board/list" + cri.getListLink();
	}
	
	@PostMapping("/myPageModify")
	public String modify2(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = null;
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		        userDetails = (UserDetails) auth.getPrincipal();
		        userId = userDetails.getUsername();
		}
		
		return "redirect:/board/myBoard?keyword="+userId;
	}

	private void deleteFiles(List<BoardAttachVO> attachList) {

		if (attachList == null || attachList.size() == 0) {
			return;
		}

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get(
						"C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());

				Files.deleteIfExists(file);

				if (Files.probeContentType(file).startsWith("image")) {

					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_"
							+ attach.getFileName());

					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
			service.removeReply(bno);
			service.remove(bno);
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");

		return "redirect:/board/list" + cri.getListLink();
	}
	
	@PostMapping("/myPageRemove")
	public String remove2(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
			service.removeReply(bno);
			service.remove(bno);
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");

		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = null;
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		        userDetails = (UserDetails) auth.getPrincipal();
		        userId = userDetails.getUsername();
		}
		
		return "redirect:/board/myBoard?keyword="+userId;
	}

	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {

		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}

	@GetMapping("/myBoard")
	public void myList(Criteria cri, Model model) {
		log.info("cri값" + cri);
		log.info("getMyList값"+ service.getMyList(cri));
		model.addAttribute("list", service.getMyList(cri));

		int total = service.getMyTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

		model.addAttribute("ilist", iservice.getMyList(cri));

		int itotal = iservice.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, itotal));
	}
}
