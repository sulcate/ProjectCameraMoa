package kr.icia.mapper;

import java.util.List;

import kr.icia.domain.InquiryAttachVO;

public interface InquiryAttachMapper {
	
	public void insert(InquiryAttachVO vo);
	
	public void delete(String uuid);
	
	public List<InquiryAttachVO> findByIbno(int ibno);
	
	public void deleteAll(int ibno);

}
