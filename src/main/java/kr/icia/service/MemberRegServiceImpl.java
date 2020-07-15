package kr.icia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.icia.domain.AuthVO;
import kr.icia.domain.MemberVO;
import kr.icia.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberRegServiceImpl implements MemberRegService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Override
	public void register(MemberVO vo, AuthVO auth) {
		log.info("register...." + vo);
		mapper.insert(vo);
		mapper.insertAuth(auth);

	}

	@Override
	public int idCheck(MemberVO vo) throws Exception {
		int result = mapper.idCheck(vo);
		return result;

	}

	@Override
	public int emCheck(MemberVO vo) throws Exception {
		int result = mapper.emCheck(vo);
		return result;
	}

	@Override
	public MemberVO read(String userid) {
		MemberVO vo = mapper.read(userid);
		return vo;

	}

	@Override
	public void updateUser(MemberVO vo) throws Exception {
		mapper.updateUser(vo);
	}

	@Override
	public MemberVO get(String userid) {
		MemberVO vo = mapper.get(userid);
		return vo;

	}

	@Override
	public void delete(String userid) throws Exception {
		mapper.deleteAuth(userid);
		mapper.deleteUser(userid);

	}

	@Override
	public String getPw(String userid) {
		String result = mapper.getPw(userid);
		return result;
	}

}
