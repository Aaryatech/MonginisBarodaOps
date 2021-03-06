<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<style>
.fileUpload1 input.upload1 {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
	width: 100%;
	height: 33px;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 555; /* Sit on top */
	padding-top: 60px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 8px 20px 20px 20px;
	border: 1px solid #888;
	width: 30%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

#overlay2 {
	position: fixed;
	display: none;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(239, 219, 219, 0.5);
	z-index: 9992;
	cursor: pointer;
}

#text2 {
	position: absolute;
	top: 50%;
	left: 50%;
	font-size: 25px;
	color: white;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}

.itemDummyClass {
	cursor: pointer;
}

.def_customer {
	display: none;
}
</style>
<!--rightNav-->
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />



</head>
<body>
	
	<!--topLeft-nav-->
	<div class="sidebarOuter"></div>
	<!--topLeft-nav-->

	<!--wrapper-start-->
	<div class="wrapper">

		<!--topHeader-->
		

		<jsp:include page="/WEB-INF/views/include/logo.jsp"></jsp:include>
		<!--topHeader-->

		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2">

				<jsp:include page="/WEB-INF/views/include/left.jsp">
					<jsp:param name="myMenu" value="${menuList}" />

				</jsp:include>

				<!--rightSidebar-->
				<div class="sidebarright">

					<div class="title_row">
							<div class="order-left"  >
								<h2 class="pageTitle" style="margin: 0; ">
									<i class="fa fa-pencil" aria-hidden="true"></i> Change Employee Password
								</h2>
							</div>
							<%-- <c:if test="${not empty sessionScope.passMsg}"> --%>

									
									<br>
									
								<%-- </c:if> --%>
								<%-- <%
									session.removeAttribute("passMsg");
								%> --%>
							
						<%-- <h4 class="pageTitle" 
										style="text-align: center;padding : 10px; float: right;  color: #ff0000;">${sessionScope.passMsg}</h4> --%>					
						<div class="clr"></div>
					</div>
<c:url value="/matchPassword" var="matchPassword" ></c:url>
					
						<div class="textcen">
												
								<form name="updateprofile" id="updateprofile" method="post"
									action="${pageContext.request.contextPath}/updateFrEmpPassword"
									enctype="multipart/form-data">
									
									
									<input type="hidden" id="frEmpId" name="frEmpId" value="${sessionScope.frEmpId}">
									
									
									<div class="password_row">
										<div class="password_one">
											<div class="password_txt">Previous Password</div>
											<div class="a">
												<input class="texboxitemcode" placeholder="Previous Password" onchange="matchPassword()"
													name="oldPassword" id="oldPassword" type="password" required="required">
											</div>
											<div style="float: inline-end;" ><span id="passMatch" style="display: none; color: red; margin:3px 0 0 0; text-align: left;" >Old Password not Matched</span></div>
										</div>
										
										<div class="password_one">
											<div class="password_txt">New Password</div>
											<div class="a">
												<input class="texboxitemcode" placeholder="New Password"
													name="txtNewPassword" id="txtNewPassword" type="password" required="required">
											</div>
										</div>
										
										<div class="password_one">
											<div class="password_txt">Confirm Password</div>
											<div class="a">
												<input class="texboxitemcode" placeholder="Confirm Password" onblur="checkPasswordMatch()"
													name="txtConfirmPassword" id="txtConfirmPassword" type="password" required="required">
											</div>
											<div style="text-align: left; margin: 3px 0px 0px;"><span id="divCheckPasswordMatch"></span></div>
										</div>
										
										<!-- <div class="profile">											
											<div class="profileinput">
												<span id="divCheckPasswordMatch"></span>
											</div>
										</div> -->
										
									</div>
									
									<!-- <div class="profile">
											<div class="profilefildset">Previous Password</div>
											<div class="profileinput">
												<input class="texboxitemcode" placeholder="Previous Password" onchange="matchPassword()"
													name="oldPassword" id="oldPassword" type="password" required="required">
											</div>
											
										</div>
										<div style="float: inline-end;" ><span id="passMatch" style="display: none; color: red;" >Old Password not Matched</span></div> -->

										<!-- <div class="profile">
											<div class="profilefildset">New Password</div>
											<div class="profileinput">
												<input class="texboxitemcode" placeholder="New Password"
													name="txtNewPassword" id="txtNewPassword" type="password" required="required">
											</div>
										</div> -->

										
										
										<!-- <div class="profile">
											<div class="profilefildset">Confirm Password</div>
											<div class="profileinput">

												<input class="texboxitemcode" placeholder="Confirm Password" onblur="checkPasswordMatch()"
													name="txtConfirmPassword" id="txtConfirmPassword" type="password" required="required">

											</div>
										</div> -->
										
										<!-- <div class="profile">											
											<div class="profileinput">
												<span id="divCheckPasswordMatch"></span>
											</div>
										</div> -->
									

									<div >
										<div class="" style="text-align: center;">
											<input name="" class="btn additem_btn" value="Save"
												type="submit" id="btnupdate_profile">
										</div>
									</div>

								</form>

							
						
					</div>
					<!--latestNews-->
				</div>
				<!--rightSidebar-->

			</div>
			<!--fullGrid-->
		</div>
		<!--rightContainer-->

	</div>
	<!--wrapper-end-->


	<!-- MODAL----------------------------- --->

	
	<!-- -*********************------------- -->
	<!--Emp List popup-->
	
</body>
<script>
function matchPassword() {
	var oldPass=$('#oldPassword').val();
	var empId=$('#frEmpId').val();
	$.getJSON('${matchPassword}',

			{
				//fr_id_list : JSON.stringify(selectedFr),
				oldPass : oldPass,
				empId : empId,
				ajax : 'true'

			}, function(data) {
				//alert(data)
				if(data==0){
					//alert("Password Dosen't Match")
					document.getElementById("oldPassword").value="";
					
					 document.getElementById("passMatch").style.display = "block"; 
				}else{
					 document.getElementById("passMatch").style.display = "none"; 	
				}
				
			});
	
}
</script>

<script type="text/javascript">
	function checkPasswordMatch() {
		var password = $("#txtNewPassword").val();
		var confirmPassword = $("#txtConfirmPassword").val();

		if (password != confirmPassword) {
			document.getElementById("divCheckPasswordMatch").style.color = "#ff0000";
			$("#divCheckPasswordMatch").html("Passwords do not match!");
			document.getElementById("btnupdate_profile").disabled = true;
		} else {
			document.getElementById("divCheckPasswordMatch").style.color = "green";
			$("#divCheckPasswordMatch").html("Passwords match.");
			document.getElementById("btnupdate_profile").disabled = false;
		}
	}

	$(document).ready(function() {
		$("#txtConfirmPassword").keydown(checkPasswordMatch);
	});
</script>
</html>