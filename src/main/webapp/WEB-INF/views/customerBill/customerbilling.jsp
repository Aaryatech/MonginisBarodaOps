<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<title>Madhvi</title>


<link
	href="${pageContext.request.contextPath}/resources/css/monginis.css"
	rel="stylesheet" type="text/css" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/feviconicon.png"
	type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resources/css/custom.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon"
	href="${pageContext.request.contextPath}/images/feviconicon.png"
	type="image/x-icon" />


<!--autocomplete-->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/autocomplete.css">
<script
	src="${pageContext.request.contextPath}/resources/css/easy-responsive-tabs.css"></script>



<!--rightNav-->


<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery("#menuzord").menuzord({
			align : "left"
		});
	});
</script>


<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery.mCustomScrollbar.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css" />

<!-- 1 css and 2 js for search item   -->

<!----------------------------------------Dropdown With Search----------------------------------------------- -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/customerBill/chosen.css">
<!--------------------------------------------------------------------------------------- -->
<%-- <script src="${pageContext.request.contextPath}/resources/jquery.confirm/jquery.confirm.js"></script> --%>







<style>
.chosen-container {
	width: 100% !important;
}

/* Paste this css to your style sheet file or under head tag */
/* This only works with JavaScript, 
if it's not present, don't show loader */
.no-js #loader {
	display: none;
}

.js #loader {
	display: block;
	position: absolute;
	left: 100px;
	top: 0;
}

.se-pre-con {
	position: absolute;
	left: 20px;
	top: 230px;
	width: 96%;
	height: 53%;
	z-index: 9999;
	z-index: 9999;
	opacity: 1;
	background: url(resources/images/loader1.gif) center no-repeat #fff;
}

.checkdiv {
	position: absolute;
	left: 20px;
	top: 230px;
	width: 96%;
	height: 53%;
	z-index: 9999;
	z-index: 9999;
	opacity: 1;
	background: url(resources/images/check.gif) center no-repeat #fff;
}

body {
	font-family: sans-serif;
	height: 100%;
}

.option {
	padding-left: 5px;
}

.dialog-ovelay {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, 0.50);
	opacity: 1;
	z-index: 1000;
}

.dialog-ovelay .dialog {
	width: 25%;
	height: 25%;
	border-radius: 25px;
	margin: 320px auto 0;
	background-color: #fff;
	box-shadow: 0 0 20px rgba(0, 0, 0, .2);
	overflow: hidden
}

.dialog-ovelay .dialog header {
	padding: 10px 8px;
	border-radius: 25px 25px 0px 0px;
	background-color: #beccd8;
	border-bottom: 1px solid #e5e5e5
}

.dialog-ovelay .dialog header h3 {
	font-size: 15px;
	margin: 0;
	color: #000;
	display: inline-block
}

.dialog-ovelay .dialog header .fa-close:active {
	box-shadow: 0 0 5px #673AB7;
	color: #a2a2a2
}

.dialog-ovelay .dialog .dialog-msg {
	padding: 15px 10px
}

.dialog-ovelay .dialog .dialog-msg p {
	margin: 0;
	font-size: 15px;
	color: #333
}

.dialog-ovelay .dialog footer {
	border-top: 1px solid #e5e5e5;
	padding: 8px 8px
}

.dialog-ovelay .dialog footer .controls {
	margin: 8px;
	direction: rtl
}

.dialog-ovelay .dialog footer .controls .button {
	padding: 5px 15px;
	border-radius: 3px
}

.button {
	cursor: pointer
}

.button-default {
	background-color: rgb(248, 248, 248);
	border: 1px solid rgba(204, 204, 204, 0.5);
	color: #5D5D5D;
}

.button-danger {
	background-color: #f44336;
	border: 1px solid #d32f2f;
	color: #f5f5f5
}

.link {
	padding: 5px 10px;
	cursor: pointer
}

@media screen and (max-width:700px) {
	.dialog-ovelay .dialog {
		width: 90%;
		height: auto;
		border-radius: 10px;
	}
	.dialog-ovelay .dialog header {
		border-radius: 10px 10px 0 0;
	}
}

.sidebarright {
	width: 100%;
	float: left;
	padding-left: 170px;
	position: relative;
	padding-right: 30px;
	z-index: 1;
}
</style>
<style>
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

label:before {
	border: 0px solid #ccc;
}
</style>
</head>
<body>

	<style type="text/css">
.wrapperIn2 {
	padding-top: 0px;
}

.sidebarright {
	width: 100%;
	float: left;
	padding-left: 170px;
	position: relative;
	padding-right: 30px;
	z-index: 1;
}

.topSlide2 {
	padding: 20px 60px 20px 20px;
}

.sidebarhome li a {
	width: 80px;
	padding-top: 12px;
	padding-bottom: 12px;
	padding-left: 0px;
	padding-right: 0px;
}

.sidebarhome ul {
	width: 80px;
}

.sidebarhome {
	width: 80px;
}

.sidebarhome li {
	width: 80px;
	margin-top: 5px;
	margin-bottom: 5px;
	border: 1px;
}

.sidebarright {
	margin-left: 5px;
	padding-left: 10px;
	padding-right: 10px;
}

/* HORIZONTAL SCROLL - CATEGORY */
div.scrollmenu {
	background-color: #ffffff;
	overflow: auto;
	white-space: nowrap;
}

div.scrollmenu a {
	display: inline-block;
	color: black;
	text-align: center;
	padding: 9px;
	text-decoration: none;
}

div.scrollmenu a:hover {
	background-color: #FFE8FB;
}

