<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*"
	import="projectDTO.*"
	import="projectDAO.*"
%>
<!DOCTYPE html>
<html>
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

#info {
	display: flex;
	justify-content: space-evenly;
	margin-top: 50px;
}

.title {
	text-align: center;
	margin: auto;
	font-size: 25px;
}

#info .pic {
	width: 480px;
	height: 480px;
	border: solid 2px black;
}

#info .prdPic {
	width: 480px;
	height: 480px;
}

#info .data {
	border: 2px solid black;
	display: inline-block;
	padding-top: 100px;
	font-size: 35px;
	text-align: center;
	width: 480px;
	height: 380px;
	line-height: 80px;
	margin-bottom: 50px;
}

#info .fButton {
	background-color: black;
	color: white;
	font-size: 25px;
	width: 150px;
	height: 60px;
	margin: 10px 20px;
	cursor: pointer;
}

#detail .size {
	width: 100%;
	margin: 50px 0px;
}

#ReviewList {
	line-height: 20px;
	display: block;
}


#ReviewList .reviews {
	width: 1000px;
	border: solid 1px black;
	margin: 20px auto;
	align-items: center;
	padding: 20px;
}

#ReviewList .rDate {
	font-size: 15px;
	color: rgb(133, 106, 71);
}

#ReviewList .btnSet	{
	display:flex;
	justify-content: end;
}

#ReviewList .addbtn	{
	color: white;
	background-color: black;
	text-align: center;
	width: 150px;
	height: 50px;
	margin-right: 80px;
	font-size: 20px;
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
	String product_code = (String) request.getParameter("p_code");

	ProjectImpl prjImp = new ProjectImpl();
	
	int num = prjImp.reviewNum(product_code);
	
	ProductDTO productDTO = prjImp.extractProductInfo(product_code);
	
	String p_name = productDTO.getP_name();
	int p_price = productDTO.getP_price();
	String p_represent = productDTO.getP_representative();
	String p_detail = productDTO.getP_details();

	List<ReviewDTO> rList = prjImp.extractReview(product_code);
	
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
	<div class="title">
		<h1>PRODUCT INFORMATION</h1>
	</div>
	<hr>
	<section id="info">
		<div class="pic">
			<img src="<%= p_represent %>" class="prdPic">
		</div>
		<div class="data">
			<b><%= p_name %></b><br>
			<%= product_code%><br>
			<%= p_price%> ￦<br> 
			<input type="button" value="Buy" class="fButton"> 
			<input type="button" value="Cart" class="fButton">
		</div>
	</section>
	<hr>
	<div class="title">
		<h1>PRODUCT DETAIL</h1>
	</div>
	<hr>
	<section id="detail">
		<img src="<%= p_detail %>" class="size">
	</section>
	<hr>
	<div class="title">
		<h1>PRODUCT REVIEW</h1>
	</div>
	<hr>
	<section id="ReviewList">
	<% if(num==0) { %>
		<div class="reviews">
			<hr>
			<h1>NO REVIEWS POSTED YET</H1>
			<hr>
		</div>
	<% 
	}
	for( int i=0 ; i < rList.size() ; i++) {
		
		ReviewDTO rDTO = (ReviewDTO) rList.get(i);
		
		String review_id = rDTO.getReview_id();
		String id = rDTO.getId();
		String code = rDTO.getCode();
		String title = rDTO.getTitle();
		String content = rDTO.getContent();
		Date write_date = rDTO.getWrite_date();

		if(num!=0) {	%>
		<div class="reviews">
			<%= id%><br> <span class="rDate"><%= write_date%></span><br>
			<h3><%= title%></h3>
			<hr><%= content %><hr>
		</div>
	<% 	}
	 } %>
	 <div class="btnSet">
	 	<a href="insertReview.jsp?p_code=<%=product_code%>" class="addbtn"><input type="button" 
	 		value="Leave Review" class="addbtn"></a>
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