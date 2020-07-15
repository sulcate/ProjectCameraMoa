package kr.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.icia.domain.Criteria;
import kr.icia.domain.InquiryAttachVO;
import kr.icia.domain.InquiryVO;
import kr.icia.mapper.InquiryAttachMapper;
import kr.icia.mapper.InquiryMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class InquiryServiceImpl implements InquiryService {

	@Setter(onMethod_ =@Autowired)
	private InquiryMapper mapper;
	
	@Setter(onMethod_ =@Autowired)
	private InquiryAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(InquiryVO inquiry) {

		mapper.insertSelectKey(inquiry);
		if(inquiry.getAttachList() == null || inquiry.getAttachList().size() <=0) {
			return;
		}
		
		inquiry.getAttachList().forEach(attach -> {
			attach.setIbno(inquiry.getIbno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public InquiryVO get(int ibno) {

		return mapper.read(ibno);
	}

	@Override
	   public boolean modify(InquiryVO inquiry) {
	            
	      attachMapper.deleteAll(inquiry.getIbno());
	      boolean modifyResult = mapper.update(inquiry) == 1;
	      
	      if (modifyResult && inquiry.getAttachList() != null && inquiry.getAttachList().size() > 0) {
	         
	         inquiry.getAttachList().forEach(attach -> {
	            
	            attach.setIbno(inquiry.getIbno());
	            attachMapper.insert(attach);
	         });
	      }
	      return modifyResult;
	   }

	@Override
	public boolean remove(int ibno) {
		
		attachMapper.deleteAll(ibno);
		
		return mapper.delete(ibno) == 1;
	}

	@Override
	public List<InquiryVO> getList(Criteria cri) {

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		return mapper.getTotalCount(cri);
	}

	@Override
	public void inquiryReply(InquiryVO inquiry) {

		mapper.reply(inquiry);
	}
	
	@Override
	public List<InquiryAttachVO> getAttachList(int ibno) {
		
		return attachMapper.findByIbno(ibno);
	}

	@Override
	public List<InquiryVO> getMyList(Criteria cri) {

		return mapper.getMyListWithPaging(cri);
	}

	@Override
	public List<InquiryVO> getList2(Criteria cri) {
		return mapper.getList2(cri);
		
	}

	@Override
	public InquiryVO selectRef(int ibno) {
		return mapper.selectRef(ibno);
	}

	@Override
	public void deleteReply(int ref) {
		mapper.deleteReply(ref);
	}

}
