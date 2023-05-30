<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h3>4. 표현언어(EL) 을 이용하여 출력</h3>
   <p>4) empty 연산자를 이용한 방법</p>
   <table border="1">
      <tr>
         <td>\${empty member }</td><!-- $를 문자로 인식하기 위해 $앞에 \붙여줌 -->
         <td>${empty member }</td>
      </tr>
      <tr>
         <td>\${empty member.userId }</td>
         <td>${empty member.userId }</td>
      </tr>
   </table>
</body>
</html>