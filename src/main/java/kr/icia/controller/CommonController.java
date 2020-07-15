package kr.icia.controller;

import java.io.PrintWriter;
import java.security.Principal;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.icia.domain.AuthVO;
import kr.icia.domain.MemberVO;
import kr.icia.service.MemberRegService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/user/*")
public class CommonController {

	private MemberRegService service;

	@ResponseBody
	@PostMapping("/idCheck")
	public int idCheck(MemberVO vo) throws Exception {
		int result = service.idCheck(vo);
		return result;
	}

	@ResponseBody
	@PostMapping("/emCheck")
	public int emCheck(MemberVO vo) throws Exception {
		int result = service.emCheck(vo);
		return result;
	}

	@Inject
	BCryptPasswordEncoder pwEncoder;

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(MemberVO vo, AuthVO auth) throws Exception {
		log.info("register: " + vo + auth);
		int result = service.idCheck(vo);
		try {
			if (result == 1) {
				return "/user/register";
			} else if (result == 0) {
				String inputPass = vo.getUserpw();
				String pw = pwEncoder.encode(inputPass);
				vo.setUserpw(pw);
				service.register(vo, auth);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}

		return "redirect:/";
	}

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "잘못된 접근입니다.");
	}

	@GetMapping("/login")
	public String loginInput(String error, String logout, Model model) {
		System.out.println("로그인");
		log.info("error: " + error);
		log.info("logout: " + logout);
		if (error != null) {
			model.addAttribute("error", "아이디 또는 비밀번호를 다시 확인해주세요");
		}
		if (logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다");
		}

		return "user/login";

	}

//	@GetMapping("/logout")
//	public ModelAndView logout(HttpSession session) {
//		session.invalidate();
//		ModelAndView mv = new ModelAndView("redirect:/");
//		return mv;
//	}

	@GetMapping("/mypage")
	public void mypage() {
	}

	@GetMapping("/updateUser")
	public String updateUser(MemberVO vo, Model model, Principal principal) {
		String userid = principal.getName();
		vo.setUserid(userid);
		model.addAttribute("member", service.get(userid));
		return "user/updateUser";

	}

	@PostMapping("/updateUser.do")
	public void updateUser(MemberVO vo, Principal principal, Model model,HttpServletResponse response) throws Exception {
		String inputPass = vo.getUserpw();
		String pw = pwEncoder.encode(inputPass);
		vo.setUserpw(pw);
		service.updateUser(vo);
		log.info("-----updateUser--------- :" + vo);
		model.addAttribute("vo", vo);
		if (vo != null) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('수정이 완료되었습니다.'); location.href='/user/updateUser';</script>");
            out.flush();
           
		}
		
		
	}

	@GetMapping("/deleteUser")
	public void deleteUser() {
	}

	@PostMapping("/deleteUser")
	public String deleteUser(MemberVO vo, Principal principal, HttpSession session) throws Exception {
		String userid = principal.getName();
		vo.setUserid(userid);
		service.delete(userid);
		session.invalidate();
		return "redirect:/";
	}

	@ResponseBody
	@PostMapping("/checkPw")
	public boolean checkPw(MemberVO vo, Principal principal, HttpServletRequest request) {
		/*
		 * String userpw = vo.getUserpw(); pwEncoder.matches(inputPass, userpw);
		 */

		String userid = principal.getName();

		String encodedPw = service.getPw(userid);

		boolean result = pwEncoder.matches(request.getParameter("userpw"), encodedPw);

		log.info("-----checkpw----------" + vo);
		return result;
	}
	
	@GetMapping("/black")
	public void black() {
	}

}
