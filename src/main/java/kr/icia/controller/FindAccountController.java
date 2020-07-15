package kr.icia.controller;

import java.util.Random;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.icia.domain.MemberVO;
import kr.icia.service.FindAccountService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/find/*")
public class FindAccountController {

	private FindAccountService service;

	// 아이디 찾기
	@GetMapping("/findUserid")
	public void findUserid() throws Exception {

	}

	@ResponseBody
	@PostMapping("/findUseridCheck")
	public int findUseridCheck(MemberVO vo) {
		int result = service.findUseridCheck(vo);
		return result;
	}

	@PostMapping("/findUseridResult")
	public String findUseridResult(@RequestParam("userName") String userName,
			@RequestParam("userEmail") String userEmail, Model md, MemberVO vo) throws Exception {
		int result = service.findUseridCheck(vo);
		if (result == 0) {
			return "find/findUserid";

		} else {
			String userid = service.findUseridResult(userName, userEmail);
			log.info("---------controller id--------------" + userid);
			md.addAttribute("userid", userid);
			return "find/findUseridResult";
		}

	}

	// 비밀번호 찾기
	@GetMapping("/findUserpw")
	public void findUserpw() throws Exception {

	}

	@ResponseBody
	@PostMapping("/findUserpwCheck")
	public int findUserpwCheck(MemberVO vo) {
		int result = service.findUserpwCheck(vo);
		log.info("----------findUserpwCheck-----------" + result);
		return result;

	}

	@Autowired
	private JavaMailSender mailSender;
	@Inject
	BCryptPasswordEncoder pwEncoder;

	@PostMapping("/findUserpwResult")
	public String findUserpwResult(MemberVO vo, HttpServletRequest request, Model model) {
		int result = service.findUserpwCheck(vo);
		if (result == 0) {
			return "find/findUserpw";
		} else {
			// 랜덤번호만들기
			String ranPw = RandomStringUtils.randomAlphanumeric(10);
			log.info("---------------ranPw------------------" + ranPw);
			String newPw = pwEncoder.encode(ranPw);
			log.info("---------------newPw------------------" + newPw);

			// 랜덤번호 비밀번호로 세팅, 아이디 가져오기
			vo.setUserpw(newPw);
			service.setUserpw(vo);
			log.info("---------------setUserpw------------------" + vo);
			String userid = request.getParameter("userid");
			model.addAttribute("userid", userid);

			// 세팅된 임시비번을 메일로 보내기.
			String setfrom = "mdh2049@gmail.com";
			String tomail = request.getParameter("userEmail"); // 받는 사람 이메일
			String title = "[카메라모아] 임시 비밀번호 입니다."; // 제목
			String content = userid + "님의 임시 비밀번호는" + ranPw + "입니다. 비밀번호를 변경하여 사용해주세요."; // 내용
			try {
				log.info("--------------------------------멜보내기---------------------------" + vo);
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}
			return "find/findUserpwResult";
		}
	}

}
