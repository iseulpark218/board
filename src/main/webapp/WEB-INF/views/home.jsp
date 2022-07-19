<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>

 	<table>
		<thead>
			<tr>
				<th>bno</th>
				<th>title</th>
				<th>content</th>
				<th>writer</th>
				<th>regdate</th>
			</tr>
		</thead>
 		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<th>${list.bno}</th>
					<td>${list.title}</td>
					<td>${list.content}</td>
					<td>${list.writer}</td>
					<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
