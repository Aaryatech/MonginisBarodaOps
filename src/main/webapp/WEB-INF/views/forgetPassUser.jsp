<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Monginis</title>
<link
	href="${pageContext.request.contextPath}/resources/css/monginis.css"
	rel="stylesheet" type="text/css" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/feviconicon.png"
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
<body style="background: url(resources/images/lgn_bg.jpg) no-repeat left top;">

	<!--wrapper-start-->
	<div class="wrapper">
	

		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2">
				<c:if test="${not empty message}">
					<!-- here would be a message with a result of processing -->
					<div class="messages">${message}</div><!-- messagesErr -->
				</c:if>


				<!-- <form id="form-login" action="loginProcess" method="post"> -->
				<div class="loginInner">
				
					<div class="login_l light_height"><a href="${pageContext.request.contextPath}/"><img
						src="${pageContext.request.contextPath}/resources/images/monginis1.png"
						alt="monginis"></a>
						<p class="login_txt">Delivering with Professional Excellence To be preferred Chartered Accountant, Advisor or Consultant to Business across India; and provide utility oriented legal compliance. </p>	
					</div>
						
					<div class="login_r frget_pass">
				
					<h2 class="login_head_one">
						Forgot Password
					</h2>
					<div class="loginBox">
						<%-- <div class="loginUser">
							<img
								src="${pageContext.request.contextPath}/resources/images/loginuser.png"
								align="img">
						</div> --%>
						<form action="getFranchiseeInfo" class="form-horizontal"
							id="validation-form" method="post">


							<div class="loginfildset">
								<input class="texboxlogin" placeholder="Franchisee Code" required
									name="username" type="text" data-rule-required="true">
							</div>

							<div class="loginfildset">
								<input name="" class="buttonlogin" value="Send OTP"
									type="submit">
							</div>
							<div class="loginfildset">
								<div class="logintexboxleft">
									<a href="${pageContext.request.contextPath}/"><!-- <i
										class="fa fa-lock"></i> --> Back To Login Page</a>
								</div>

							</div>
						</form>
					</div>

					<%-- <div class="loginBox">
		<div class="loginUser"><img src="${pageContext.request.contextPath}/resources/images/loginuser.png" align="img"></div>
		
		<h3> Forgot your Password</h3>
		
		<div class="loginfildset">
		<div class="loginfildset"><input class="texboxlogin" placeholder="Enter Password" name="" type="text"></div>
		<div class="loginfildset"><input name="" class="buttonlogin" value="SUBMIT" type="button"></div>
		</div>
	
	</div> --%>
	</div>	
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