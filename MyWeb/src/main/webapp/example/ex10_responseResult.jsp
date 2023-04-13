<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/top.jsp"/>
<% 
	request.setCharacterEncoding("utf-8");	
	// 아이디 , 비번 받기
	String uid = request.getParameter("userid");
	String upd = request.getParameter("pwd");
	// 유효성 체크

	if(uid == null || upd ==null){
		response.sendRedirect("ex10_response.jsp");
		return;
	}
	System.out.println("여기가 수행될까요?");
	
	if("".equals(uid.trim())||"".equals(upd.trim())){
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	if(uid.equalsIgnoreCase("killer")){
		response.sendError(response.SC_FORBIDDEN);
		return;
	}
%>


<div class="container">
	<h1 style ='color:blue'><%=uid %>님 환영합니다 </h1>
	<br><br>
	[<a href ="ex10_response.jsp">로그인 페이지로</a>]
</div>
<jsp:include page="/foot.jsp"/>