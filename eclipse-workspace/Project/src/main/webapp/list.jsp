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

#sort {
	display: flex;
	justify-content: end;
	margin-right : 20px;
}

#filter {
	float: left;
	display: flex;
	text-align: center;
	width: 200px;
	height: 944px;
	margin: 0px;
	border: solid 2px black;
}

#filter .fLeft {
	width: 180px;
	height: 920px;
	line-height: 24px;
	font-weight: bolder;
	margin: 10px 10px;
	border: solid 2px black;
}

#filter .fsub   {
    font-size: 80%;
    color:rgb(92, 92, 92);
    text-align: start;
    !important;
}

#items {	
	display: flex;
	justify-content: start;
	text-align: center;
	font-size: 200%;
	margin-left: 220px;
	flex-wrap: wrap;
	min-height: 1000px;
}

#items .iList {
	width: 270px;
	height: 320px;
	padding: 20px;
	border: solid 1px black;
	margin: 6px 6px;
	text-align: center;
	font-size: 60%;
	lign-height: 25px;
}

#items .iListImg {
	width: 200px;
	height: 200px;
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
<title>TDUNBAR</title>
</head>
<body>
<%
	String p_code = request.getParameter("p_code");
	ProjectImpl prjImp = new ProjectImpl();
	List<ProductDTO> list = prjImp.selectProducts(p_code);
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
	<section id="sort">
		<article>
	<% 
		String uriA = request.getRequestURL().toString();
		String uriD = request.getRequestURL().toString();
		
		if( request.getQueryString() != null)	{
		uriA = uriA + "?" + request.getQueryString();
		uriD = uriD + "?" + request.getQueryString();
		}
		if(uriA.contains("qasc") || uriA.contains("qdesc"))
		{
				String[] tokens = uriA.split("q");
				uriA = tokens[0];
		}
		if(uriD.contains("qasc") || uriD.contains("qdesc"))
		{
				String[] tokens = uriA.split("q");
				uriD = tokens[0];
		}
	%>	
			<a href="<%=uriA + "qasc" %>">Lowest Price</a> |
			<a href="<%=uriD + "qdesc" %>"> Highest Price</a>
		</article>
	</section>
	<section id="filter">
		<div class="fLeft">
			<a href="home.jsp"><h1>TDUNBAR</h1></a>
			<hr>
			<a href="list.jsp?p_code=top">- TOP -</a><br>
			        <div class="fsub">
                    <ul>
	                    <a href="list.jsp?p_code=top_ss">T-SHIRTS</a><br>
	                    <a href="list.jsp?p_code=top_ls">LONGSLEEVE</a><br>
	                    <a href="list.jsp?p_code=top_sh">SHIRTS</a><br>
	                    <a href="list.jsp?p_code=top_hd">HOOD</a><br>
	                    <a href="list.jsp?p_code=top_mm">MTM</a><br>
                    </ui>
                </div>
			<a href="list.jsp?p_code=outer">- OUTER -</a><br>
			        <div class="fsub">
                    <ul>
	                    <a href="list.jsp?p_code=outer_jk">JACKET</a><br>
	                    <a href="list.jsp?p_code=outer_ct">COAT</a><br>
	                    <a href="list.jsp?p_code=outer_pd">PADDING</a><br>
	                    <a href="list.jsp?p_code=outer_jp">LEATHER</a><br>
	                    
                    </ui>
                </div> 
			<a href="list.jsp?p_code=bottom">- BOTTOM -</a><br>
			    <div class="fsub">
                    <ul>
	                    <a href="list.jsp?p_code=bottom_dn">DENIM</a><br>
	                    <a href="list.jsp?p_code=bottom_sl">SLACKS</a><br>
	                    <a href="list.jsp?p_code=bottom_sk">SKIRTS</a><br>
	                    <a href="list.jsp?p_code=bottom_jg">JOGGER</a><br>
	                    <a href="list.jsp?p_code=bottom_sp">SHORTS</a><br>
                    </ui>
                </div>
			<a href="list.jsp?p_code=bag">- BAG -</a><br> 
			    <div class="fsub">
                    <ul>
	                    <a href="list.jsp?p_code=bag_bp">BACKPACK</a><br>
	                    <a href="list.jsp?p_code=bag_cb">CROSSBAG</a><br>
	                    <a href="list.jsp?p_code=bag_ec">ECOBAG</a><br>
	                    <a href="list.jsp?p_code=bag_sb">SLINGBAG</a><br>
	                    <a href="list.jsp?p_code=bag_td">TOTEBAG</a><br>
                    </ui>
                </div>
			<a href="list.jsp?p_code=shoes">- SHOES -</a><br>
			     <div class="fsub">
                    <ul>
	                    <a href="list.jsp?p_code=shoes_sn">SNEAKERS</a><br>
	                    <a href="list.jsp?p_code=shoes_lp">LOAFERS</a><br>
	                    <a href="list.jsp?p_code=shoes_bt">BOOTS</a><br>
	                    <a href="list.jsp?p_code=shoes_sd">SANDALS</a><br>
	                    <a href="list.jsp?p_code=shoes_hl">HIGHHEELS</a><br>
                    </ui>
                </div>
		</div>
	</section>
	<section id="items">
		<% for(int i=0 ; i <list.size() ; i++)	{
			ProductDTO pDTO = (ProductDTO) list.get(i);
			
			String product_code = pDTO.getP_code();
			String p_name = pDTO.getP_name();
			int p_price = pDTO.getP_price();
			String p_represent = pDTO.getP_representative();
		
			int review = prjImp.reviewNum(product_code);
		%>
			<div class="iList">
				<a href="product.jsp?p_code=<%= product_code %>"><img src="<%= p_represent%>" class="iListImg"><br> 
					<h3><%= p_name %></h3><hr> 
					<%= p_price %> ￦ <br>
					<%= review %> reviews<br>
				</a>
			</div>
		<% } %>
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