/*  GRID VIEW - ITEM   */
.grid-container {
	display: grid;
	grid-template-columns: auto auto auto auto;
	/* grid-gap: 10px;
	padding: 10px; */
}

.grid-container>div {
	text-align: -webkit-center;
	/* padding: 20px 0;
	display: flex; */
}

div.scrollmenu1 {
	background-color: #ffffff;
	white-space: nowrap;
}

div.scrollmenu1 a {
	display: inline-block;
	color: black;
	text-align: center;
	/* padding: 14px; */
	text-decoration: none;
}

div.scrollmenu1 a:hover {
	background-color: #FFE8FB;
}

/* ----RADIO-------------- */
.container {
	display: block;
	position: relative;
	margin-bottom: 12px;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Hide the browser's default radio button */
.container input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 15px;
	width: 15px;
	background-color: #eee;
	border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
	background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
	background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
	display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
	top: 4px;
	left: 4px;
	width: 6px;
	height: 6px;
	border-radius: 50%;
	background: white;
}

.btn {
	background-color: DodgerBlue;
	border: none;
	color: white;
	cursor: pointer;
}

/* Darker background on mouse-over */
.btn:hover {
	background-color: RoyalBlue;
}

/* TABLE */
table.responsive-table {
	margin: 0 0;
}

.responsive-table td {
	text-align: left;
	padding: 5px;
	font-size: inherit;
}

/* ----------POPOUP-------------- */
/* Button used to open the contact form - fixed at the bottom of the page */

/* The popup form - hidden by default */
/* .form-popup {
	display: none;
	position: inherit;
	bottom: 0;
	right: 15px;
	border: 3px solid #f1f1f1;
	z-index: 9;
} */
.form-popup {
	display: none;
	position: fixed;
	z-index: 9;
	margin-top: 50px;
	margin-left: 200px;
	margin-right: 200px;
	margin-bottom: 200px;
	left: 0;
	right: 0;
	bottom: 0;
}

/* Add styles to the form container */
.form-container {
	max-width: 8000px;
	padding: 10px;
	background-color: lightpink;
}

.form-popup-qty {
	display: none;
	position: fixed;
	bottom: 0;
	z-index: 9;
	top: 0;
	right: 0;
	margin: 200px;
}

.form-container-qty {
	padding: 10px;
	background-color: lightpink;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
	opacity: 1;
}

/* ---SUBMIT BUTTON------  */
.loginfildset {
	width: 100%;
	float: left;
}

.table-wrap-custbill {
	margin-bottom: 10px;
}

.cd-tabs-navigation a {
	padding: 3px 3px;
}

.cd-tabs-content li {
	padding: 5px 5px 5px 5px;
}

