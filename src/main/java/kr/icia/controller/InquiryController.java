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

import kr.icia.domain.Criteria;
import kr.icia.domain.InquiryAttachVO;
import kr.icia.domain.InquiryVO;
import kr.icia.domain.PageDTO;
import kr.icia.service.InquiryService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/inquiry/*")
@AllArgsConstructor
public class InquiryController {
	
	private InquiryService service;
	
	@GetMapping("/inquiryList")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@PostMapping("/inquiryRegister")
	public String register(InquiryVO inquiry, RedirectAttributes rttr) {
		
		if(inquiry.getAttachList() != null) {
			inquiry.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.register(inquiry);
		rttr.addFlashAttribute("result", inquiry.getIbno());
		
		return "redirect:/inquiry/inquiryList";
	}
	
	@PostMapping("/myPageInquiryRegister")
	public String register2(InquiryVO inquiry, RedirectAttributes rttr) {
		
		if(inquiry.getAttachList() != null) {
			inquiry.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.register(inquiry);
		rttr.addFlashAttribute("result", inquiry.getIbno());
		
		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = null;
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		        userDetails = (UserDetails) auth.getPrincipal();
		        userId = userDetails.getUsername();
		}
		
		return "redirect:/board/myBoard?keyword="+userId;
	}
	
	@GetMapping("/inquiryRegister")
	public void register() {
		
	}
	
	@GetMapping("/myPageInquiryRegister")
	public void register2() {
		
	}
	
	@GetMapping({"/inquiryGet" , "/inquiryModify", "/inquiryReply"})
	public void get(@RequestParam("ibno") int ibno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		model.addAttribute("inquiry", service.get(ibno));
	}
	
	@GetMapping({"/myPageInquiryGet" , "/myPageInquiryModify", "/myPageInquiryReply"})
	public void get2(@RequestParam("ibno") int ibno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		model.addAttribute("inquiry", service.get(ibno));
	}
	
	@PostMapping("/inquiryModify")
	public String modify(InquiryVO inquiry, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if (service.modify(inquiry)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/inquiry/inquiryList" + cri.getListLink();
	}
	
	@PostMapping("/myPageInquiryModify")
	public String modify2(InquiryVO inquiry, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if (service.modify(inquiry)) {
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
	
private void deleteFiles(List<InquiryAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
					
					Files.delete(thumbNail);
				}
			} catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}

	@PostMapping("/inquiryRemove")
	public String remove(@RequestParam("ibno") int ibno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		InquiryVO check = service.selectRef(ibno);

		List<InquiryAttachVO> attachList = service.getAttachList(ibno);
		if (service.remove(ibno)) {
			if (check.getLev() == 0) {
			service.deleteReply(check.getRef());
			}
			
			deleteFiles(attachList);	
			rttr.addFlashAttribute("result", "success");
		}
				
		return "redirect:/inquiry/inquiryList" + cri.getListLink();
	}
	
	@PostMapping("/myPageInquiryRemove")
	public String remove2(@RequestParam("ibno") int ibno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		

		List<InquiryAttachVO> attachList = service.getAttachList(ibno);
		if (service.remove(ibno)) {
			
			deleteFiles(attachList);	
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
	
	@PostMapping("/inquiryReply")
	public String inquiryReply(InquiryVO inquiry, RedirectAttributes rttr) {
		
		service.inquiryReply(inquiry);
		rttr.addFlashAttribute("result", inquiry.getIbno());
		
		return "redirect:/inquiry/inquiryList";
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<InquiryAttachVO>> getAttachList(int ibno) {
		
		return new ResponseEntity<>(service.getAttachList(ibno), HttpStatus.OK);
	}
	
		
	
	
}
