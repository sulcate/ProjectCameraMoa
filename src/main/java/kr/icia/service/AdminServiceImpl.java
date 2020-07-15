package kr.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.icia.domain.GoodsVO;
import kr.icia.domain.MemberVO;
import kr.icia.domain.OrderListVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.RefundDetailVO;
import kr.icia.mapper.AdminMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	@Override
	public void register(GoodsVO vo) {
		log.info("register......" + vo);
		mapper.register(vo);

	}

	@Override
	public GoodsVO get(int gdsnum) {
		log.info("get......" + gdsnum);
		return mapper.read(gdsnum);
	}

	@Override
	public boolean modify(GoodsVO vo) {
		log.info("modify......" + vo);
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(int gdsnum) {
		log.info("remove......" + gdsnum);
		return (mapper.delete(gdsnum)) == 1;
	}

	@Override
	public List<GoodsVO> getList() {
		log.info("getList......");
		return mapper.getList();
	}

	@Override
	public List<GoodsVO> getCateCode() {
		log.info("getCateCode.....");
		return mapper.getCateCode();
	}

	@Override
	public List<OrderVO> orderList() {
		return mapper.orderList();
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) {
		return mapper.orderView(order);
	}

	@Override
	public void state(RefundDetailVO order) {
		mapper.state(order);
	}

	@Override
	public void changeStock(GoodsVO goods) {
		mapper.changeStock(goods);
	}

	@Override
	public List<GoodsVO> bestGdsN() {
		return mapper.bestGdsN();
	}

	@Override
	public GoodsVO getbest(GoodsVO goods) {
		return mapper.getbest(goods);
	}

	@Override
	public List<GoodsVO> getList1() {
		return mapper.getList1();
	}

	@Override
	public List<GoodsVO> getList2() {
		return mapper.getList2();
	}

	@Override
	public List<GoodsVO> getList3() {
		return mapper.getList3();
	}

	@Override
	public List<GoodsVO> getList4() {
		return mapper.getList4();
	}

	@Override
	public List<GoodsVO> getList5() {
		return mapper.getList5();
	}

	@Override
	public List<OrderListVO> refundList() {
		return mapper.refundList();
	}

	@Override
	public List<OrderListVO> refundView(OrderVO order) {
		return mapper.refundView(order);
	}

	@Override
	public void changeStock2(GoodsVO goods) {
		mapper.changeStock2(goods);
		
	}

	@Override
	public List<MemberVO> userList() {
		return mapper.userList();
	}

	@Override
	public void userAuth(MemberVO member) {
		mapper.userAuth(member);
	}

	@Override
	public void delivery(OrderVO order) {
		mapper.delivery(order);
	}

}
