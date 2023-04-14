/**
 * 
 */

 function member_check(){
	 if(!isKor(mf.name)){
		 alert('이름은 한글로 2자 이상 가능해요');
		 mf.name.select();
		 return;
	 }
	 // 아이디는 영문자, 숫자, !,_을 포함해서 4~8자 이내
	 if(!isUserid(mf.userid)){
		 alert('아이디는 영문자, 숫자, _, !만 4~8자리 까지 가능합니다');
		 mf.userid.select();
		 return;
	 }
	 // 바밀번호는 문자, 숫자, !, .,_을 포함해서 4~8자 이내
	 if(!isPasswd(mf.pwd)){
		 alert('바밀번호는 문자, 숫자, !, .,_을 포함해서 4~8자 이내여야 해요');
		 mf.pwd.select();
		 return;
	 }
	 
	 if(mf.pwd.value != mf.pwd2.value){
		 alert('비밀번호와 비밀번호 확인값이 달라요');
		 mf.pwd2.select();
		 return;
	 }
	 //  앞자리(010|011)중 하나 - 숫자(3~4)자리 - 숫자 4자리 만 가능해요
	 if(!isMobile(mf.hp1,mf.hp2,mf.hp3)){
		 alert('앞자리(010|011)중 하나 - 숫자(3~4)자리 - 숫자 4자리 만 가능해요');
		 mf.hp1.select();
		 return;
	 }	 
	 
	 // 날짜 형식에 맞는지 체크하는 함수
 	 // 월 : 01 02 03 04 05.. 09 10 11 12
	 // 일 : 01~31
	 // 2023-01-31 or 2023/01.31
	 /*if(!isDate(mf.post)){
		 alert('날짜 형식에 맞지 않다요');
		 mf.post.select();
		 retrun;
	 }*/
	 
	 // 이메일 체크
	/* if(!isEmail(mf.addr1)){
		 alert('이메일 형식에 맞지 않아요');
		 mf.addr1.select();
		 return;
	 }*/
	 
	 mf.submit(); // 서버로 전송
 }// member.check()

/*
+ : 1개 이상 (one more)
* : 0 또는 여러개 (one or more)
? : 0 또는 1개 (one or zero)
*/



function isEmail(input){
	let val = input.value;	
	let pattern = /^[\w-]+(\.[\w]+)*@([a-zA-Z]+\.)+[a-z]{2,3}$/;
	let b = pattern.test(val);
	/*alert('email : '+b);*/
	return b;
	
}

function isDate(input){
	let val =input.val;
	let patten = /\d{4}[\/,-](0[1-9]|1[0-2])[\/,-](0[1-9]|[12][0-9]|3[0-1])/;
	let b =patten.test(val);
	/*alert('date : '+b);*/
	return b;
}// isDate() ------

// dlapdl





/*
\b : 단어의 경계를 나타내며, 해당 패턴이 정확하게 일치해야함을 의미
(010|011) : 010 또는 011만을 허락한다는 의미
\d{3,4} : 숫자가 3개이상 4개 이하 
\d{4}:숫자가 4개
*/ 

function isMobile(input1,input2,input3){
	let val = input1.value+"-"+input2.value+"-"+input3.value;
	let patten =/\b(010|011)[-][\d]{3,4}[-][\d]{4}\b/;
	let b = patten.test(val);
	/*alert('hp : '+b);*/
	return b;
}// isMobile()---




 
 
 /**
  * ^ : 시작을 의미
  * $ : 끝을 의미
  * 가-힣 : 한글을 의미
  * a-z : 알파벳 소문자
  * A-Z : 알파벳 대문자
  * 0-9 : 아라비아 숫자
  * _ : _
  * {4}: 4자리만 가능
  * {4,} : 4자리 이상만 가능
  * {4,7}: 4에서 7자리까지 가능
  * + : 패턴이 1개 이상 반복된다는 의미
  * {2,} : 패턴 문자가 2개 이상 와야한다는 의미
  */
 
 // 아이디는 영문자로 시작하고, 그다음에는 영문자, 숫자, _, !만 3~7자까지
 function isUserid(input){
	 let val = input.value;
	 let pattern =/^([A-Za-z])[A-Za-z0-9_!]{3,7}$/;
	 let b =pattern.test(val);
/*	 alert("id 여부 : "+b)*/
	 return b;
 }// isUserid()-----
 
 
 /*
 \w : 알파벳 대소문자, 숫자, _ 를 의미한다.
 \. : 마침표(.)를 의미한다.
 ! : !
 {4,8} : 4에서 8글자까지
 */
 
 // 바밀번호는 문자, 숫자, !, .,_을 포함해서 4~8자 이내
 function isPasswd(input){
	 let val = input.value;
	 let pattern = /^[\w!\.]{4,8}$/;
	 let b = pattern.test(val);
	 /*alert("pwd 여부 : "+b);*/
	 return b;
 } // isPasswd() --- 
 
 
 
 function isKor(input){
	 /*alert(input.value);*/
	 let val = input.value;
	 // 정규식 객체 : RegExp
	 //let pattern = new RegExp(/multi/g);
	 let pattern=/^[가-힣]{2,}$/;
	 let b = pattern.test(val);
	 // test()함수 : 정규식 패턴에 매개변수 문자열이 맞으면 true를 반환하고, 틀리면 false를 반환함
	 /*alert(b);*/
	 return b;
 }