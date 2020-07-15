package kr.icia.service;

import java.util.List;

import kr.icia.domain.Criteria;
import kr.icia.domain.InquiryAttachVO;
import kr.icia.domain.InquiryVO;

public interface InquiryService {

	public void register(InquiryVO inquiry);
	
	public InquiryVO get(int ibno);
	
	public boolean modify(InquiryVO inquiry);
	
	public boolean remove(int ibno);
	
	public List<InquiryVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);

	public void inquiryReply(InquiryVO inquiry);
	
	public List<InquiryAttachVO> getAttachList(int ibno);
	
	public List<InquiryVO> getMyList(Criteria cri);

	// 관리자 페이지에 질문글만 보이게
	public List<InquiryVO> getList2(Criteria cri);

	// 문의글 삭제시, 답변글도 같이 삭제하기 위한 Ref,lev값 뽑아오기
	public InquiryVO selectRef(int ibno);

	// 문의글 삭제시, lev값이 0이라면(답변글이 아닌경우) 해당글의 모든 답변글도 삭제
	public void deleteReply(int ref);
	
}
