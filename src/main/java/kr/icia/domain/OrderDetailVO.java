package kr.icia.domain;

import lombok.Data;

@Data
public class OrderDetailVO {
	
//	orderDetailsNum number not null,
//	orderId varchar2(50) not null,
//	gdsNum number not null,
//	cartStock number not null,
	
	private int orderDetailsNum;
	private String orderId;
	private int gdsNum;
	private int cartStock;

}
