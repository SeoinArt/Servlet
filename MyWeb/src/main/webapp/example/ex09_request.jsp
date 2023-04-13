<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>


<div class="container">
	<h1>request의 주요 메소드</h1>
	<%
		String server = request.getServerName(); // 서버 도메인명
		int port = request.getServerPort(); // 서버에서 열어둔 포트번호
		StringBuffer buf = request.getRequestURL(); // 전체 url 반환
		String url = buf.toString();
		// http://localhost/MyWeb/example/ex09_request.jsp
		
		String uri = request.getRequestURI();
		// url => 컨넥스트명 이후 경로를 반환
				
		String ctx = request.getContextPath(); // "/MyWeb"
		String qStr = request.getQueryString(); // query string을 반환
		String clientIp = request.getRemoteAddr(); // client ip 주소를 반환
				
		/// MyWeb/example/ex09_request.jsp
		String uri_1=uri.substring(ctx.length());
		String uri_2 = uri_1.replace(".jsp","");
		// [실습1] : uri 문자열에서 "/example/ex02_request.jsp" 문자열을 추출해서 출력하세요
		// [실습2] : uri 문자열에서 "/example/ex02_request" 문자열을 추출해서 출력하세요
		
		String path = request.getServletPath(); // "example/ex09_request.jsp"
		String proto = request.getProtocol();
		
		int index = path.lastIndexOf(".jsx"); // 검색 문자열을 뒤에서부터 찾아서 해당 인덱스 번호를 반환한다.
		System.out.println(index);
		
		if(index>0){
				/* path = path.substring(0,index); */
		}
		
		
		
	%>
	<h2>서버 도메인명 : <%=server %></h2>
	<h2>서버 포트번호 : <%=port %></h2>
	<h2>요청 URL : <%=url %></h2>
	<h2>요청 URI : <%=uri %></h2>
	<h2>요청 URI_1 : <%=uri_1 %></h2>
	<h2>요청 URI_2 : <%=uri_2 %></h2>
	<h2>컨텍스트명 : <%=ctx%></h2>
	<h2>쿼리 스트링 : <%=qStr %></h2>
	<h2>클라리언트 IP :<%=clientIp %> </h2>
	<h2>프로토콜 : <%=proto %></h2>
	<h2>서블릿 패스 : <%=path %></h2>
	
	
	
	
	
</div>


<jsp:include page="/foot.jsp"/>