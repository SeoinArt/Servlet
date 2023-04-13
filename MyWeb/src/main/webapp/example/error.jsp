<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>

<!-- page 지시어에 isErrorPage = "true"를 주어야 한다. exception 내장 객체를 사용할 수 있다  -->
<jsp:include page="/top.jsp" />
<div class="error">
	<div class="error">
		<h1>Server Error</h1>
		<h2><%=exception.getMessage()%></h2>
		<br>
		<br> [<a style="color: navy" href="javaScript:history.back()">이전 페이지로
			돌아가기</a>]
		<button onclick="history.back()">이전 페이지로 돌아가기</button>
		<%
		exception.printStackTrace();
		%>
	</div>
</div>
<jsp:include page="/foot.jsp" />