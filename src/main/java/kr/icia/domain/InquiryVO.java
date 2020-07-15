package kr.icia.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class InquiryVO {
	
	private int ibno;
	private String ititle;
	private String icontent;
	private String iwriter;
	private Date iregdate;
	private Date iupdateDate;
	private int ref;
	private int lev;
	
	private List<InquiryAttachVO> attachList;

}
