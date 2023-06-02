package kr.or.ddit.vo;

import java.util.List;

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
//	private List<NoticeFileVO> noticeFileList;
	
}
