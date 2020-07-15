package kr.icia.mapper;

import org.apache.ibatis.annotations.Param;

import kr.icia.domain.AuthVO;
import kr.icia.domain.MemberVO;

public interface MemberMapper {
//	@Autowired
//	SqlSession sqlsession = null;

	public int idCheck(MemberVO vo);

	public MemberVO read(String userid);

	public void insert(MemberVO vo);

	public void insertAuth(AuthVO auth);

	public void deleteUser(String userid);

	public void deleteAuth(String userid);

	public int emCheck(MemberVO vo);

	public String findUseridResult(@Param("userName") String userName, @Param("userEmail") String userEmail);

	public void updateUser(MemberVO vo);

	public MemberVO get(String userid);
	
	public String getPw(String userid);
	
	public int findUseridCheck(MemberVO vo);
	
	public int findUserpwCheck(MemberVO vo);
	
	public void setUserpw(MemberVO vo);
	
}
