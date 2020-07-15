package kr.icia.mapper;

import java.util.List;

import kr.icia.domain.Criteria;
import kr.icia.domain.InquiryVO;

public interface InquiryMapper {
	
	public List<InquiryVO> getList();

	public void insert(InquiryVO inquiry);

	public void insertSelectKey(InquiryVO inquiry);

	public InquiryVO read(int ibno);

	public int delete(int ibno);

	public int update(InquiryVO inquiry);
	
	public List<InquiryVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);

	public void reply(InquiryVO inquiry);

	public List<InquiryVO> getMyListWithPaging(Criteria cri);

	// 관리자 페이지에 질문글만 보이게
	public List<InquiryVO> getList2(Criteria cri);

	// 문의글 삭제시, 답변글도 같이 삭제하기 위한 Ref,lev값 뽑아오기
	public InquiryVO selectRef(int ibno);

	// 문의글 삭제시, lev값이 0이라면(답변글이 아닌경우) 해당글의 모든 답변글도 삭제
	public void deleteReply(int ref);

}
