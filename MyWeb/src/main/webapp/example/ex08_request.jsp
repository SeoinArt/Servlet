<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/top.jsp"/>
<div class style="padding:2em">
	<h1></h1>
	<br><br>
	<form name="frm" id="frm" action="ex08_requestResult.jsp" method="get">
		<!-- form name="frm" id="frm" action="join.jsp" method="post"> -->
		이름 : <input type="text" name="userName" placeholder="이름을 입력하세요">
		<br> 
		
		아이디 : <input type="text" name="userId"> 
		<br>
		
		비밀번호 : <input type="password" name="userPwd"> 
		<br> 
		
		사진 : <input type="file" name = "photo">
		<br>
		
		성별 : <input type="radio" name="gender" value="M">남자 
		     <input type="radio" name="gender" value="W" checked>여자 
		<br>
			
		<!-- 
            단일 선택 : radio 이때 동일한 name의 경우 그 중에 1개만 선택할 수 있다.
            다중 선택 : checkbox 
        -->
        
        
		<input type="checkbox" name="hobby" value="Sports" checked="checked">운동
		<input type="checkbox" name="hobby" value="Reading">독서 
		<input type="checkbox" name="hobby" value="Music">음악 감상 
		<input type="checkbox" name="hobby" value="Movie">영화 감상 
		<br>



		드롭다운 리스트 <select name="job">
			<option value="">::직업을 선택하세요::</option>
			<option value="Developer">개발자</option>
			<option value="Designer">디자이너</option>
			<option value="Teacher">교사</option>
		</select> 
		<br>
		<!-- 
            select : 기본은 단일 선택
            multiple 속성을 추가하면 다중 선택이 가능하다.
            size 속성을 주면 펼친 형태가 된다.
         -->
         
		<select name="lang" multiple size="7">
			<option value="">::사용 가능 언어::</option>
			<option value="HTML">HTML</option>
			<option value="Java">Java</option>
			<option value="SQL">SQL</option>
			<option value="JS">JS</option>
		</select> 
		<br> 
		
		자기소개 :
		<textarea name="intro" rows="5" cols="70"
			placeholder="자기소개를 100자 이내로 하세요"></textarea>
		<br> 
		
		히든 필드: <input type="hidden" name="secret" value="TopSecret">
		<br> 
		
		<input type="submit" value="회원가입"> 
		<input type="reset" value="다시 쓰기"> 
		<input type="button" value="일반 버튼" onclick="alert()">
		<!-- 
            submit 버튼 : 서버로 데이터를 전송하는 버튼 
            reset 버튼 : 초기화 기능
            button 버튼 : 아무 기능 없음 => JS와 함께 사용하여 기능을 부여
        -->
		<br>
		
		<!-- 이미지 버튼은? -->
		
		<a onclick="alert('잘가세요~')"><img src="/images/qr_login.png"></a>
		<br> 
		
		<input type="image" src="/images/login.png">



	</form>
</div>
<jsp:include page="/foot.jsp"/>