package kr.icia.service;

import java.util.List;

import kr.icia.domain.CartListVO;
import kr.icia.domain.CartVO;
import kr.icia.domain.OrderDetailVO;
import kr.icia.domain.OrderListVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.RefundDetailVO;

public interface ShopService {
	
	// 카트 담기
	public void addCart(CartVO cart);
	
	// 카트 리스트
	public List<CartListVO> cartList(String userId);
	
	// 특정 카트 리스트 가져오기
	public List<CartListVO> getCartList(CartVO cart);
	
	// 카트 삭제
	public void deleteCart(CartVO cart);
	
	// 카트 수량 수정
	public int updateCart(CartVO cart);
	
	// 주문 정보
	public void orderInfo(OrderVO order);
	
	// 주문 상세 정보
	public void orderInfo_Details(OrderDetailVO orderDetail);
	
	// 카트 비우기
	public void cartAllDelete(String userId);
	
	// 주문 목록
	public List<OrderVO> orderList(OrderVO order);
	
	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order);
	
	// 주문 정보 수정
	public void orderModify(OrderVO order);

	// 주문 환불
	public void refund(RefundDetailVO refund);
	
	// 환불 목록
	public List<OrderListVO> refundList(OrderVO order);

	// 특정 환불 목록
	public List<OrderListVO> refundView(OrderVO order);

	// 카트 담기시, 중복상품은 수량만 추가
	public void modifyCart(CartVO cart);

	// 이미 환불 취소된 상품인지 체크
	public List<OrderListVO> cancelCheck(String orderId);

	// 환불 취소시, 환불 상태 변경
	public void state(RefundDetailVO order);

	// 환불 취소시, db삭제
	public void deleteRefund(RefundDetailVO order);

}
