package kr.icia.domain;

import lombok.Data;

@Data
public class InquiryAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private int ibno;
}
