
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>ATS</title>
<link
	href="${pageContext.request.contextPath}/resources/css/monginis.css"
	rel="stylesheet" type="text/css" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/atsfav.png"
	type="image/x-icon" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/common.js"></script>


<!--rightNav-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/menuzord.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery("#menuzord").menuzord({
			align : "left"
		});
	});
</script>



<!--rightNav-->


</head>
<body style=" background: url(resources/images/lgn_bg.jpg) no-repeat left top;">

	<div class="power_logo"><a href="https://aaryatechindia.in/" target="_blank">
		<img src="${pageContext.request.contextPath}/resources/images/powerd_logo.png"
						alt="monginis">
	</a> </div>


<%-- <div class="fix_btm">
	<img src="${pageContext.request.contextPath}/resources/images/login_table.png"
						alt="monginis">
</div> --%>
	
	<!--wrapper-start-->
	<div class="wrapper">

		


		<!--topHeader-->
		<%-- <div class="fullGrid center logoBarbg slideposi">
			<div class="wrapperIn positionR">
				<div class="logoBarLeft">
					<a href=""><img
						src="${pageContext.request.contextPath}/resources/images/monginis1.png"
						alt="monginis"></a>
				</div>
				<div class="logoBarRight">
					<div id="menuzord" class="menuzord red menuzord-responsive">
						<ul
							class="menuzord-menu menuzord-right menuzord-indented scrollable">
							 <li><a href="#"><div class="usericon">John doe</div> <div class="userimg"><img src="${pageContext.request.contextPath}/resources/images/userimg.jpg"></div> </a>
                	<ul class="dropdown">
                        <li><a href="#">My Account</a></li>
						<li><a href="#">Edit Profile</a></li>
						<li><a href="#">Setting</a></li>
						<li><a href="#">Log out</a></li>
					</ul>
                </li>
						</ul>
					</div>
				</div>
			</div>
		</div> --%>
		<!--topHeader-->

		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2">
			
				
			


				<!-- <form method="POST" action="uploadFile" enctype="multipart/form-data">
    File to upload: <input type="file" name="file" >
    <br />
    Name: <input type="text" name="name" >
    <br />
    <br />
    <input type="submit" value="Upload">
</form> -->
				
				<!-- <div class="a">
					<div class="login_new">
						<div class="login_l">dvdv</div>
						<div class="login_r">sbdsbsdf</div>
						<div class="clr"></div>
					</div>
				</div> -->


				<form id="form-login" action="loginProcess" method="post">
					<div class="loginInner">
					
						<div class="login_l"><a href=""><img
						src="${pageContext.request.contextPath}/resources/images/ats-logo.png"
						alt="monginis"></a>
						
						<p class="login_txt">
						Welcome to India’s one of most preferred bakery brand !
						<span>Lets make Monginis a part of everybody’s celebration!!</span> </p>
						
						</div>
						
						<div class="login_r">
					
					
						<h2 class="login_head_one">
							Account Login
						</h2>
						<div class="loginBox">
							<%-- <div class="loginUser">
								<img
									src="${pageContext.request.contextPath}/resources/images/loginuser.png"
									align="img">
							</div> --%>
							<form action="login" class="form-horizontal" id="validation-form"
								method="post">


								<div class="loginfildset">
									<input class="texboxlogin" placeholder="Username"    
										name="username" type="text" required> 
								</div>
								<div class="loginfildset">
									<input class="texboxlogin" placeholder="Password"  
										name="password" type="password" required>
								</div>



								<div class="loginfildset">
									<input name="" class="buttonlogin" value="LOGIN" type="submit">
								</div>
								<div class="loginfildset">
									<div class="logintexboxleft">
										<a href="${pageContext.request.contextPath}/forgetPwd"><i
											class="fa fa-lock"></i> Forgot Password</a>
									</div>
									<!-- <div class="checkbox">
										<input id="check1" type="checkbox" name="check" value="check1">
										<label for="check1">Remember me</label>
									</div> -->
									
									<br>
									 
										<c:if test="${not empty message && message!=''}">
											<!-- here would be a message with a result of processing -->
											<div class="messages" style="color: white;">${message}</div>
						
										</c:if>
										<%
											session.removeAttribute("message");										
										%>
								</div>
							</form>
						</div>
						</div>
						<%-- <div class="loginBox">
		<div class="loginUser"><img src="${pageContext.request.contextPath}/resources/images/loginuser.png" align="img"></div>
		
		<h3> Forgot your Password</h3>
		
		<div class="loginfildset">
		<div class="loginfildset"><input class="texboxlogin" placeholder="Enter Password" name="" type="text"></div>
		<div class="loginfildset"><input name="" class="buttonlogin" value="SUBMIT" type="button"></div>
		</div>
	
	</div> --%>
					<div class="clr"></div>
					</div>
				</form>
				<!-- <div class="messages messagesErr">err message</div>
        <div class="messages messagesInfo">info message</div>
        <div class="messages messagesSuccess">success message </div>
 -->
			</div>
			<!--fullGrid-->
		</div>
		<!--rightContainer-->

	</div>
	<!--wrapper-end-->

	<!--easyTabs-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!--easyTabs-->
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="resources/assets/jquery/jquery-2.0.3.min.js"><\/script>')
	</script>

	<script>
		$("#login").validate();
	</script>
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "100%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
		function openNav1() {
			document.getElementById("mySidenav1").style.width = "100%";
		}

		function closeNav1() {
			document.getElementById("mySidenav1").style.width = "0";
		}
		function openNav3() {
			document.getElementById("mySidenav3").style.width = "100%";
		}

		function closeNav3() {
			document.getElementById("mySidenav3").style.width = "0";
		}
	</script>


</body>
</html>