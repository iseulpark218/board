<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style type="text/css">
table {
	border: 1px solid black;
	border-collapse: collapse;
}

th, tr, td {
	border: 1px solid black;
	text-align: center;
}

.search {
	margin-top: 10px;
}

li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>
</head>
<body>
	<form role="form" method="get">
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
				<c:set var="number" value="${number-((curPage-1)*5)}" />
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
		<!-- 페이징+검색 조회 -->
		<div class="search">
			<select name="searchType">
				<option value="n"
					<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
				<option value="t"
					<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
				<option value="c"
					<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
				<option value="w"
					<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
			</select> <input type="text" name="keyword" id="keywordInput"
				value="${scri.keyword}" />
			<button id="searchBtn" type="submit">검색</button>
		</div>
		<!-- 페이징 조회 -->
		<div>
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a href="${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li><a href="${pageMaker.makeSearch(idx)}">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</form>
</body>
</html>
