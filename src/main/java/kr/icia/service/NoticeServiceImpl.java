package kr.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.icia.domain.Criteria;
import kr.icia.domain.NoticeVO;
import kr.icia.mapper.NoticeMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	@Setter(onMethod_ =@Autowired)
	private NoticeMapper mapper;
	
	
	@Override
	public void register(NoticeVO notice) {
		
		mapper.insertSelectKey(notice);
		
	}

	@Override
	public NoticeVO get(Long nbno) {

		return mapper.read(nbno);
	}

	@Override
	public boolean modify(NoticeVO notice) {

		boolean modifyResult = mapper.update(notice) == 1;
				
		return modifyResult;
	}

	@Override
	public boolean remove(Long nbno) {

		
		return mapper.delete(nbno) == 1;
	}

	@Override
	public List<NoticeVO> getList() {
		log.info("getList...");
		return mapper.getList();
	}
	
	@Override
	public List<NoticeVO> getList(Criteria cri) {

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		return mapper.getTotalCount(cri);
	}

		
}
