package kr.icia.service;

import kr.icia.domain.AuthVO;
import kr.icia.domain.MemberVO;

public interface MemberRegService {

	public void register(MemberVO vo, AuthVO auth) throws Exception;

	public void delete(String userid) throws Exception;

	public int idCheck(MemberVO vo) throws Exception;

	public int emCheck(MemberVO vo) throws Exception;

	public void updateUser(MemberVO vo) throws Exception;

	public MemberVO read(String userid);

	public MemberVO get(String userid);

	public String getPw(String userid);
}
