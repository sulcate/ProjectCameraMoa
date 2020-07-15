package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
//	orderId varchar2(50) not null,
//	userId varchar2(50) not null,
//	orderRec varchar2(50) not null,
//	userAddr1 varchar2(50) not null,
//	userAddr2 varchar2(50) not null,
//	userAddr3 varchar2(50) not null,
//	orderPhon varchar2(30) not null,
//	amount number not null,
//	orderDate Date default sysdate,
	
	private String orderId;
	private String userId;
	private String orderRec;
	private String postCode;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String orderPhon;
	private int amount;
	private Date orderDate;
	
	private String delivery;

}
