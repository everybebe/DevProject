package kr.or.ddit.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/ajax")
@Slf4j
public class AjaxMemberFileController {

//	@GetMapping(value="/registerFileForm")
//	@PostMapping("/registerFileForm")
	@RequestMapping(value="/registerFileForm", method=RequestMethod.GET)
	public String ajaxRegisterFileForm() {
		return "member/ajaxMemberFile";
	}
	
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces="text/plain; charset=utf-8") //produces 응답데이터 미디어 타입 설정 
	public ResponseEntity<String> uploadAjax(MultipartFile file) {
		String originalFileName = file.getOriginalFilename();   //file.getOriginalFilename()을 통해 업로드된 파일의 원본 파일 이름을 얻음
		log.info("uploadAjax() 실행..!!");
		log.info("originalFileName : " + originalFileName);
		return new ResponseEntity<String>("UPLOAD SUCCESS", HttpStatus.OK);
	}
}
