<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Register File</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>

	<h1>10. 파일업로드 Ajax 방식 요청 처리</h1>
	<hr>
	
	<p>Ajax 방식으로 전달한 파일 요소값을 스프링 MVC가 지원하는 MultipartFile 매개변수로 처리한다. </p>
	
	<div>
		<input type="file" id="inputFile"><br>
		<hr>
		<img id="preview"/>
	</div>
	
	
</body>
<script type="text/javascript">
$(function(){
	$("#inputFile").on("change", function(event){
		console.log("change event...!");
		
		var files = event.target.files;
		var file = files[0];
		
		console.log(file);

		if(isImageFile(file)){ //이미지 파일일 때
			//비동기 처리시, 파일데이터를 전송할 때에는 formData()를 이용하여 데이터를 전송한다.
			var formData = new FormData();
			formData.append("file", file);
			
			//formData는 key/value의 형식으로 데이터가 저장된다.
			//dataType : 응답(response) 데이터를 내보낼 때 보내줄 데이터 타입
			//processData : 데이터 파라미터를 data라는 속성으로 넣는데, 제이쿼리 내부적으로 쿼리스트링을 구성합니다.
			//				파일 전송의 경우 쿼리스트링을 사용하지 않으므로 해당 설정을 false로 비활성화한다.
			//contentType : Content-Type을 설정 시, 사용하는데 해당 설정의 기본값은 'application/x-www-form-urlencoded; charset=utf-8'입니다.
			//				하여, 기본값으로 나가지 않고 'multipart/form-daa'로 나갈 수 있도록 설정을 false합니다.
			//				request 요청에서 Content-Type을 확인해보면 'multipart/form-data; boundary====webkitFromBoundary[HashKey]'
			//				와 같은 값으로 전송된 것을 확인할 수 있습니다.
			
			
			$.ajax({
				type : "post",
				url : "/ajax/uploadAjax",
				data : formData,
				dataType : "text",
				processData : false,
				contentType : false,
				success : function(data) {
					alert(data);
					if(data === "UPLOAD SUCCESS"){
						var file = event.target.files[0]; //파일 선택 이벤트에서 선택된 파일을 file 변수에 저장
						var reader = new FileReader();
						reader.onload = function(e){
							$("#preview").attr("src", e.target.result); //이미지 파일 미리보기
						}
						reader.readAsDataURL(file); // 선택된 파일의 내용을 데이터 URL로 읽어오는 역할
					}
				}
				
			})	
		}else{ //이미지 파일이 아닐 때 
			alert("이미지를 넣으라구요 !!!!!! ");	
		}
	})
})

function isImageFile(file) {
	var ext = file.name.split(".").pop().toLowerCase(); //파일명에서 확장자를 가져온다.
	// 확장자 중 이미지에 해당하는 확장자가 아닌 경우 포함되어 있는 문자가 없으니까 -1(false)가 리턴
	// 확장자 중 이미지 확장자가 포함되어 있다면 0보다 큰 수 일테니 true가 리턴
	return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
}
</script>
</html>