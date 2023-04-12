<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
int java = Integer.parseInt(request.getParameter("java"));

int db = Integer.parseInt(request.getParameter("db"));
int jsp = Integer.parseInt(request.getParameter("jsp"));

double avg = (java + db + jsp) / 3 + (java + db + jsp) % 3;
%>

<%
// 1. 입력값 받아오기
String num1 = request.getParameter("num");
String java1 = request.getParameter("java");
String db1 = request.getParameter("db");
String jsp1 = request.getParameter("jsp");

// 2. 유효성 체크
if (num1 == null || "".equals(num1.trim())) {
	response.sendRedirect("input.jsp");
	return;
}
if (java1 == null || java1.trim().isEmpty()) {
	java1 = "0";
}
if (db1 == null || db1.trim().isEmpty()) {
	java1 = "0";
}
if (jsp1 == null || jsp1.trim().isEmpty()) {
	java1 = "0";
}
%>


<div id="">
	<h1>성적 처리 결과</h1>
	<!-- table구성해서 처리 결과 보여주기 -->
	<form action="input.jsp">
		<table border="1">
			<tr>
				<th colspan="2">사번</th>
				<td><%=num%></td>
			</tr>

			<tr>
				<th rowspan="3">과목</th>
				<th>Java</th>
				<td><%=java%></td>

			</tr>

			<tr>
				<th>Database</th>
				<td><%=db%></td>

			</tr>

			<tr>
				<th>JSP</th>
				<td><%=jsp%></td>
			</tr>

			<tr>
				<th colspan="2">평균</th>
				<td><%=avg%></td>

			</tr>


			<tr>
				<!-- <td align="center" colspan="3"><input type="submit"
					value="입력화면"></td> -->
					
				<td align="center" colspan="3">
				<button onclick = "location.href = 'input.jsp'">입력 화면  </button>
					
				</td>
			<tr>
		</table>
	</form>
</div>