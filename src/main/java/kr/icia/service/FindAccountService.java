package kr.icia.service;

import kr.icia.domain.MemberVO;

public interface FindAccountService {

	public String findUseridResult(String userName, String userEmail) throws Exception;

	public int findUseridCheck(MemberVO vo);

	public int findUserpwCheck(MemberVO vo);

	public void setUserpw(MemberVO vo);

}
