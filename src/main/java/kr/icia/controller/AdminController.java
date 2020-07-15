package kr.icia.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.icia.domain.BoardAttachVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.GoodsVO;
import kr.icia.domain.InquiryAttachVO;
import kr.icia.domain.InquiryVO;
import kr.icia.domain.MemberVO;
import kr.icia.domain.NoticeVO;
import kr.icia.domain.OrderListVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.RefundDetailVO;
import kr.icia.service.AdminService;
import kr.icia.service.BoardService;
import kr.icia.service.InquiryService;
import kr.icia.service.NoticeService;
import kr.icia.service.ShopService;
import kr.icia.utils.UploadFileUtils;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
@AllArgsConstructor
public class AdminController {

	private AdminService service;
	private NoticeService service2;
	private ShopService service3;
	private InquiryService service4;
	private BoardService service5;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 관리자화면
	@GetMapping("/index")
	public void getIndex() throws Exception {
		log.info("get index");
	}

	// 상품 목록
	@GetMapping("/goods/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}

	// 글쓰기 버튼 누를시, 입력폼 보이게
	@GetMapping("/goods/register")
	public void register(Model model) {

	}

	// 실제 상품 등록처리.
	@PostMapping("/goods/register")
	public String register(GoodsVO vo, MultipartFile file, RedirectAttributes rttr, HttpServletRequest request)
			throws Exception {

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		log.info("ymdPath" + ymdPath);

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			log.info("파일명이 넘어오는지 확인");
			
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			// gdsImg에 원본 파일 경로 + 파일명 저장
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else { // 첨부된 파일이 없으면
			fileName = File.separator + "images" + File.separator + "none.png";
			// 미리 준비된 none.png 파일을 대신 출력함
			
			vo.setGdsImg(fileName);
			vo.setGdsThumbImg(fileName);
		}

		log.info("register : " + vo);
		service.register(vo);

		return "redirect:/admin/goods/list";
	}

	
	@GetMapping({ "/goods/view", "/goods/modify" })
	public void get(@RequestParam("n") int gdsnum, Model model) {
		log.info("/get");
		model.addAttribute("goods", service.get(gdsnum));
	}

	// 상품 수정
	@PostMapping("/goods/modify")
	public String modify(GoodsVO vo, MultipartFile file, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		log.info("modify:" + vo);
		
		log.info(file.getOriginalFilename());
		log.info(file.getOriginalFilename() !=null);
		log.info(!file.getOriginalFilename().equals(""));
		log.info(file.getOriginalFilename() != "");
		
		// 새로운 파일이 등록되었는지 확인
		if(file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
			log.info("if문이 돌아가는지 확인");
			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("gdsImg")).delete();
			new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
			
			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			vo.setGdsImg(req.getParameter("gdsImg"));
			vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));
		}
		
		

		if (service.modify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/goods/list";
	}

	@PostMapping("/goods/delete")
	public String remove(@RequestParam("n") int gdsnum, RedirectAttributes rttr) {
		log.info("remove..." + gdsnum);
		
		if (service.remove(gdsnum)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/goods/list";
	}
	
	// ck 에디터에서 파일 업로드
	@PostMapping("/goods/ckUpload")
	public void postCKEditorImgUpload(HttpServletRequest req,
	         HttpServletResponse res,
	         @RequestParam MultipartFile upload) throws Exception {
	 log.info("post CKEditor img upload");
	 
	 // 랜덤 문자 생성
	 UUID uid = UUID.randomUUID();
	 
	 OutputStream out = null;
	 PrintWriter printWriter = null;
	   
	 // 인코딩
	 res.setCharacterEncoding("utf-8");
	 res.setContentType("text/html;charset=utf-8");
	 
	 try {
	  
	  String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
	  byte[] bytes = upload.getBytes();
	  
	  // 업로드 경로
	  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
	  
	  out = new FileOutputStream(new File(ckUploadPath));
	  out.write(bytes);
	  out.flush(); // out에 저장된 데이터를 전송하고 초기화
	  
	  String callback = req.getParameter("CKEditorFuncNum");
	  printWriter = res.getWriter();
	  String fileUrl = "/ckUpload/" + uid + "_" + fileName; // 작성화면
	  
	  // 업로드시 메시지 출력
	  printWriter.println("<script type='text/javascript'>"
	     + "window.parent.CKEDITOR.tools.callFunction("
	     + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
	     +"</script>");
	  
	  printWriter.flush();
	  
	 } catch (IOException e) { e.printStackTrace();
	 } finally {
	  try {
	   if(out != null) { out.close(); }
	   if(printWriter != null) { printWriter.close(); }
	  } catch(IOException e) { e.printStackTrace(); }
	 }
	 
	 return; 
	}
	
	// 주문 목록
	@GetMapping("/shop/orderList")
	public void getOrderList(Model model) {
		log.info("get order list");
		
		List<OrderVO> orderList = service.orderList();
		
		log.info("oderList값" + orderList);
		
		model.addAttribute("orderList", orderList);
	}
	
	// 주문 상세 목록
	@GetMapping("/shop/orderView")
	public void getOrderList(@RequestParam("n") String orderId, OrderVO order, Model model) {
		log.info("get order view");
		
		order.setOrderId(orderId);
		List<OrderListVO> orderView = service.orderView(order);
		
		model.addAttribute("orderView", orderView);
	}
	
	// 주문 상세 목록 - 상태 변경
	@PostMapping("/shop/orderView")
	public String delivery(OrderVO order) {
		log.info("post order view");
		
		service.delivery(order);
		
		log.info(order.getDelivery());
		
		// delivery값이 배송중 일시 상품 수량 감소
		if (order.getDelivery().equals("배송 중")) {
			log.info("if문 실행여부 확인");
		List<OrderListVO> orderView = service.orderView(order);
		GoodsVO goods = new GoodsVO();
		
		for(OrderListVO i : orderView) {
			goods.setGdsNum(i.getGdsNum());
			goods.setGdsStock(i.getCartStock());
			service.changeStock(goods);
		}
			
		}
		
		
		return "redirect:/admin/shop/orderList";
	}
	
	// 주문취소시, delivery 상태 바꾸고 주문목록 이동
	@PostMapping("/shop/delivery")
	public String delivery2(OrderVO order) {
		log.info("post order view");
		log.info("order의값은?" + order);
		
		service.delivery(order);
		
		return "redirect:/shop/orderList";
	}
	
	// 환불취소시, state 상태 바꾸고, 환불 테이블 삭제 후 환불목록 이동
	@PostMapping("/shop/state")
	public String delivery3(RefundDetailVO order) {
		log.info("post order view");
		log.info("order의값은?" + order);
			
		service3.deleteRefund(order);
		service3.state(order);
			
		return "redirect:/shop/refundList";
	}
	
	// 공지사항 목록
	@GetMapping("/board/noticeList")
	public void noticeList(Criteria cri, Model model) {
		log.info("get notice list...");
		model.addAttribute("list", service2.getList());

//		int total = service2.getTotal(cri);
//		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// 공지사항 읽기
	@GetMapping({ "/board/noticeGet", "/board/noticeModify" })
	public void get(@RequestParam("n") Long nbno, Model model) {

		model.addAttribute("notice", service2.get(nbno));
	}
	
	// 공지사항 수정
	@PostMapping("/board/noticeModify")
	public String modify(NoticeVO notice, RedirectAttributes rttr) {

		if (service2.modify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/board/noticeList";
	}
	
	// 공지사항 삭제
	@PostMapping("/board/noticeRemove")
	public String remove(@RequestParam("n") Long nbno, RedirectAttributes rttr) {

		if (service2.remove(nbno)) {

			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/board/noticeList";
	}
	
	// 공지사항 등록 페이지 이동
	@GetMapping("/board/noticeRegister")
	public void register() {

	}
	
	// 공지사항 등록
	@PostMapping("/board/noticeRegister")
	public String register(NoticeVO notice, RedirectAttributes rttr) {

		service2.register(notice);
		rttr.addFlashAttribute("result", notice.getNbno());

		return "redirect:/admin/board/noticeList";
	}
	
	// 환불 목록
	@GetMapping("/shop/refundList")
	public void getRefundList(Model model) {
		log.info("get refund list");
			
		List<OrderListVO> refundList = service.refundList();
			
		log.info("refundList값" + refundList);
			
		model.addAttribute("refundList", refundList);
	}
	
	// 환불 상세 목록
	@GetMapping("/shop/refundView")
	public void getRefundList(@RequestParam("n") String orderId, OrderVO order, Model model) {
		log.info("get refund view");
			
		order.setOrderId(orderId);
		List<OrderListVO> refundView = service.refundView(order);
			
		model.addAttribute("refundView", refundView);
	}
	
	// 환불 상세 목록 - 상태 변경
	@PostMapping("/shop/refundView")
	public String state(RefundDetailVO order) {
		log.info("post refund view");
			
		service.state(order);
			
		log.info(order.getState());
			
		// state값이 환불 완료 일시 상품 수량 증가
		if (order.getState().equals("환불 완료")) {
			OrderVO orderId = new OrderVO();
			orderId.setOrderId(order.getOrderId());
			log.info("if문 실행여부 확인");
		List<OrderListVO> orderView = service.orderView(orderId);
		GoodsVO goods = new GoodsVO();
			
		for(OrderListVO i : orderView) {
			goods.setGdsNum(i.getGdsNum());
			goods.setGdsStock(i.getCartStock());
			service.changeStock2(goods);
		}
				
		}
					
		return "redirect:/admin/shop/refundList";
	}
	
	// 유저 목록
	@GetMapping("/user/userList")
	public void userList(Model model) {
		log.info("userList");
		model.addAttribute("userList", service.userList());
	}
	
	// 환불취소시, delivery 상태 바꾸고, 환불 테이블 삭제 후 환불목록 이동
	@PostMapping("/user/userList")
	public String userAuth(MemberVO member) {
		log.info("post order view");
		log.info("order의값은?" + member);
			
		service.userAuth(member);
			
		return "redirect:/admin/user/userList";
	}
	
	// 문의 게시판 목록
	@GetMapping("/board/inquiryList")
	public void InquiryList(Criteria cri, Model model) {
		log.info("get notice list...");
		model.addAttribute("list", service4.getList2(cri));
		
		log.info("getList값" + service4.getList2(cri));

//		int total = service2.getTotal(cri);
//		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// 문의글 상세보기, 수정하기
	@GetMapping({"/board/inquiryGet" , "/board/inquiryModify"})
	public void get(@RequestParam("ibno") int ibno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		model.addAttribute("inquiry", service4.get(ibno));
	}
	
	// 문의글 답변달기 이동
	@GetMapping("/board/inquiryReply")
	public void get2(@RequestParam("ibno") int ibno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		model.addAttribute("inquiry", service4.get(ibno));
	}
	
	// 문의글 답변달기
	@PostMapping("/board/inquiryReply")
	public String inquiryReply(InquiryVO inquiry, RedirectAttributes rttr) {
		
		log.info("inquiry값 확인:" + inquiry);
		
		service4.inquiryReply(inquiry);
		rttr.addFlashAttribute("result", inquiry.getIbno());
		
		return "redirect:/admin/board/inquiryList";
	}
	
	// 문의글 수정
	@PostMapping("/board/inquiryModify")
	public String modify(InquiryVO inquiry, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if (service4.modify(inquiry)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/admin/board/inquiryList" + cri.getListLink();
	}
	
	// inquiry 파일 삭제 메소드
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
	
	// 문의글 삭제
	@PostMapping("/board/inquiryRemove")
	public String remove(@RequestParam("ibno") int ibno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		InquiryVO check = service4.selectRef(ibno);

		List<InquiryAttachVO> attachList = service4.getAttachList(ibno);
		if (service4.remove(ibno)) {
			if (check.getLev() == 0) {
				service4.deleteReply(check.getRef());
			}
			
			deleteFiles(attachList);	
			rttr.addFlashAttribute("result", "success");
		}
				
		return "redirect:/admin/board/inquiryList" + cri.getListLink();
	}
	
	// 구매후기 목록
	@GetMapping("/board/reviewList")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service5.getList());

//		int total = service5.getTotal(cri);
//		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// 구매후기 글 보기
	@GetMapping({ "/board/reviewGet", "/board/reviewModify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

		model.addAttribute("review", service5.get(bno));
	}
	
	// review 파일 삭제 메소드
	private void deleteFiles2(List<BoardAttachVO> attachList) {

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
	
	// 구매후기 삭제
	@PostMapping("/board/reviewRemove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		List<BoardAttachVO> attachList = service5.getAttachList(bno);
		
			service5.removeReply(bno);
			service5.remove(bno);
			deleteFiles2(attachList);
			rttr.addFlashAttribute("result", "success");

		return "redirect:/admin/board/reviewList";
	}
}
