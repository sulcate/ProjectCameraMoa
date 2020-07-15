package kr.icia.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.icia.domain.CartListVO;
import kr.icia.domain.CartVO;
import kr.icia.domain.OrderDetailVO;
import kr.icia.domain.OrderListVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.RefundDetailVO;
import kr.icia.service.AdminService;
import kr.icia.service.ShopService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/shop/*")
@Log4j
@AllArgsConstructor
public class ShopController {

	private ShopService service;
	private AdminService service2;

	@ResponseBody
	@PostMapping("/view/addCart")
	public String addCart(CartVO cart) {
		
		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = null;
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		        userDetails = (UserDetails) auth.getPrincipal();
		        userId = userDetails.getUsername();
		}

		log.info("userId값:" + userId);
		String result = "0";
//		MemberVO member = (MemberVO) session.getAttribute("member");
//		String userId = "testId";
		
//		if (member != null) {
//			cart.setUserId(member.getUserId());
		if (userId != null) {
			
			List<CartListVO> cartList = service.cartList(userId);
			
			// 카트에 담긴 상품이 있는지 확인, 있다면,
			if (cartList.size() != 0) {
				log.info("if문은 실행되는지");
				
				// 담긴 상품의 배열만큼 for문을 돌려서
				for (int i=0; i<cartList.size(); i++) {
					log.info("for문은 실행되는지");
					int check = cartList.get(i).getGdsNum();
				
					// 배열 하나씩 check를 가져와서 넘어온 gdsNum이 일치한다면, 수량 업데이트 후 for문 빠져나가기.
					if (check == cart.getGdsNum()) {
						log.info("update카트실행여부");
						cart.setUserId(userId);
						service.modifyCart(cart);
						result = "1";
						break;
					} else { // check와 gdsNum이 불일치한다면,
						// 마지막 배열값까지 돌아갔을때 카트에 물품 추가해주고 result값 반환.
						if ( i == cartList.size() -1) {
							log.info("마지막값");
							cart.setUserId(userId);
							service.addCart(cart);
							result = "1";
						}
					}
				}
			} else { // 카트에 아무 상품도 없다면, 단순 카트에 물품 추가.
				log.info("cart에 담긴상품이 없을경우");
				cart.setUserId(userId);
				service.addCart(cart);
				result = "1";
			}
		}
		
		log.info("result값" + result);

		return result;
	}

	// 카트 목록
	@GetMapping("/cartList")
	public void getCartList(Model model, HttpSession session) {
		log.info("get cart list");
		
		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = null;
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		        userDetails = (UserDetails) auth.getPrincipal();
		        userId = userDetails.getUsername();
		        
		        List<CartListVO> cartList = service.cartList(userId);
				session.setAttribute("cartList", cartList);
		}

//		MemberVO member = (MemberVO)session.getAttribute("member");
//		String userId = member.getUserId();
//		String userId = "testId";
		
		log.info("userID값" + userId);

	}

	// 카트 삭제
	@ResponseBody
	@PostMapping("/deleteCart")
	public String deleteCart(@RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) {
		log.info("delete cart");
		
		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = null;
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		        userDetails = (UserDetails) auth.getPrincipal();
		        userId = userDetails.getUsername();
		}

//		MemberVO member = (MemberVO)session.getAttribute("member");
//		String userId = member.getUserId();
//		String userId = "testId";

		String result = "0";
		int cartNum = 0;

		if (userId != null) {
			cart.setUserId(userId);

			for (String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				service.deleteCart(cart);
			}
			log.info("삭제처리 되는지 if문");
			result = "1";
			log.info(result);
		}
		return result;

	}
	
	// 삭제 버튼 누를 시 비동기 처리를 위한
	@ResponseBody
	@GetMapping(value="/test", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<CartListVO>> test(Model model, HttpSession session) {
		log.info("get test list");
		
		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = null;
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		        userDetails = (UserDetails) auth.getPrincipal();
		        userId = userDetails.getUsername();
		}

//		MemberVO member = (MemberVO)session.getAttribute("member");
//		String userId = member.getUserId();
//		String userId = "testId";

		// 삭제 처리 후 세션 업데이트를 위한 코드 2줄
		List<CartListVO> cartList = service.cartList(userId);
		session.setAttribute("cartList", cartList);
		
		return new ResponseEntity<>(cartList, HttpStatus.OK);
	}
	
	// 수량 버튼 누를 시 비동기 처리를 위한
		@ResponseBody
		@GetMapping(value="/test2", produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<List<CartListVO>> test2(@RequestParam(value = "chbox[]") List<String> chArr, Model model, CartVO cart, HttpSession session) {
			log.info("get test list");
			
			UserDetails userDetails;
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			
			String userId = null;
			
			if (!(auth instanceof AnonymousAuthenticationToken)) {
			        userDetails = (UserDetails) auth.getPrincipal();
			        userId = userDetails.getUsername();
			}

//			MemberVO member = (MemberVO)session.getAttribute("member");
//			String userId = member.getUserId();
//			String userId = "testId";
			
			int cartNum = 0;
			
			for(String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart.setUserId(userId);
				cart.setCartNum(cartNum);
			}
			
			// 삭제 처리 후 세션 업데이트를 위한 코드 2줄
			List<CartListVO> cartList = service.getCartList(cart);
			session.setAttribute("cartList", cartList);
			
			return new ResponseEntity<>(cartList, HttpStatus.OK);
		}
	
	// 카트 수량 수정
	@ResponseBody
	@PostMapping("/updateCart")
	public String updateCart(@RequestParam(value = "chbox[]") List<String> chArr, @RequestParam(value = "stock[]") List<String> chSt, CartVO cart, HttpSession session) {
		log.info("get modify cart");
		
		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = null;
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		        userDetails = (UserDetails) auth.getPrincipal();
		        userId = userDetails.getUsername();
		}
		
//		MemberVO member = (MemberVO)session.getAttribute("member");
//		String userId = member.getUserId();
//		String userId = "testId";
		
		log.info("chArr값" + chArr);
		log.info("chSt값" + chSt);
		
		String result = "0";
		int cartNum = 0;
		int num = 0;
		
		if(userId != null) {
			cart.setUserId(userId);
			
			for(String i : chArr) {
				cartNum = Integer.parseInt(i);
				for (String u : chSt) {
				num = Integer.parseInt(u);
				}
				log.info("cartNum값" + cartNum);
				cart.setCartNum(cartNum);
				cart.setCartStock(num);
				log.info("num값" + num);
				service.updateCart(cart);
			}
			
			
			result = "1";
		}
		
		// 수량 수정 처리 후 세션 업데이트를 위한 코드 2줄
		List<CartListVO> cartList = service.cartList(userId);
		session.setAttribute("cartList", cartList);
		
		
		return result;
	}
	
	// 주문
	@PostMapping("/cartList")
	public String order(OrderVO order, OrderDetailVO orderDetail) {
		log.info("order");
		
		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = null;
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		        userDetails = (UserDetails) auth.getPrincipal();
		        userId = userDetails.getUsername();
		}
		
//		MemberVO member = (MemberVO)session.getAttribute("member");
//		String userId = member.getUserId();
//		String userId = "testId";
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for(int i = 1; i <= 6; i++) {
			subNum += (int)(Math.random() * 10);
		}
		
		String orderId = ymd + "_" + subNum;
		
		order.setOrderId(orderId);
		order.setUserId(userId);
		
		service.orderInfo(order);
		
		orderDetail.setOrderId(orderId);
		service.orderInfo_Details(orderDetail);
		
		service.cartAllDelete(userId);
		
		return "redirect:/shop/orderList";
	}
	
	// 주문 정보 수정 페이지
	@GetMapping("orderModify")
	public void get(@RequestParam("n") String orderId, OrderVO order, Model model) {
		log.info("/get");
		
		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = null;
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		        userDetails = (UserDetails) auth.getPrincipal();
		        userId = userDetails.getUsername();
		}
		
//		MemberVO member = (MemberVO)session.getAttribute("member");
//		String userId = member.getUserId();
//		String userId = "testId";
		
		order.setUserId(userId);
		order.setOrderId(orderId);
		
		List<OrderListVO> orderView = service.orderView(order);
		
		model.addAttribute("orderView", orderView);
	}
	
	// 주문 정보 수정
	@PostMapping("orderModify")
	public String orderModify(OrderVO order, OrderDetailVO orderDetail) {
		
		log.info("order값 확인" + order);
		
		service.orderModify(order);
		
		return "redirect:/shop/orderList";
	}
	
	// 주문 목록
	@GetMapping("/orderList")
	public void getOrderList(OrderVO order, Model model) {
		log.info("get order List");
		
		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = null;
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		        userDetails = (UserDetails) auth.getPrincipal();
		        userId = userDetails.getUsername();
		}
		
//		MemberVO member = (MemberVO)session.getAttribute("member");
//		String userId = member.getUserId();		
//		String userId = "testId";
		
		order.setUserId(userId);
		
		List<OrderVO> orderList = service.orderList(order);
		
		model.addAttribute("orderList", orderList);
	}
	
	// 주문 상세 목록
	@GetMapping("orderView")
	public void getOrderList(@RequestParam("n") String orderId, OrderVO order, Model model) {
		log.info("get order view");
		
		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = null;
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		        userDetails = (UserDetails) auth.getPrincipal();
		        userId = userDetails.getUsername();
		}
		
//		MemberVO member = (MemberVO)session.getAttribute("member");
//		String userId = member.getUserId();
//		String userId = "testId";
		
		order.setUserId(userId);
		order.setOrderId(orderId);
		
		List<OrderListVO> orderView = service.orderView(order);
		
		model.addAttribute("orderView", orderView);
	}
	
	// 환불 신청 된 것 체크
	@ResponseBody
	@GetMapping(value="/cancelCheck", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<OrderListVO>> cancelCheck(@RequestParam("n") String orderId, Model model) {
		
		List<OrderListVO> check = service.cancelCheck(orderId);
		
		model.addAttribute("cancelCheck", check);
		
		log.info("check값:" + check);
	
		return new ResponseEntity<>(check, HttpStatus.OK);

	}
	
	// 환불 신청
	@GetMapping("refund")
	public void cancelOrder(@RequestParam("n") String orderId, OrderVO order, Model model) {
		log.info("get order refund");
		
		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = null;
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		        userDetails = (UserDetails) auth.getPrincipal();
		        userId = userDetails.getUsername();
		}
		
//		MemberVO member = (MemberVO)session.getAttribute("member");
//		String userId = member.getUserId();
//		String userId = "testId";
		
		order.setUserId(userId);
		order.setOrderId(orderId);
		
		log.info("order값:" + order);
		
		List<OrderListVO> refund = service.orderView(order);
		
		model.addAttribute("refund", refund);
		
		log.info("refund값:" + refund);
	}
	
	// 환불 신청
		@PostMapping("refund")
		public String refund(@RequestParam(value="orderId") String orderId, @RequestParam(value="gdsNum") List<Integer> gdsNum, @RequestParam(value="refundStock") List<Integer> refundStock, Model model, OrderVO order) {
			log.info("get order refund");
			
//			UserDetails userDetails;
//			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//			
//			String userId = null;
//			
//			if (!(auth instanceof AnonymousAuthenticationToken)) {
//			        userDetails = (UserDetails) auth.getPrincipal();
//			        userId = userDetails.getUsername();
//			}
			
//			MemberVO member = (MemberVO)session.getAttribute("member");
//			String userId = member.getUserId();
//			String userId = "testId";
			
			Iterator it = gdsNum.iterator();
			int i = 0; 
			RefundDetailVO refund = new RefundDetailVO();
			
			while(it.hasNext()) {
				refund.setOrderId(orderId);
				refund.setGdsNum((int) it.next());
				refund.setRefundStock(refundStock.get(i));
				if (refundStock.get(i) != 0) {
				service.refund(refund);
				}
				log.info("i값" + i);
				log.info("refund값" + refund);
				i++;		
			}
			
			log.info("order값" + order);
			
			return "redirect:/shop/refundList";
		}
		
		// 환불 목록
		@GetMapping("/refundList")
		public void getRefundList(OrderVO order, Model model) {
			log.info("get order List");
			
			UserDetails userDetails;
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			
			String userId = null;
			
			if (!(auth instanceof AnonymousAuthenticationToken)) {
			        userDetails = (UserDetails) auth.getPrincipal();
			        userId = userDetails.getUsername();
			}
			
//			MemberVO member = (MemberVO)session.getAttribute("member");
//			String userId = member.getUserId();		
//			String userId = "testId";
			
			order.setUserId(userId);
			
			List<OrderListVO> refundList = service.refundList(order);
			
			log.info("refundList값:" + refundList);
			
			model.addAttribute("refundList", refundList);
		}
		
		// 환불 상세 목록
		@GetMapping("refundView")
		public void getRefundList(@RequestParam("n") String orderId, OrderVO order, Model model) {
			log.info("get order view");
			
			UserDetails userDetails;
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			
			String userId = null;
			
			if (!(auth instanceof AnonymousAuthenticationToken)) {
			        userDetails = (UserDetails) auth.getPrincipal();
			        userId = userDetails.getUsername();
			}
			
//			MemberVO member = (MemberVO)session.getAttribute("member");
//			String userId = member.getUserId();
//			String userId = "testId";
			
			order.setUserId(userId);
			order.setOrderId(orderId);
			
			List<OrderListVO> refundView = service.refundView(order);
			
			model.addAttribute("refundView", refundView);
		}
}
