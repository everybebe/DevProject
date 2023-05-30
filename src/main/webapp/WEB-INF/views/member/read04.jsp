<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>READ04</title>
</head>
<body>
	<h3>READ04 Result</h3>
	
	<h5>hobbyArray</h5>
	<c:forEach items="${hobbyArray }" var ="hobby">
		<c:out value="${hobby }"></c:out>
	</c:forEach>
	
	<h5>hobbyList</h5>
	<c:forEach items="${hobbyArray }" var="hobby">
		<c:out value="${hobby }"></c:out>
	</c:forEach>
	
	<h5>carArray</h5>
	<c:forEach items="${carArray }" var="car">
		<c:out value="${car }"></c:out>
	</c:forEach>
	
	<h5>carList</h5>	
	<c:forEach items="${carList }" var="car">
		<c:out value="${car }"></c:out>
	</c:forEach>
</body>
</html>