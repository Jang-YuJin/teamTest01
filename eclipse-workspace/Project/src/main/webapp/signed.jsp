<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.Date"
	import="java.util.*"
	import="projectDTO.*"
	import="projectDAO.*"
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TDUNBAR</title>
<style>
body {
	margin: auto;
	width: 1200px;
	font-family: 'Times New Roman', Times, serif;
}

a {
	text-decoration-line: none;
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color: rgb(133, 106, 71);
}

#head .logoBox {
	display: flex;
	justify-content: space-around;
	align-items: center;
	text-align: center;
}

#head .homeSearch {
	background-color: black;
	color: white;
}

#head .logo {
	width: 400px;
	height: 110px;
}

#head .logoNav {
	width: 200px;
}

#head .mainNav {
	text-align: center;
	font-size: 25px;
	font-weight: bolder;
}

#signed {
	margin: auto;
	padding: 20px;
	width: 700px;
	height: 550px;
	text-align: center;
	font-weight: bolder;
	font-size: 150%;
}

#signed .sDiv {
	width: 600px;
	height: 300px;
	padding: 50px;
}

#signed .sMsg {
	display: flex;
	text-align: center;
	font-size: 85%;
	line-height: 30px;
	flex-direction: column
}

#footer {
	background-color: rgb(53, 53, 53);
	color: white;
	padding: 20px 80px;
	margin-top: 30px;
	line-height: 30px;
	display: flex;
	justify-content: space-between;
	align-items: center
}

#footer .fImg	{
	width: 40px;
	height: 40px;
}

#footer a	{
	color:white;

}
</style>
</head>
<body>
<%
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_pwCheck = request.getParameter("user_pwCheck");
		String user_name = request.getParameter("user_name");
		String user_tel = request.getParameter("user_tel");
		String user_address = request.getParameter("user_address");
		String user_birth = request.getParameter("user_birth");
		
		ProjectImpl impl = new ProjectImpl();
		String auth_id = impl.checkID(user_id);
		
		if(auth_id.equals("empty")){
			request.setAttribute("idAlert", "ID already taken");
			pageContext.forward("signup.jsp");
		} else if(user_id==null || user_id.length()==0){
			request.setAttribute("idAlert", "Enter ID");
			pageContext.forward("signup.jsp");
		} 
		else if(user_pw==null || user_pw.length()==0){
			request.setAttribute("pwAlert", "Enter Password");
			pageContext.forward("signup.jsp");
		}
		else if(user_name==null || user_name.length()==0){
			request.setAttribute("nameAlert", "Enter Name");
			pageContext.forward("signup.jsp");
		}
		else if(user_tel==null || user_tel.length()==0){
			request.setAttribute("telAlert", "Enter TEL");
			pageContext.forward("signup.jsp");
		} 
		else if(user_address==null || user_address.length()==0){
			request.setAttribute("addressAlert", "Enter Address");
			pageContext.forward("signup.jsp");
		} 
		else if(user_birth==null || user_birth.length()==0){
			request.setAttribute("birthAlert", "Enter Birth");
			pageContext.forward("signup.jsp");
		} 
		else if(!user_pw.equals(user_pwCheck)){
			pageContext.forward("signup.jsp");
			request.setAttribute("pwcheckAlert", "Enter Correct Password");
		} else	{	
			
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUser_id(user_id);
		memberDTO.setUser_pw(user_pw);
		memberDTO.setUser_name(user_name);
		memberDTO.setUser_tel(user_tel);
		memberDTO.setUser_address(user_address);
		memberDTO.setUser_birth(user_birth);
		
		impl.inputMember(memberDTO);
		
		}
%>
	<header id="head">
		<article class="logoBox">
			<div>
				<input type="text" placeholder="Search...">
				<input type="button" value="Search" class="homeSearch">
			</div>
			<a href="home.jsp"><img src="https://imgdb.in/jGKw.jpg" class="logo"></a>
			<nav class="logoNav">
				<a href="signup.jsp">LOGIN</a> | 
				<a href="signup.jsp">SIGN UP</a> | 
				<a href="signup.jsp">MYPAGE</a>
			</nav>
		</article>
		<nav class="mainNav">
			<hr>
			<a href="list.jsp?p_code=all">PRODUCTS</a> | 
			<a href="list.jsp?p_code=top">TOP</a> | 
			<a href="list.jsp?p_code=outer">OUTER</a> |
			<a href="list.jsp?p_code=bottom">BOTTOM</a> | 
			<a href="list.jsp?p_code=bag">BAGS</a> | 
			<a href="list.jsp?p_code=shoes">SHOES</a>
			<hr>
		</nav>
	</header>
	<section id="signed">
		<hr>
		<h1>WELCOME</h1>
		<hr>
		<div class="sDiv">
			<div class="sMsg">
				<h1>"회원가입 완료"</h1>
				<br> <%=user_id %> 님 환영합니다.
			</div>
		</div>
	</section>
	<footer id="footer">
		<div>
		LIFE STYLE SELECT SHOP / TDUNBAR.<br> EMIAL : TDUNBAR@GMAIL.COMX<br>
		CUSTOMER CENTER : 02-1515-55324<br> COPYRIGHT (C) TDUNBAR ALL
		RIGHTS RESERVED.
		</div>
		<div>
		<img src="https://cdn-icons-png.flaticon.com/512/1409/1409946.png" class="fImg">
		<img src="https://cdn-icons-png.flaticon.com/512/733/733547.png" class="fImg">
		<img src="https://cdn-icons-png.flaticon.com/512/1409/1409937.png" class="fImg">
		<img src="https://pngimg.com/uploads/youtube/youtube_PNG19.png" class="fImg">
		<br>
		<a href="home.jsp">REGISTER BRAND</a><br>
		www.tdunbar.comx
		</div>
	</footer>
</body>
</html>
</html>