.cd-tabs-navigation a.selected {
	background-color: #343690 !important;
	font-weight: bold;
	color: #ce5353;
	border-top: 1px solid #73bd00;
	border-right: 1px solid #73bd00;
	border-left: 1px solid #73bd00;
	border-bottom: 1px solid #73bd00;
	/* background: #eeeeee; */
	background: -moz-linear-gradient(top, #eeeeee 0%, #f6f6f6 38%, #ffffff 100%);
	/* background: -webkit-linear-gradient(top, #eeeeee 0%,#f6f6f6 38%,#ffffff 100%); */
	background: linear-gradient(to bottom, #73bd00 0%, #73bd00 38%, #73bd00 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#eeeeee',
		endColorstr='#73bd00', GradientType=0);
	color: white;
}

.cd-tabs-navigation a {
	position: relative;
	display: block;
	text-align: center;
	font-size: 18px;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	color: #c51b1b;
	border: 1px solid #ccc;
	margin-right: 5px;
	margin-top: 5px;
	margin-bottom: 5px;
	margin-left: 1px;
}

.modal-backdrop {
	z-index: 0 !important;
}

.cd-tabs-content {
	border: 0 !important
}
</style>



	<c:url var="saveCustomerFromBill" value="/saveCustomerFromBill" />
	<c:url var="editCustomerFromBill" value="/editCustomerFromBill" />
	<c:url var="submitEditCustomer" value="/submitEditCustomer" />

	<div class="wrapper">



		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2">


				<!--rightSidebar-->

				<!------------ Place Actual content of page inside this div ----------->
				<div class="sidebarright" id="sidebarright">

					<div class="row">



						<div class="col-sm-6"
							style="padding-left: 1px; padding-right: 2px;">

							<div class="cd-tabs" style="display: flex; margin-top: 2px;">
								<nav style="display: table;">
									<ul class="cd-tabs-navigation" style="display: grid;">

										<li><a onclick="refreshPage()" href="#"><i
												class="fa fa-home"></i></a></li>

										<li id="li1"><a data-content="c1" class="selected"
											href="#0" onclick="onloadTab(1)">C1</a></li>
										<li id="li2"><a data-content="c1" href="#0"
											onclick="onloadTab(2)">C2</a></li>
										<li id="li3"><a data-content="c1" href="#0"
											onclick="onloadTab(3)">C3</a></li>
										<li id="li4"><a data-content="c1" href="#0"
											onclick="onloadTab(4)">C4</a></li>
										<li id="li5"><a data-content="c1" href="#0"
											onclick="onloadTab(5)">C5</a></li>
										<li id="li6"><a data-content="c1" href="#0"
											onclick="onloadTab(6)">C6</a></li>
										<li id="li7"><a data-content="c1" href="#0"
											onclick="onloadTab(7)">C7</a></li>
										<li id="li8"><a data-content="c1" href="#0"
											onclick="onloadTab(8)">C8</a></li>
									</ul>

								</nav>

								<ul class="cd-tabs-content" style="width: 95%;">

									<li data-content="c1" class="selected" onshow="onloadTab(1)">

										<!-- TAB1  -->

										<div class="row" style="margin-top: 5px;">

											<div class="col-md-4" style="text-align: center;">
												<button style="background: #FFFFC4; border: 0px;"
													data-toggle="modal" data-target="#myModalPendingAmt">
													Pending Amt : &nbsp; <span style="font-weight: bold;">550.00000</span>
												</button>
											</div>

											<div class="col-md-4" style="text-align: center;">
												<button style="background: #DAF5FF; border: 0px;"
													data-toggle="modal" data-target="#myModalAdvAmt">
													Advance Amt : &nbsp; <span style="font-weight: bold;">550.00000</span>
												</button>
											</div>

											<div class="col-md-4" style="text-align: center;">
												<button style="background: #DBFFD2; border: 0px;"
													data-toggle="modal" data-target="#myModalTotalAmt">
													Total Amt : &nbsp; <span style="font-weight: bold;">550.00000</span>
												</button>
											</div>

										</div>

										<div class="row" style="margin-top: 10px;">
											<div class="col-md-2">
												<div class="col1title">Customer</div>
											</div>
											<div class="col-md-8"
												style="text-align: left; padding-right: 1px;">
												<!-- class="chosen-select"  -->
												<select name="cust" id="cust"
													data-placeholder="Select Customer" class="chosen-select"
													style="text-align: left;" required>
													<option value="0" style="text-align: left;">Select
														Customer</option>
													<c:forEach items="${customerList}" var="customerList">
														<option value="${customerList.custId}"
															style="text-align: left;">${customerList.custName}
															&nbsp;${customerList.phoneNumber}</option>
													</c:forEach>
												</select>

											</div>

											<div class="col-md-2"
												style="text-align: left; padding-left: 1px;">
												<button class="btn" data-toggle="modal"
													data-target="#myModalAdd">
													<i class="fa fa-plus"></i>
												</button>
												<!-- <button class="btn" data-toggle="modal"
													data-target="#myModalEdit">
													<i class="fa fa-edit"></i>
												</button> -->
												<button class="btn" onclick="editCustomer()">
													<i class="fa fa-edit"></i>
												</button>
											</div>


										</div>
										<div class="row">
											<div class="col-md-2">
												<div class="col1title">Item</div>
											</div>
											<div class="col-md-8"
												style="text-align: left; padding-right: 1px;">

												<input list="items" id="itemName" name="itemName"
													class="form-control chosen" autocomplete="off"
													placeholder="Item Name" onchange="onSelectItem()"
													style="border-radius: 5px; padding: 2px 1px 0px 8px; height: 26px; text-align: left; background: linear-gradient(#fff 20%, #f6f6f6 50%, #eee 52%, #f4f4f4 100%); color: #444;"
													type="text">
												<datalist id="items">
													<option value='101' data-value='Cakes' data-id='101'>Cakes</option>
													<option value='102' data-value='Chocolates' data-id='101'>Chocolates</option>
													<option value='103' data-value='Ice Cream' data-id='101'>Ice
														Cream</option>
													<option value='104' data-value='Samosa' data-id='101'>Samosa</option>
													<option value='105' data-value='Sandwich' data-id='101'>Sandwich</option>
												</datalist>



												<!-- <select name="cust" id="cust"
													data-placeholder="Select Customer" class="chosen-select"
													style="text-align: left;" tabindex="6" required>

													<option value="-1" style="text-align: left;">Cake</option>
													<option value="-1" style="text-align: left;">Chocolates</option>


												</select> -->


											</div>

											<div class="col-md-2"
												style="text-align: left; padding-left: 1px;">
												<button class="btn">
													<i class="fa fa-plus"></i>
												</button>
											</div>



										</div>


										<div id="table-scroll">
											<!-- class="table-scroll" -->
											<div id="faux-table" aria="hidden"></div>
											<!-- class="faux-table"  -->
											<div class="table-wrap table-wrap-custbill">
												<table id="table_grid1" class="responsive-table">
													<!--  class="main-table small-td"> -->
													<thead>
														<tr class="bgpink">
															<th class="col-md-1">Sno.</th>
															<th>Item</th>
															<th>Price</th>
															<th>Qty</th>
															<th>UOM</th>
															<th>Total</th>
															<th class="col-md-1" style="width: 12px;"><i
																class="fa fa-trash"></i></th>
														</tr>
													</thead>
													<tbody>


														<tr>
															<td>1</td>
															<td data-toggle="modal" data-target="#myModalItemDesc">Cakes</td>
															<td>350</td>
															<td class="col-md-1"><input type="text" value="1"
																style="width: 50px;"></td>
															<td>kg</td>
															<td>350</td>
															<td><a href="#" title="Delete"><i
																	class="fa fa-trash"></i></a></td>

														</tr>

														<tr>
															<td>2</td>
															<td data-toggle="modal" data-target="#myModalItemDesc">Chocolates</td>
															<td>200</td>
															<td class="col-md-1"><input type="text" value="1"
																style="width: 50px;"></td>
															<td>kg</td>
															<td>200</td>
															<td><a href="#" title="Delete"><i
																	class="fa fa-trash"></i></a></td>

														</tr>

														<tr>
															<td>2</td>
															<td data-toggle="modal" data-target="#myModalItemDesc">Chocolates</td>
															<td>200</td>
															<td class="col-md-1"><input type="text" value="1"
																style="width: 50px;"></td>
															<td>kg</td>
															<td>200</td>
															<td><a href="#" title="Delete"><i
																	class="fa fa-trash"></i></a></td>

														</tr>

														<tr>
															<td>2</td>
															<td data-toggle="modal" data-target="#myModalItemDesc">Chocolates</td>
															<td>200</td>
															<td class="col-md-1"><input type="text" value="1"
																style="width: 50px;"></td>
															<td>kg</td>
															<td>200</td>
															<td><a href="#" title="Delete"><i
																	class="fa fa-trash"></i></a></td>

														</tr>

														<tr>
															<td>2</td>
															<td data-toggle="modal" data-target="#myModalItemDesc">Chocolates</td>
															<td>200</td>
															<td class="col-md-1"><input type="text" value="1"
																style="width: 50px;"></td>
															<td>kg</td>
															<td>200</td>
															<td><a href="#" title="Delete"><i
																	class="fa fa-trash"></i></a></td>

														</tr>

														<tr>
															<td>2</td>
															<td data-toggle="modal" data-target="#myModalItemDesc">Chocolates</td>
															<td>200</td>
															<td class="col-md-1"><input type="text" value="1"
																style="width: 50px;"></td>
															<td>kg</td>
															<td>200</td>
															<td><a href="#" title="Delete"><i
																	class="fa fa-trash"></i></a></td>

														</tr>

														<tr>
															<td>2</td>
															<td data-toggle="modal" data-target="#myModalItemDesc">Chocolates</td>
															<td>200</td>
															<td class="col-md-1"><input type="text" value="1"
																style="width: 50px;"></td>
															<td>kg</td>
															<td>200</td>
															<td><a href="#" title="Delete"><i
																	class="fa fa-trash"></i></a></td>

														</tr>

														<tr>
															<td>2</td>
															<td data-toggle="modal" data-target="#myModalItemDesc">Chocolates</td>
															<td>200</td>
															<td class="col-md-1"><input type="text" value="1"
																style="width: 50px;"></td>
															<td>kg</td>
															<td>200</td>
															<td><a href="#" title="Delete"><i
																	class="fa fa-trash"></i></a></td>

														</tr>

														<tr>
															<td>2</td>
															<td data-toggle="modal" data-target="#myModalItemDesc">Chocolates</td>
															<td>200</td>
															<td class="col-md-1"><input type="text" value="1"
																style="width: 50px;"></td>
															<td>kg</td>
															<td>200</td>
															<td><a href="#" title="Delete"><i
																	class="fa fa-trash"></i></a></td>

														</tr>



													</tbody>

												</table>
											</div>
										</div>

										<div class="row" style="margin-right: 2px;">

											<div class="col-md-2" style="text-align: left;">
												Items : &nbsp; <label>2</label>
											</div>
											<div class="col-md-3" style="text-align: left;">
												Total : &nbsp; <label>550.00</label>
											</div>

											<div class="col-md-4"
												style="text-align: left; display: flex;">
												Discount&nbsp;<input type="text" value="0"
													style="width: 40px;">&nbsp;<i
													class="fa fa-info-circle"
													style="font-size: x-large; color: #ec268f;"></i>
											</div>

											<div class="col-md-3"
												style="text-align: center; display: flex; background-color: #ec268f; color: white; font-size: medium;">
												PAY :&nbsp; 5550.00</div>

										</div>

										<div class="row"
											style="margin: 2px; padding-top: 5px; border: solid; border-width: 0.2px; padding: 3px;">

											<div class="row" style="text-align: left; margin-left: 2px;">

												<div class="col-md-4">Mode of Pay : &nbsp;</div>
												<div class="col-md-2">
													<label class="container" style="font-weight: normal;">Single
														<input type="radio" checked="checked" name="radio1"
														id="single1" value="1" onclick="paymentMode(this.value)">
														<span class="checkmark"></span>
													</label>
												</div>
												<div class="col-md-2">
													<label class="container" style="font-weight: normal;">Split
														<input type="radio" name="radio1" id="split1" value="2"
														onclick="paymentMode(this.value)"> <span
														class="checkmark"></span>
													</label>
												</div>
												<div class="col-md-2">
													<input type="text" id="tabId" value="1">
												</div>

											</div>

											<div class="row" style="margin: 2px;" id="singleDiv">


												<div class="col-md-4"
													style="text-align: left; display: flex;">
													Type&nbsp;&nbsp; <select name="payType" id="payType"
														onchange="dropdownChange()" data-placeholder="Select Type"
														class="chosen-select" style="text-align: left;"
														tabindex="6" required>

														<option value="1" style="text-align: left;">Cash</option>
														<option value="2" style="text-align: left;">Card</option>
														<option value="3" style="text-align: left;">ePay</option>

													</select>
												</div>

												<div class="col-md-4"
													style="text-align: left; display: none;" id="epayDiv">
													<div style="display: flex;">
														ePay&nbsp;&nbsp; <select name="paymentMode"
															id="paymentMode" data-placeholder="Select ePay Mode"
															class="chosen-select" style="text-align: left;"
															tabindex="6" required>

															<option value="1" style="text-align: left;">Google
																Pay</option>
															<option value="2" style="text-align: left;">Paytm</option>
															<option value="3" style="text-align: left;">Phonepay</option>

														</select>
													</div>
												</div>


												<div class="col-md-2"
													style="text-align: right; display: flex;">
													Amount&nbsp;&nbsp;<input type="text" style="width: 50px;">
												</div>

											</div>

											<div class="row" style="margin: 2px; display: none;"
												id="splitDiv">

												<div class="col-md-3"
													style="text-align: left; display: flex;">
													<input type="checkbox">Cash&nbsp;<input type="text"
														style="width: 50px;">
												</div>

												<div class="col-md-4"
													style="text-align: left; display: flex;">
													<input type="checkbox">Card&nbsp;<input type="text"
														style="width: 50px;">
												</div>

												<div class="col-md-5"
													style="text-align: right; display: flex;">
													<input type="checkbox">ePay&nbsp; <select
														name="onlineType" id="onlineType"
														data-placeholder="Select ePay Mode" class="chosen-select"
														style="text-align: left; width: 50px;" required>

														<option value="1" style="text-align: left;">Google
															Pay</option>
														<option value="2" style="text-align: left;">Paytm</option>
														<option value="3" style="text-align: left;">Phonepay</option>

													</select><input type="text" style="width: 50px;">
												</div>

											</div>


										</div>

										<div class="row"
											style="border: inherit; margin: 2px; padding-top: 5px;">

											<div class="row" style="text-align: left; margin-left: 2px;">

												<div class="col-md-4">Credit Bill : &nbsp;</div>
												<div class="col-md-2">
													<label class="container" style="font-weight: normal;">Yes
														<input type="radio" name="radio"> <span
														class="checkmark"></span>
													</label>
												</div>
												<div class="col-md-2">
													<label class="container" style="font-weight: normal;">No
														<input type="radio" checked="checked" name="radio">
														<span class="checkmark"></span>
													</label>
												</div>
												<div class="col-md-2"></div>

											</div>

										</div>

										<div class="loginfildset">
											<input name="" class="buttonlogin" value="SUBMIT"
												type="submit">
										</div> <!-- TAB1  -->



									</li>




								</ul>

							</div>
						</div>



						<!-- ################################# ITEM #################################################### -->



						<div class="col-sm-6">

							<div class="row">
								<div class="col-sm-4">
									<h2 class="pageTitle">Item Search</h2>
								</div>

								<div class="col-sm-8" style="display: flex; margin-top: 15px;">
									<label class="container" style="font-weight: normal;">Category
										<input type="radio" checked="checked" name="radio" value=1
										id="radioCat" onclick="itemSearchRadio(this.value)"> <span
										class="checkmark"></span>
									</label> <label class="container" style="font-weight: normal;">Sub
										Category <input type="radio" name="radio" value=2
										id="radioSubCat" onclick="itemSearchRadio(this.value)">
										<span class="checkmark"></span>
									</label> <label class="container" style="font-weight: normal;">All
										Items <input type="radio" name="radio" value=3
										id="radioAllItem" onclick="itemSearchRadio(this.value)">
										<span class="checkmark"></span>
									</label>
								</div>


							</div>






							<div class="scrollmenu" style="border: solid 1px;" id="catDiv">

								<c:forEach var="i" begin="1" end="10">

									<a style="border: 1px; text-align: -webkit-center;" href="#"
										onClick="openNav()">
										<div class="img" style="width: 50px; height: 50px;">
											<img
												src="${pageContext.request.contextPath}/resources/images/mongi.png"
												alt="img">
										</div>
										<div class="title">
											Order <span>Booking</span>
										</div>
									</a>

								</c:forEach>

							</div>



							<div class="grid-container" id="itemDiv"
								style="overflow: scroll; height: 450px; width: 100%; border: solid 1px;">


								<c:forEach var="i" begin="1" end="40">

									<div class="scrollmenu1">
										<a style="border: 1px; text-align: -webkit-center;" href="#"
											onClick="openFormQty()">
											<div class="img" style="width: 50px; height: 50px;">
												<img
													src="${pageContext.request.contextPath}/resources/images/mongi.png"
													alt="img">
											</div>
											<div class="title">
												Order <span>Booking</span>
											</div>
										</a>
									</div>

								</c:forEach>


							</div>





						</div>
					</div>





				</div>
				<!--rightSidebar-->


			</div>
			<!--fullGrid-->
		</div>
		<!--rightContainer-->

	</div>
	<!--wrapper-end-->


	<!-- Modal -->
	<div class="modal fade" id="myModalAdd" role="dialog"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add Customer</h4>
				</div>
				<div class="modal-body">


					<div class="row">
						<div class="col-md-4" style="text-align: right;">Customer
							Name : &nbsp;</div>
						<div class="col-md-6">
							<input type="text" style="width: 100%;" class="form-control"
								placeholder="Enter Customer Name" name="customerName"
								onchange="trim(this)" id="customerName">
						</div>
						<div class="col-md-2"></div>
					</div>

					<div class="row">

						<div class="col-md-4" style="text-align: right;">Mobile
							Number :&nbsp;</div>
						<div class="col-md-6">
							<input type="text" style="width: 100%;" class="form-control"
								placeholder="Enter Mobile Number" name="mobileNo" id="mobileNo"
								onchange="trim(this)" maxlength="10">
						</div>
						<div class="col-md-2"></div>
					</div>

					<div class="row">

						<div class="col-md-4" style="text-align: right;">DOB :&nbsp;</div>
						<div class="col-md-6">
							<input id="dateOfBirth" class="form-control " autocomplete="off"
								placeholder="Date Of Birth" name="dateOfBirth" type="date">
							<!-- datepicker -->
						</div>
						<div class="col-md-2"></div>
					</div>

					<div class="row">

						<div class="col-md-4" style="text-align: right;">Business
							:&nbsp;</div>
						<div class="col-md-6" style="margin-top: 10px; display: flex;">

							<label class="container"
								style="font-weight: normal; padding-left: 1px;">Yes <input
								type="radio" name="isBuissness" id="buisnessyes"
								onclick="isBuissness(1)"> <span class="checkmark"></span>
							</label> <label class="container"
								style="font-weight: normal; padding-left: 1px;">No <input
								type="radio" checked="checked" name="isBuissness"
								id="buisnessno" onclick="isBuissness(0)"> <span
								class="checkmark"></span>
							</label>

						</div>
						<div class="col-md-2"></div>
					</div>
					<div style="display: none;" id="isbuissnessdiv">
						<div class="row">

							<div class="col-md-4" style="text-align: right;">Company
								Name :&nbsp;</div>
							<div class="col-md-6">
								<input type="text" style="width: 100%;" class="form-control"
									placeholder="Enter Company Name" name="companyName"
									onchange="trim(this)" id="companyName">
							</div>
							<div class="col-md-2"></div>
						</div>

						<div class="row">

							<div class="col-md-4" style="text-align: right;">GST Number
								:&nbsp;</div>
							<div class="col-md-6">
								<input type="text" style="width: 100%;" class="form-control"
									placeholder="Enter GST Name" name="gstNo" id="gstNo"
									onchange="trim(this)">
							</div>
							<div class="col-md-2"></div>
						</div>

						<div class="row">

							<div class="col-md-4" style="text-align: right;">Address
								:&nbsp;</div>
							<div class="col-md-6">
								<input type="text" style="width: 100%;" class="form-control"
									placeholder="Enter Address" name="custAdd" id="custAdd"
									onchange="trim(this)">
							</div>
							<div class="col-md-2"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						onclick="addCustomer()">Save</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


	<!-- EDIT MODAL -->
	<div class="modal fade" id="myModalEdit" role="dialog"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edit Customer</h4>
				</div>
				<div class="modal-body">


					<div class="row">
						<div class="col-md-4" style="text-align: right;">Customer
							Name : &nbsp;</div>
						<div class="col-md-6">
							<input type="text" style="width: 100%;" class="form-control"
								placeholder="Enter Customer Name" name="customerNameEdit"
								id="customerNameEdit" onchange="trim(this)">
						</div>
						<div class="col-md-2"></div>
					</div>

					<div class="row">

						<div class="col-md-4" style="text-align: right;">Mobile
							Number :&nbsp;</div>
						<div class="col-md-6">
							<input type="text" style="width: 100%;" class="form-control"
								placeholder="Enter Mobile Number" name="mobileNoEdit"
								id="mobileNoEdit" onchange="trim(this)">
						</div>
						<div class="col-md-2"></div>
					</div>

					<div class="row">

						<div class="col-md-4" style="text-align: right;">DOB :&nbsp;</div>
						<div class="col-md-6">
							<input class="form-control" autocomplete="off"
								placeholder="Delivery Date" name="dobEdit" id="dobEdit"
								type="date">
						</div>
						<div class="col-md-2"></div>
					</div>

					<div class="row">

						<div class="col-md-4" style="text-align: right;">Business
							:&nbsp;</div>
						<div class="col-md-6" style="margin-top: 10px; display: flex;">

							<label class="container"
								style="font-weight: normal; padding-left: 1px;">Yes <input
								type="radio" name="isBuissnessEdit" id="buisnessyesEdit"
								onclick="isBuissnessEdit(1)"> <span class="checkmark"></span>
							</label> <label class="container"
								style="font-weight: normal; padding-left: 1px;">No <input
								type="radio" checked="checked" name="isBuissnessEdit"
								id="buisnessnoEdit" onclick="isBuissnessEdit(0)"> <span
								class="checkmark"></span>
							</label>

						</div>
						<div class="col-md-2"></div>
					</div>
					<div style="display: none;" id="isbuissnessdivedit">
						<div class="row">

							<div class="col-md-4" style="text-align: right;">Company
								Name :&nbsp;</div>
							<div class="col-md-6">
								<input type="text" style="width: 100%;" class="form-control"
									placeholder="Enter Company Name" name="companyNameEdit"
									id="companyNameEdit" onchange="trim(this)">
							</div>
							<div class="col-md-2"></div>
						</div>

						<div class="row">

							<div class="col-md-4" style="text-align: right;">GST Number
								:&nbsp;</div>
							<div class="col-md-6">
								<input type="text" style="width: 100%;" class="form-control"
									placeholder="Enter GST Name" name="gstNoEdit" id="gstNoEdit"
									onchange="trim(this)">
							</div>
							<div class="col-md-2"></div>
						</div>

						<div class="row">

							<div class="col-md-4" style="text-align: right;">Address
								:&nbsp;</div>
							<div class="col-md-6">
								<input type="text" style="width: 100%;" class="form-control"
									placeholder="Enter Address" name="custAddEdit" id="custAddEdit"
									onchange="trim(this)">
							</div>
							<div class="col-md-2"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						onclick="submitEditCustomer()">Save</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<!-- ITEM DESC MODAL -->
	<div class="modal fade" id="myModalItemDesc" role="dialog"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Item Description</h4>
				</div>
				<div class="modal-body">


					<div class="row" style="padding: 5px">
						<div class="col-md-3" style="text-align: right;">Name :
							&nbsp;</div>
						<div class="col-md-9" style="text-align: left;">
							<span>Cakes</span>
						</div>
					</div>

					<div class="row" style="padding: 5px">

						<div class="col-md-3" style="text-align: right;">Quantity
							Available :&nbsp;</div>
						<div class="col-md-9" style="text-align: left;">
							<span>520</span>
						</div>
					</div>

					<div class="row" style="padding: 5px">

						<div class="col-md-3" style="text-align: right;">Weight
							:&nbsp;</div>
						<div class="col-md-9" style="text-align: left;">
							<span>120 Kg</span>
						</div>
					</div>

					<div class="row" style="padding: 5px">

						<div class="col-md-3" style="text-align: right;">Contents
							:&nbsp;</div>
						<div class="col-md-9" style="text-align: left;">
							<span>Commercially prepared stabilizers are used in sponge
								batters to help keep the batter from breaking down, thus forming
								a perfect, light emulsion. It is available in powder forms or
								even gel forms.</span>
						</div>
					</div>


					<div class="row" style="padding: 5px">

						<div class="col-md-3" style="text-align: right;">Notes
							:&nbsp;</div>
						<div class="col-md-9" style="text-align: left;">
							<span>Commercially prepared stabilizers are used in sponge
								batters to help keep the batter from breaking down, thus forming
								a perfect, light emulsion. It is available in powder forms or
								even gel forms.</span>
						</div>
					</div>




				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


	<!-- Pending AMT MODAL -->
	<div class="modal fade" id="myModalPendingAmt" role="dialog"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Pending Amount</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<!-- ADVANCE AMT MODAL -->
	<div class="modal fade" id="myModalAdvAmt" role="dialog"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Advance Amount</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- TOTAL AMT MODAL -->
	<div class="modal fade" id="myModalTotalAmt" role="dialog"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Total Amount</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>



	<!-- QTY POPUP -->
	<div class="form-popup-qty" id="myFormQty">
		<form action="#" class="form-container-qty">
			<h3>Quantity</h3>

			<div class="row">
				<div class="col-md-6" style="text-align: center;">
					Kg wise <br> <input type="text">
				</div>
				<div class="col-md-6" style="text-align: center;">
					Rate wise<br> <input type="text">
				</div>
			</div>
			<br>
			<div class="row" style="text-align: center;">
				<div>Kg wise : 1</div>
				<div>Rate wise : 100.00</div>
			</div>

			<br>
			<button type="submit" class="btn">Save</button>
			<button type="button" class="btn cancel" onclick="closeFormQty()">Close</button>
		</form>
	</div>
	<!-- QTY POPUP -->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/autocomplete.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/menuzord.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/css/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.js"></script>


	<script
		src="${pageContext.request.contextPath}/resources/customerBill/chosen.jquery.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/init.js"
		type="text/javascript" charset="utf-8"></script>
	<!--easyTabs-->
	<script>
		$(function() {
			$(".datepicker").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>
	<script>
		function paymentMode(val) {

			if (val == 1) {
				$("#splitDiv").hide();
				$("#singleDiv").show();
			} else if (val == 2) {
				$("#singleDiv").hide();
				$("#splitDiv").show();
			}

		}
	</script>

	<script type="text/javascript">
		function isBuissness(value) {

			if (value == 1) {
				$("#isbuissnessdiv").show();
			} else {
				$("#isbuissnessdiv").hide();
			}

		}
		function isBuissnessEdit(value) {

			if (value == 1) {
				$("#isbuissnessdivedit").show();
			} else {
				$("#isbuissnessdivedit").hide();
			}

		}
		function onloadTab(token) {

			//$("#tabId").value=token;
			document.getElementById("tabId").value = token;

		}
	</script>

	<script type="text/javascript">
		function trim(el) {
			el.value = el.value.replace(/(^\s*)|(\s*$)/gi, ""). // removes leading and trailing spaces
			replace(/[ ]{2,}/gi, " "). // replaces multiple spaces with one space 
			replace(/\n +/, "\n"); // Removes spaces after newlines
			return;
		}
		function validateMobile(mobile) {
			var mob = /^[1-9]{1}[0-9]{9}$/;

			if (mob.test($.trim(mobile)) == false) {

				//alert("Please enter a valid email address .");
				return false;

			}
			return true;

		}

		function editCustomer() {

			var custId = document.getElementById("cust").value;

			if (custId != 0) {

				$
						.post(
								'${editCustomerFromBill}',
								{
									custId : custId,
									ajax : 'true'
								},
								function(data) {

									$('#myModalEdit').modal('show');
									document.getElementById("customerNameEdit").value = data.custName;
									document.getElementById("mobileNoEdit").value = data.phoneNumber;

									document.getElementById("dobEdit").value = data.custDob;

									if (data.isBuissHead == 1) {

										$("#isbuissnessdivedit").show();
										document
												.getElementById("buisnessyesEdit").checked = true;
										document
												.getElementById("companyNameEdit").value = data.companyName;
										document.getElementById("gstNoEdit").value = data.gstNo;
										document.getElementById("custAddEdit").value = data.address;
									} else {
										$("#isbuissnessdivedit").hide();
										document
												.getElementById("buisnessyesEdit").checked = false;
									}

								});

			} else {
				alert("Select Customer ");
			}

		}

		function submitEditCustomer() {

			var customerName = document.getElementById("customerNameEdit").value;
			var mobileNo = document.getElementById("mobileNoEdit").value;

			var dateOfBirth = document.getElementById("dobEdit").value;

			//var isBuissness = document.getElementById("isBuissness").value;

			var buisness = 0;
			if (document.getElementById('buisnessyesEdit').checked) {
				buisness = 1;
			}

			var companyName = document.getElementById("companyNameEdit").value;
			var gstNo = document.getElementById("gstNoEdit").value;
			var custAdd = document.getElementById("custAddEdit").value;

			var flag = 0;

			if (customerName == "") {
				alert("Enter Customer Name");
				flag = 1;
			} else if (mobileNo == "" || !validateMobile(mobileNo)) {
				alert("Enter Valid Mobile No");
				flag = 1;
			} else if (dateOfBirth == "") {
				alert("Enter Date of Birth");
				flag = 1;
			} else if (buisness == 1) {

				if (companyName == "") {
					alert("Enter Company Name");
					flag = 1;
				} else if (gstNo == "") {
					alert("Enter GST No");
					flag = 1;
				} else if (custAdd == "") {
					alert("Enter Address");
					flag = 1;
				}
			}

			if (flag == 0) {
				$
						.post(
								'${submitEditCustomer}',
								{
									customerName : customerName,
									mobileNo : mobileNo,
									dateOfBirth : dateOfBirth,
									buisness : buisness,
									companyName : companyName,
									gstNo : gstNo,
									custAdd : custAdd,
									ajax : 'true'
								},
								function(data) {
									$('#myModalEdit').modal('hide');

									var html = '<option value="0" selected>Select Customer</option>';
									var len = data.customerList.length;
									//alert(data.addCustomerId);
									for (var i = 0; i < len; i++) {

										if (data.customerList[i].custId == data.addCustomerId) {
											html += '<option value="' + data.customerList[i].custId + '" selected>'
													+ data.customerList[i].custName
													+ '&nbsp;'
													+ data.customerList[i].phoneNumber
													+ '</option>';
										} else {
											html += '<option value="' + data.customerList[i].custId + '">'
													+ data.customerList[i].custName
													+ '&nbsp;'
													+ data.customerList[i].phoneNumber
													+ '</option>';
										}

									}

									$('#cust').html(html);

									alert("Update Information Successfully ");
									$("#cust").trigger("chosen:updated");
									$('.chosen-select').trigger(
											'chosen:updated');

									document.getElementById("customerNameEdit").value = "";
									document.getElementById("mobileNoEdit").value = "";

									document.getElementById("dobEdit").value = "";

									document.getElementById("buisnessnoEdit").checked = true;
									document.getElementById("companyNameEdit").value = "";
									document.getElementById("gstNoEdit").value = "";
									document.getElementById("custAddEdit").value = "";

								});
			}

		}

		function addCustomer() {

			var customerName = document.getElementById("customerName").value;
			var mobileNo = document.getElementById("mobileNo").value;
			var dateOfBirth = document.getElementById("dateOfBirth").value;
			//var isBuissness = document.getElementById("isBuissness").value;
			var buisness = 0;
			if (document.getElementById('buisnessyes').checked) {
				buisness = 1;
			}
			var companyName = document.getElementById("companyName").value;
			var gstNo = document.getElementById("gstNo").value;
			var custAdd = document.getElementById("custAdd").value;

			var flag = 0;

			if (customerName == "") {
				alert("Enter Customer Name");
				flag = 1;
			} else if (mobileNo == "" || !validateMobile(mobileNo)) {
				alert("Enter Valid Mobile No");
				flag = 1;
			} else if (dateOfBirth == "") {
				alert("Enter Date of Birth");
				flag = 1;
			} else if (buisness == 1) {

				if (companyName == "") {
					alert("Enter Company Name");
					flag = 1;
				} else if (gstNo == "") {
					alert("Enter GST No");
					flag = 1;
				} else if (custAdd == "") {
					alert("Enter Address");
					flag = 1;
				}
			}

			if (flag == 0) {
				$
						.post(
								'${saveCustomerFromBill}',
								{
									customerName : customerName,
									mobileNo : mobileNo,
									dateOfBirth : dateOfBirth,
									buisness : buisness,
									companyName : companyName,
									gstNo : gstNo,
									custAdd : custAdd,
									ajax : 'true'
								},
								function(data) {

									//alert(JSON.stringify(data));

									if (data.error == false) {

										var html = '<option value="0" selected>Select Customer</option>';
										var len = data.customerList.length;
										//alert(data.addCustomerId);
										for (var i = 0; i < len; i++) {

											if (data.customerList[i].custId == data.addCustomerId) {
												html += '<option value="' + data.customerList[i].custId + '" selected>'
														+ data.customerList[i].custName
														+ '&nbsp;'
														+ data.customerList[i].phoneNumber
														+ '</option>';
											} else {
												html += '<option value="' + data.customerList[i].custId + '">'
														+ data.customerList[i].custName
														+ '&nbsp;'
														+ data.customerList[i].phoneNumber
														+ '</option>';
											}

										}

										$('#cust').html(html);

										alert("Customer Add Successfully");
										$("#cust").trigger("chosen:updated");
										$('.chosen-select').trigger(
												'chosen:updated');
										$('#myModalAdd').modal('hide');

										document.getElementById("customerName").value = "";
										document.getElementById("mobileNo").value = "";

										document.getElementById("dateOfBirth").value = "";

										document.getElementById("buisnessno").checked = true;
										document.getElementById("companyName").value = "";
										document.getElementById("gstNo").value = "";
										document.getElementById("custAdd").value = "";

									} else {
										alert("Failed To Add Customer");
									}

								});
			}

		}
	</script>
	<script type="text/javascript">
		function refreshPage() {

			window.location = "${pageContext.request.contextPath}/home"

		}

		function openFormQty() {
			document.getElementById("myFormQty").style.display = "block";
		}

		function closeFormQty() {
			document.getElementById("myFormQty").style.display = "none";
		}
	</script>

	<script>
		function dropdownChange() {

			var val = $("#payType").val();

			if (val == 3) {
				document.getElementById("epayDiv").style.display = "block";
			} else {
				document.getElementById("epayDiv").style.display = "none";
			}

		}
	</script>


	<script>
		function itemSearchRadio(val) {

			if (val == 3) {
				$("#catDiv").hide();
			} else {
				$("#catDiv").show();
			}

		}
	</script>







</body>
</html>
