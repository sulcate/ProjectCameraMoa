package kr.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.icia.domain.CartListVO;
import kr.icia.domain.CartVO;
import kr.icia.domain.OrderDetailVO;
import kr.icia.domain.OrderListVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.RefundDetailVO;
import kr.icia.mapper.ShopMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ShopServiceImpl implements ShopService {

	@Setter(onMethod_ = @Autowired)
	private ShopMapper mapper;
	
	@Override
	public void addCart(CartVO cart) {
		mapper.addCart(cart);
	}

	@Override
	public List<CartListVO> cartList(String userId) {
		return mapper.cartList(userId);
	}

	@Override
	public void deleteCart(CartVO cart) {
		mapper.deleteCart(cart);
	}

	@Override
	public int updateCart(CartVO cart) {
		return mapper.updateCart(cart);
	}

	@Override
	public void orderInfo(OrderVO order) {
		mapper.orderInfo(order);	
	}

	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) {
		mapper.orderInfo_Details(orderDetail);
	}

	@Override
	public void cartAllDelete(String userId) {
		mapper.cartAllDelete(userId);
	}

	@Override
	public List<OrderVO> orderList(OrderVO order) {
		return mapper.orderList(order);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) {
		return mapper.orderView(order);
	}

	@Override
	public void orderModify(OrderVO order) {
		mapper.orderModify(order);
	}

	@Override
	public List<CartListVO> getCartList(CartVO cart) {
		return mapper.getCartList(cart);
	}

	@Override
	public void refund(RefundDetailVO refund) {
		mapper.refund(refund);
		
	}

	@Override
	public List<OrderListVO> refundList(OrderVO order) {
		return mapper.refundList(order);
	}

	@Override
	public List<OrderListVO> refundView(OrderVO order) {
		return mapper.refundView(order);
	}

	@Override
	public void modifyCart(CartVO cart) {
		mapper.modifyCart(cart);
	}

	@Override
	public List<OrderListVO> cancelCheck(String orderId) {
		return mapper.cancelCheck(orderId);
	}

	@Override
	public void state(RefundDetailVO order) {
		mapper.state(order);
	}

	@Override
	public void deleteRefund(RefundDetailVO order) {
		mapper.deleteRefund(order);
	}

}
