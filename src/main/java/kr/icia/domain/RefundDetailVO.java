package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RefundDetailVO {

//	  refundNum number not null,
//    orderId varchar2(50) not null,
//    gdsNum number not null,
//    refundStock number not null,
//	  state varchar2(20) default '환불 신청',
//	  refundDate Date default sysdate,
	
	private int refundNum;
	private String orderId;
	private int gdsNum;
	private int refundStock;
	private String state;
	private Date refundDate;
	
}
