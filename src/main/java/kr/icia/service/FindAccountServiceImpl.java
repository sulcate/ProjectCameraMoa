package kr.icia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.icia.domain.MemberVO;
import kr.icia.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FindAccountServiceImpl implements FindAccountService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Override
	public String findUseridResult(String userName, String userEmail) throws Exception {
		String id = mapper.findUseridResult(userName, userEmail);
		log.info("----------------id--------------" + id);

		return id;
	}

	@Override
	public int findUseridCheck(MemberVO vo) {
		int result = mapper.findUseridCheck(vo);
		return result;
	}

	@Override
	public int findUserpwCheck(MemberVO vo) {
		int result = mapper.findUserpwCheck(vo);
		return result;
	}

	@Override
	public void setUserpw(MemberVO vo) {
		mapper.setUserpw(vo);

	}

}
