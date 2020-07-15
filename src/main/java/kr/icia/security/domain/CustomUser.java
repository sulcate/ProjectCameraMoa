package kr.icia.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.icia.domain.MemberVO;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Data
@ToString
public class CustomUser extends User {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private MemberVO member;

	public CustomUser(String userid, String userpw, Collection<? extends GrantedAuthority> auth) {
		super(userid, userpw, auth);
	}

	public CustomUser(MemberVO vo) {
		super(vo.getUserid(), vo.getUserpw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		this.member = vo;
	}

}
