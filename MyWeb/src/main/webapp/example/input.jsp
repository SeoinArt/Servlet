<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	function check() {
		if (mf.num.value == "") {
			alert('사번을 입력하세요');
			mf.num.focus();
			return false;
		}
		if (mf.java.value == "") {
			mf.java.value = 0;
		}
		if (mf.db.value == "") {
			mf.db.value = 0;
		}
		if (mf.jsp.value == "") {
			mf.jsp.value = 0;
		}
		mf.submit();
	}
</script>
<div id="wrap">
	<h1>성적 입력</h1>
	<form name="mf" action="result.jsp" method="GET">
		<!-- table구성 -->
		<table border="1">
			<tr>
				<th colspan="2">사번</th>
				<td><input type="text" name="num" /></td>
			</tr>
			<tr>
				<th rowspan="3">과목</th>
				<td>Java</td>
				<td><input type="text" name="java" /></td>
			</tr>
			<tr>
				<th>Database</th>
				<td><input type="text" name="db" /></td>
			</tr>
			<tr>
				<th>JSP</th>
				<td><input type="text" name="jsp" /></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<button onclick="check()">저장</button>
				</td>
			</tr>
		</table>
	</form>
</div>




