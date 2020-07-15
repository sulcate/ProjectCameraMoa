package kr.icia.security;

import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.icia.domain.MemberVO;
import kr.icia.mapper.MemberMapper;
import kr.icia.security.domain.CustomUser;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	@Setter(onMethod_ = { @Autowired })
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		log.warn("Load User By UserName : " + userid);
		// usreName means userid

		MemberVO vo = memberMapper.read(userid);

		log.warn("true가 나오는지?" + vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		log.warn("queried by member mapper: " + vo);
		return vo == null ? null : new CustomUser(vo);
		
	}

}
