<%@page contentType="text/html; charset = utf-8" pageEncoding="UTF-8"%>
ex02.jsp

<%-- 
[1] for 루프 이용해서 Hello JSP를 출력하세요.

 --%>

<%
for (int i = 0; i < 5; i++) {
	out.println("<h2>Hello JSP</h2>");
}
%>
<hr color='red'>
<%
for (int i = 1; i < 6; i++) {
%>
<h2>
	Hi JSP
	<%=i%></h2>

<%
}
%>

<%-- [2] while루프를 이용해서 구구단 8단을 출력하세요 --%>
<hr color='blue'>

<table border = "1">
	<%
		int a = 1;
		int dan = 8;
		while (a < 10) {
	%>
	<h2><tr><td><%=dan%> x <%=a%> = <%=dan * a%></td></tr></h2>
	<%  a++; } %>
</table>

