package kr.icia.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userid;
	private String userpw;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userZipCode;
	private String userFirAddr;
	private String userSecAddr;
	private String UserAddrDetail;
	private List<AuthVO> authList;
	
	private String auth;
}
