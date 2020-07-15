package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private Long nbno;
	private String ntitle;
	private String ncontent;
	private String nwriter;
	private Date nregdate;
	private Date nupdateDate; 

}
