package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVO {

	private int boNo;
	private String boTitle;
	private String boContent;
	private String boWriter;
	private String boDate;
	private int boHit;
	
	private Integer[] delNoticeNo; //여러개의 파일을 등록하고 수정하러 들어갈 때 기존에 업로드 되어있는 파일을 삭제할 파일번호를 저장할 변수
	private MultipartFile[] boFile;
	private List<NoticeFileVO> noticeFileList;
	
	public void setBoFile(MultipartFile[] boFile) {
		this.boFile = boFile;  //파일이 3개면 3개가 담김
		if(boFile != null) {
			List<NoticeFileVO> noticeFileList = new ArrayList<NoticeFileVO>();  //공간 마련
			for (MultipartFile item : boFile) { //파일 하나씩 가져옴
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				NoticeFileVO noticeFileVO = new NoticeFileVO(item); //자동으로 바인딩 되는 객체 
				noticeFileList.add(noticeFileVO); //파일이 쌓임
			}
			this.noticeFileList = noticeFileList;
		}
	}
}

