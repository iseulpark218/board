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
td {
    display: table-cell;
    text-align: center;
}
</style>
</head>
<body>
	<p>총개수(임시):${number}</p>
	<table>
		<thead>
			<tr>
				<th>no</th>
				<th>title</th>
				<th>content</th>
				<th>writer</th>
				<th>regdate</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="number" value="${number}" />
			<c:forEach items="${list}" var="list">
				<tr>
					<th width="50">${number}</th>
					<td width="150">${list.title}</td>
					<td width="150">${list.content}</td>
					<td width="150">${list.writer}</td>
					<td width="200"><fmt:formatDate value="${list.regdate}"
							pattern="yyyy-MM-dd hh:mm:ss" /></td>
				</tr>
				<c:set var="number" value="${number-1}" />
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
