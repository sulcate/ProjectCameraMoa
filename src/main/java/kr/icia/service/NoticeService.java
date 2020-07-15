package kr.icia.service;

import java.util.List;

import kr.icia.domain.Criteria;
import kr.icia.domain.NoticeVO;

public interface NoticeService {
	
	public void register(NoticeVO notice);
	
	public NoticeVO get(Long nbno);
	
	public boolean modify(NoticeVO notice);
	
	public boolean remove(Long nbno);
	
	public List<NoticeVO> getList(Criteria cri);
	
	public List<NoticeVO> getList();
	
	public int getTotal(Criteria cri);


}
