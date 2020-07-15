package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsVO {
	private int gdsNum;
	private String cateCode;
	private String gdsName;
	private String gdsBrand;
	private int gdsPrice;
	private int gdsStock;
	private String gdsDes;
	private String gdsImg;
	private Date gdsDate;
	
	private String gdsThumbImg;
}
