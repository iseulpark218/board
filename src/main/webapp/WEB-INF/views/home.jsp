<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>
</head>
<body>
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
					<td><fmt:formatDate value="${list.regdate}"
							pattern="yyyy-MM-dd hh:mm:ss" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<ul>
			<c:if test="${pageMaker.prev}">
				<li><a href="${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li><a href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>
