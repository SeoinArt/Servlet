<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 
[0] post 방식일 때 한글 처리
[1] UserVO빈을 useBean 액션으로 생성 - page scope
[2] 사용자가 입력한 값 UserVO번에 setting - setProperty 액션 사용
[3] 유효성 체크
[5] UserDAO빈을 useBean 액션으로 생성 - session scope
[6] UserDAO빈 updateMember(vo) 호출
[7] 그 결과 메시지 처리 및 이동경로 처리 
--%>


<!-- [0][1][2]  -->
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.model.UserVO" scope ="page"/>
<jsp:setProperty name ="user" property="*" />

<%--
	* name = vo빈의 id 기술 
	* param : html의 input name을 기술
	* property : vo빈의 property명을 기술 
--%>
<!-- [3] -->

<%
	if(user.getName()==null||user.getUserid()==null || user.getHp1() == null || user.getHp2() == null || user.getHp3() == null){
		response.sendRedirect("../main.jsp");
		return;
	}
%> 


<jsp:useBean id = "userDao" class="user.model.UserDAO" scope = "session"/>


<% 
	int n = userDao.updateUser(user);
	response.sendRedirect("list.jsp");
%>



 