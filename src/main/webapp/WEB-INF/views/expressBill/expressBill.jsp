

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/autocomplete.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/autocomplete.css">
<script
	src="${pageContext.request.contextPath}/resources/css/easy-responsive-tabs.css"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>

<!--rightNav-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/menuzord.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>

<script>
  $( function() {
    $( "#todatepicker" ).datepicker({ dateFormat: 'dd-mm-yy' });
  } );
  $( function() {
    $( "#fromdatepicker" ).datepicker({ dateFormat: 'dd-mm-yy' });
  } );
 
  </script>
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
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css" />
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.js"></script>
<!-- 1 css and 2 js for search item   -->
<style>
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 25px;
	margin-top: 7px;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: -2px;
	left: 0px;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 19px;
	width: 21px;
	left: 5px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .3s;
	transition: .3s;
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
	border-radius: 52px;
}

.slider.round:before {
	border-radius: 50%;
}

#overlay {
	position: fixed;
	display: none;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(101, 113, 119, 0.5);
	z-index: 2;
	cursor: pointer;
}

#text {
	position: absolute;
	top: 50%;
	left: 50%;
	font-size: 25px;
	color: white;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}
/* **************************************************** */

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
</style>
</head>
<body>
	<div id="overlay">
		<div id="text">
			Please Wait...
			<%-- <img id="loading-image1" src="${pageContext.request.contextPath}/resources/images/loader1.gif" alt="Loading..." /> --%>
		</div>
	</div>

	<c:url var="getItemDetails" value="/findItemDetails" />
	<c:url var="insertItemOrder" value="/insertItem" />
	<c:url var="insertHeader" value="/insertHeader" />
	<div class="sidebarOuter"></div>
	<c:url var="calcStock" value="/calcStock" />
	<c:url var="printExBill" value="/printExBill" />
	<c:url var="deleteItem" value="/deleteItem" />
	<c:url var="getSelectedIdForPrint" value="/getSelectedIdForPrint" />
	<c:url var="getSpOrders" value="/getSpOrders" />
	<c:url var="getSpOrder" value="/getSpOrder" />
	<c:url var="dayClose" value="/dayClose" />
	<c:url var="getSpBill" value="/getSpBill" />
	<c:url var="getSpOrderBill" value="/getSpOrderBill" />
	<c:url var="saveSpOrderBill" value="/saveSpOrderBill" />
	

	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/logo.jsp"></jsp:include>
		<!--rightContainer-->
		<div class="fullGrid">
			<!--fullGrid-->
			<div class="wrapperIn2">
				<!--leftNav-->
				<jsp:include page="/WEB-INF/views/include/left.jsp">
					<jsp:param name="myMenu" value="${menuList}" />
				</jsp:include>
				<!--leftNav-->
				<!--rightSidebar-->
				<!------------ Place Actual content of page inside this div ----------->
				<div class="sidebarright">
					<div class="row">
						<div class="col-md-7">
							<h2 class="pageTitle">
								<i class="fa fa-file-pdf-o"></i> Express Bill
							</h2>
						</div>
						<div class="col-md-5">
							<c:choose>

								<c:when test="${count == 0}">
									<div class="">
										<div>
											<center>
												<input name="" class="buttonsaveorder" value="Start Day"
													type="button" id="start"
													onclick="start(); hideMe(this.id);">
											</center>
										</div>
									</div>
								</c:when>

								<c:when test="${count ==2}">


									<div>

										<h4>
											<B> Bill No :${sellBillHeader.sellBillNo} &nbsp; &nbsp;
												&nbsp; &nbsp; &nbsp; &nbsp; Bill Date
												:${sellBillHeader.billDate}</B>
										</h4>
									</div>
						</div>



					</div>
					<div style="margin: 15px 0">
						<div class="row text-left bill-date">
							<div class="col-md-2">
								<span
									style="padding-top: 0px; float: left; margin-top: 11px; font-size: 16px; width: 100px;">Single
									Print</span><label class="switch"> <input type="checkbox"
									id="id"> <span class="slider round"></span></label>
							</div>

							<div class="col-md-2">							
								<span
									style="padding-top: 0px; float: left; margin-top: 11px; font-size: 14px; width: 40px;">SP</span>
								<label class="switch"> <input type="checkbox" id="sp"
									name="sp"> <span class="slider round"></span>
								</label>
							</div>

							<div class="col-md-2" style="display: none;" id="tp">
								<select class="form-control" data-placeholder="Search Type"
									name="type" tabindex="-1" id="type" data-rule-required="true"
									onchange="onchangetype()">
									<option value="">Select Search Type</option>
									<option value="1">Search By Date</option>
									<option value="2">Search By Order No.</option>
								</select>
							</div>


							<div class="col-md-6" style="display: none;" id="byDate">
								<form name="frm_search" id="frm_search" method="post"
									action="itemHistory">

									<div class="col-md-5">
										<select name="group" id="group" placeholder="Select Menu"
											class="form-control" required>
											<option value="">Select Type</option>
											<option value="0">All</option>
											<c:forEach items="${menusList}" var="menusList">
												<c:choose>
													<c:when
														test="${menusList.mainCatId==5 || menusList.menuId==42}">

														<option value="${menusList.menuId}">${menusList.menuTitle}</option>
													</c:when>

												</c:choose>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-5">
										<input id="todatepicker" class="texboxitemcode texboxcal"
											placeholder="Delivery Date" name="datepicker" type="text"
											autocomplete="off">
									</div>
									<div class="col-md-2">
										<input name="" class="btn additem_btn" value="Search"
											type="button" onclick="searchOrders()" style="margin: 0;">
									</div>
								</form>
							</div>


							<div class="col-md-6" style="display: none;" id="byOrderNo">
								<form name="frm_search" id="frm_search" method="post"
									action="itemHistory">
									<div class="col-md-2">
										<div class="col1title">Order No.</div>
									</div>
									<div class="col-md-4">
										<input id="orderno" class="form-control"
											placeholder="Order No" name="orderno" type="text">
									</div>
									<div class="col-md-1">
										<input name="" class="buttonsaveorder" value="Search"
											type="button" onclick="searchOrder()">
									</div>
								</form>
							</div>


						</div>

					</div>

					<div class="row">







						<div class="clearfix"></div>
						<div class="table-wrap" id="orderHistory" style="display: none;">

							<div id="table-scroll" class="table-scroll">
								<div id="faux-table" class="faux-table1" aria="hidden"></div>
								<table id="table_history" class="main-table" border="1px">
									<thead>
										<tr class="bgpink">
											<th class="col-md-1" style="text-align: center;">Bill No</th>
											<th class="col-md-1" style="text-align: center;">Order
												No</th>
											<th class="col-md-2" style="text-align: center;">Item
												Name</th>
											<th class="col-md-1" style="text-align: center;">Flavour</th>
											<th class="col-md-1" style="text-align: center;">KG</th>
											<th class="col-md-1" style="text-align: center;">Delivery
												Date</th>
											<th class="col-md-1" style="text-align: center;">Rate</th>
											<!-- 	<th class="col-md-1" style="text-align: center;">Add On
												Rate</th> -->
											<th class="col-md-1" style="text-align: center;">Total</th>
											<th class="col-md-1" style="text-align: center;">Advance</th>
											<th class="col-md-1" style="text-align: center;">Remaining</th>
											<th class="col-md-1" style="text-align: center;">Memo &
												Bill</th>

										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="table" style="margin: 20px 0 0 0;">
							<div class="shInnerwidth">
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="table">
									<tr>
										<td align="center" valign="middle" style="padding: 0px;">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr class="bgpink">
													<td>Barcode</td>
													<td>Qty</td>
													<td>Item Name</td>
													<td>Rate</td>
												</tr>
												<tr>
													<td><input type="text" class="form-control"
														style="border-radius: 18px;"
														data-placeholder="Enter Barcode" id='input' autofocus
														onchange='onInput()' /></td>
													<td><input type="number" min="1" max="500"
														style="border-radius: 18px;" class="form-control"
														placeholder="1" name="qty1" onkeypress="onQty(event)"
														id="qty1" value="1" onfocusout="myFunction1()"></td>
													<td><input list="items" id="itemName" name="itemName"
														class="form-control chosen" autocomplete="off"
														placeholder="Item Name" onchange="onSelectItem()"
														style="border-radius: 18px;" type="text"> <datalist
															id="items">
															<c:forEach items="${itemsList}" var="itemsList">
																<option value='${itemsList.itemId}'
																	data-value='${itemsList.itemName}'
																	data-id='${itemsList.itemName}'>${itemsList.itemName}</option>
															</c:forEach>
														</datalist></td>
													<td>&nbsp;&nbsp;<input type="text" name="rateTdVal1"
														id="rateTdVal1" value="00"
														oninput="onRateChange(this.value)"
														style="width: 65px; border-radius: 18px; text-align: center;" />
														&nbsp;
														<button class="btn additem_btn" onclick="insertItem1()"
															disabled="disabled" id="insertItemButton"
															style="margin: 5px 0;">Submit</button>
													</td>
												</tr>
											</table>
										</td>
									</tr>

								</table>
							</div>
						</div>

					</div>
					<input name="rate1" id="rate1" type="hidden" value="00" />
					<div class="row">
						<div>
							<%-- 	<center> --%>






							<button style="float: right;" type="button"
								class="btn additem_btn" onclick="printExBill()" disabled
								id="printExBill">Print</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label id="itemNameForZeroMrp"></label>

							<label
								style="float: right; margin-top: 5px; margin-left: 40px; font-size: 18px;">Total
								: &nbsp;<input type="text" id="total" name="total"
								readonly="readonly" value="${itemTotal}"
								style="width: 100px; border: 0px; text-align: center;">
							</label>

							<%-- 	</center> --%>
							<div align="center" id="loader11"
								style="display: none; color: BLUE; font-size: 20px;">

								Loading....</div>
						</div>



					</div>
					<!-- Form End -->

					<div class="row">

						<div class="table-responsive">
							<div class="shInnerwidth">

								<table class="table table-bordered" width="100%" border="0"
									cellspacing="0" cellpadding="0 " id="table_grid1">
									<tr class="bgpink">
										<th>Print</th>
										<th>Sr.</th>
										<th>Detail Id</th>
										<th>Barcode</th>
										<th>Item Name</th>
										<th style="width: 130px;">Qty</th>
										<th>Rate</th>
										<th>Amt</th>
										<th>Action</th>
									</tr>

									<c:set var="total" value="${0}" />

									<c:forEach items="${sellBillDetails}" var="sellBillDetails"
										varStatus="count">
										<tr>
											<td><input type="checkbox" name="select_to_print"
												onchange="selectToPrint()"
												style="width: 25px; height: 25px;" id="select_to_print"
												value="${sellBillDetails.sellBillDetailNo}"></td>


											<td><c:out value="${listSize}" /></td>
											<c:set value="${listSize-1}" var="listSize"></c:set>
											<td><c:out value="${sellBillDetails.sellBillDetailNo}" /></td>
											<td><c:out value="${sellBillDetails.itemId}" /></td>
											<td><c:out value="${sellBillDetails.itemName}" /></td>
											<td style="text-align: right;"><c:out
													value="${sellBillDetails.qty}" /></td>
											<td style="text-align: right;"><c:out
													value="${sellBillDetails.mrp}" /></td>
											<td style="text-align: right;"><fmt:formatNumber
													type="number" minFractionDigits="1" maxFractionDigits="1"
													value="${sellBillDetails.grandTotal}" /></td>

											<td style="text-align: center;"><a href="#"
												class="action_btn"
												onclick="deleteItem(${sellBillDetails.sellBillDetailNo},${sellBillDetails.qty},${sellBillDetails.itemId})"><abbr
													title="Delete"><i class="fa fa-trash"></i></abbr></a></td>


											<c:set var="total"
												value="${total + sellBillDetails.grandTotal}" />

										</tr>
									</c:forEach>
								</table>
							</div>


							<!-- Loader Div -->
							<div align="center" id="loader" style="display: none">
								<span>
									<h4>
										<font color="#343690">Loading</font>
									</h4>
								</span> <span class="l-1"></span> <span class="l-2"></span> <span
									class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
								<span class="l-6"></span>
							</div>

							<!--End of  Loader Div -->
						</div>

					</div>
					<c:set var="dayCloseStyleDisplay" value="disabled" />
					<c:choose>
						<c:when test="${sellBillDetails.size()>0}">
							<c:set var="dayCloseStyleDisplay" value="" />
						</c:when>
					</c:choose>
					<center>
						<input type="button" class="btn additem_btn"
							onclick="todaysDayClose()" value="DAY CLOSE" id="dayClose1"
							${dayCloseStyleDisplay} />
					</center>
					<!--here input para was bill No  -->
					<!-- </li> -->

					</c:when>
					<c:when test="${count ==3}">
						<li>
							<div class="row"></div> <br /> <br />
							<div class="table">
								<div class="shInnerwidth">

									<table class="responsive-table table-bordered" width="100%"
										border="0" cellspacing="0" cellpadding="0 " id="table_grid">
										<tr class="bgpink">
											<th>Bill No.</th>
											<th>Bill Date</th>
											<th style="width: 130px;">Taxable Amount</th>
											<th>Payable Amount</th>
											<th>Amount</th>
											<th>Action</th>
										</tr>
										<tr>
											<td><c:out value="${sellBillHeader.sellBillNo}" /></td>
											<td><c:out value="${sellBillHeader.billDate}" /></td>
											<td><c:out value="${sellBillHeader.taxableAmt}" /></td>
											<td><c:out value="${sellBillHeader.payableAmt}" /></td>
											<td><c:out value="${sellBillHeader.grandTotal}" /></td>
											<td><input type="button" class="btn btn-primary"
												id="dayClose1" onclick="todaysDayClose()" value="DAY CLOSE"
												id="callSubmit" /> <!--here input para was bill No  --></td>
										</tr>
									</table>
								</div>
							</div>
						</li>

						<li>

							<div class="table-responsive">
								<div class="shInnerwidth">

									<table class="table table-bordered" width="100%" border="0"
										cellspacing="0" cellpadding="0 " id="table_grid">
										<tr class="bgpink">

											<th>Sr.No.</th>
											<th>Detail Id</th>
											<th>Barcode</th>
											<th>Item Name</th>
											<th style="width: 130px;">Qty</th>
											<th>Rate</th>
											<th>Amount</th>
										</tr>

										<c:forEach items="${sellBillDetails}" var="sellBillDetails"
											varStatus="count">
											<tr>
												<%--  <td><input type="checkbox"  style="width:28px;height:28px;" name="select_to_print" onchange="selectToPrint()"
																id="select_to_print"
																value="${sellBillDetails.sellBillDetailNo}" ></td> --%>
												<td><c:out value="${listSize}" /></td>
												<c:set value="${listSize-1}" var="listSize"></c:set>
												<td><c:out value="${sellBillDetails.sellBillNo}" /></td>
												<td><c:out value="${sellBillDetails.itemId}" /></td>
												<td><c:out value="${sellBillDetails.itemName}" /></td>
												<td style="text-align: right;"><c:out
														value="${sellBillDetails.qty}" /></td>
												<td style="text-align: right;"><c:out
														value="${sellBillDetails.mrp}" /></td>
												<td style="text-align: right;"><fmt:formatNumber
														type="number" minFractionDigits="1" maxFractionDigits="1"
														value="${sellBillDetails.grandTotal}" /></td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</li>

					</c:when>
					<c:otherwise>

					</c:otherwise>
					</c:choose>

					<li class="selected">
						<div class="row" id="loadmsg"
							style="display: none; text-align: center; color: blue;">
							<b>Please wait...</b>
						</div> <br /> <br />
						<div class="table" id="div1" style="display: none;">
							<div class="shInnerwidth">
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="table">
									<tr>
										<td align="center" valign="middle" style="padding: 0px;">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr class="bgpink">
													<td>Barcode</td>
													<td>Item Name</td>
													<td>Qty</td>
													<td>Rate</td>
												</tr>
												<tr>
													<td><input type='text' class="form-control"
														onkeypress='onInput()' min='0' max='500'
														placeholder="Enter Barcode" id='input' list='dlist' /> <datalist
															id='dlist'>
															<c:forEach items="${itemsList}" var="itemsList">
																<option value="${itemsList.itemId}"><c:out
																		value="${itemsList.itemId}" /></option>
															</c:forEach>
														</datalist></td>

													<td><select class="selectpicker"
														data-show-subtext="true" data-live-search="true"
														data-placeholder="Enter Item Name" name="itemName"
														class="form-control" tabindex="-1" id="itemName"
														onchange="onSelectItem()" data-rule-required="true">
															<option value="">Item Name</option>
															<c:forEach items="${itemsList}" var="itemsList">
																<option value="${itemsList.itemId}">${itemsList.itemName}</option>
															</c:forEach>
													</select></td>
													<td><input type="number" min="1" max="500"
														class="form-control" placeholder="1" name="qty1" id="qty1"
														onkeypress="onQty(event)" value="1"></td>
													<td>&nbsp;&nbsp;<input type="text" name="rateTdVal1"
														id="rateTdVal1" value="00"
														style="width: 65px; border-radius: 18px; text-align: center;"
														oninput="onRateChange(this.value)" /></td>
												</tr>
											</table>
										</td>
									</tr>

								</table>

							</div>

						</div> <input name="rate1" id="rate1" type="hidden" value="00" />
						<div class="row">
							<div class="col-md-12">
								<center>
									<button class="btn btn-primary" onclick="insertItem1()"
										disabled="disabled" style="display: none;"
										id="insertItemButton">Submit Item</button>
									<!-- <button style="float: right;margin-top: 13px;" type="button" class="btn btn-primary"
						onclick="printExBill()" disabled id="printExBill">Print</button> -->
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="itemNameForZeroMrp"></label>
								</center>



							</div>

						</div> <br /> <!-- Form End -->
						<div class="table-responsive" style="display: none;" id="div2">
							<div class="shInnerwidth">

								<table class="table table-bordered" width="100%" border="0"
									cellspacing="0" cellpadding="0 " id="table_grid">
									<tr class="bgpink">
										<th style="width: 130px;">Sr no.</th>
										<th>Barcode</th>
										<th>Item Name</th>
										<th style="width: 130px;">Qty</th>
										<th>Rate</th>
										<th>Amount</th>
										<th>Action</th>
									</tr>
									<tr>

									</tr>
								</table>
							</div>
						</div>
						<hr /> <br />
						<center>
							<button class="btn additem_btn" onclick="todaysDayClose()"
								style="display: none;" id="dayClose1">DAY CLOSE</button>
						</center>
						<center>
							<input type="submit" class="btn btn-primary"
								onclick="todaysDayClose()" style="display: none;" id="dayClose1"
								value="DAY CLOSE">
						</center>



					</li>
				</div>

				<!--tabNavigation-->
			</div>
			<!--rightSidebar-->

		</div>
		<!--fullGrid-->
	</div>
	<!--rightContainer-->

	</div>
	<!--wrapper-end-->

	<!--easyTabs-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!--easyTabs-->
	<script type="text/javascript">
	$('#rateTdVal1').on('input', function() {
		  this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
		});
	
function start(){
	$("#loadmsg").show();
    //$("#div1").show();
    //$("#div2").show();
   // $("#insertItemButton").show();
    //$("#dayClose1").show();
    
   // $("#insertItemButton").show();
    $("#loader").show();

  //  alert("started");
    
    $.getJSON('${insertHeader}',{

    	ajax : 'true',

    }, function(data) {
		window.location.reload();
	    $("#loader").hide();


	});
}

function  hideMe(startId){
	 $("#"+startId).hide();
	// $("#insertItemButton").show();
	 //window.location.reload();
	
}

</script>
	<script type="text/javascript">
function onRateChange(rate)
{
   if(rate>0)
	   {
		document.getElementById("insertItemButton").disabled = false;

	   }else
	   {
			document.getElementById("insertItemButton").disabled = true;

	   }
}
</script>
	<script type="text/javascript">
	function onInput() {
		
	    var val = document.getElementById("input").value;
	    
	   // alert("Barcode "+val);
	 
	    $.getJSON('${getItemDetails}',{
			
            //itemId : JSON.stringify(val),
			 itemId : val,
			ajax : 'true',

		}, function(data) {
			//alert("name="+data.itemName);
			
			
			$('#itemName').selectpicker('val',''+data.itemId);

			document.getElementById("rateTdVal1").value=data.mrp;
			document.getElementById("itemNameForZeroMrp").innerText=data.itemName;
			//$('#insertItemButton').focus();
			
			// 
			 if(data.mrp>0 ){
				 insertItem1();
			 }
			 else if(val!="" )
				 {
				  alert("Please Enter Rate");
				 }
			 $('#input').focus();
		});
		//$('#insertItemButton').focus();
	    $('#input').focus();
	  }
	
	function onSelectItem() {
 
		var iId=document.getElementById("itemName").value;
	  
	    	val=iId;
	    	
	    //alert("iID " +iId);
		  
	    $.getJSON('${getItemDetails}',{
	  
           // itemId : JSON.stringify(val),
           
           itemId : val,
			ajax : 'true',

		}, function(data) {

		//$('#itemName').val(data.itemId).prop('selected', true);
			$('#itemName').selectpicker('val',''+data.itemId);
		document.getElementById("input").value=val;
			
		document.getElementById("rateTdVal1").value=data.mrp;
		document.getElementById("itemNameForZeroMrp").innerText=data.itemName;
		
			//$('#insertItemButton').focus();
			 $('#input').focus();
			 
			 if(data.mrp>0){
				insertItem1();
			 } else if(iId!="")
			 {
				  alert("Please Enter Rate");
				 
			 }
		});
		
	}
	</script>
	<script type="text/javascript">
	function insertItem1() {
		
		document.getElementById("insertItemButton").disabled = false;
		
		$('#loader11').show();
		var itemname=$("#items option[value='" + $('#itemName').val() + "']").attr('data-id');
		$('#loader11').html('Adding '+itemname);

	    var val = document.getElementById("input").value;
	    var qty = document.getElementById("qty1").value;
	    var mrp = document.getElementById("rateTdVal1").value;
	    if(parseInt(qty)>0){

	    $('#qty1').focus();
	    
	    $.getJSON('${calcStock}',{

	    	itemId : val,
            qty:qty,
			ajax : 'true',

	}, function(data) {
		if(data<qty)
			{
			$('#loader11').hide();
			$('#loader11').html('Loading ...');
			alert("Stock Not Available. Can not place Item ");
			document.getElementById("input").value="";
			
			 $('#qty1').focus();
			 
			}
		else
	    {
		

		 $.getJSON('${insertItemOrder}',{
				

	            itemId : val,
	            qty:qty,
	            mrp:mrp,
				ajax : 'true',

			}, function(data) {

				document.getElementById("rateTdVal1").value=00;
				document.getElementById("itemName").value="";

				$('#loader11').hide();
				var len = data.length;

				$('#table_grid1 td').remove();
				
				var total=0;

				$.each(data,function(key, item) {
					key=len;
				var tr = $('<tr></tr>');
				tr.append($('<td ></td>').html(' <input type="checkbox" style="width:25px;height:25px;"  onchange="selectToPrint()" name="select_to_print" id="select_to_print" value="'+item.sellBillDetailNo+'" >'));
			
					//tr.append($('<td></td>').html(key));
					
					tr.append($('<td></td>').html(len));
						
						len=len-1;

				tr.append($('<td></td>').html(item.sellBillDetailNo));
				
			  	tr.append($('<td></td>').html(item.itemId));

			  	tr.append($('<td></td>').html(item.itemName));

				tr.append($('<td style="text-align: right;"></td>').html(item.qty));

				tr.append($('<td style="text-align: right;"></td>').html(item.mrp));

				tr.append($('<td style="text-align: right;"></td>').html((item.grandTotal).toFixed(1)));
				
				//tr.append($('<td ><input type="button" id="deleteButton" onclick="deleteItem('+item.sellBillDetailNo+')" /><i class='fa fa-trash'></i></td>'));

				//tr.append($('<td ><a href="#" >< i class="fa fa-trash" id="deleteButton" onclick="deleteItem('+item.sellBillDetailNo+')" ></i></a></td>'));

				
				tr.append($('<td style="text-align:center;"><a href="#" class="action_btn" onclick="deleteItem('+item.sellBillDetailNo+','+item.qty+','+item.itemId+')"><abbr title="Delete"><i class="fa fa-trash"></i></abbr></a></td>'));
				$('#table_grid1 tbody').append(tr);
				
				total=total+item.grandTotal;

			});
				
				document.getElementById("total").value=total.toFixed(1);
				
				var rowCount = document.getElementById('table_grid1').rows.length;
				if(rowCount>=1)
					{
					document.getElementById('dayClose1').disabled=false;
					}else{
						document.getElementById('dayClose1').disabled=true;
					}

				 if(document.getElementById("id").checked){
					 
					// alert("print");
					 window.open("${pageContext.request.contextPath}/printExBill");
				 }
	         });
		
	}
	});
	    document.getElementById("input").value="";

		//$('#itemName').selectpicker('val',''+"");
				document.getElementById("itemName").value="";
				document.getElementById("itemNameForZeroMrp").innerText="";
		 $('#qty1').focus();
	}//if 
	else{
		alert("Please Enter Atleast One Quantity");
		$('#loader11').hide();
		document.getElementById("itemName").value="";

	   document.getElementById("qty1").value="1";
		//$('#itemName').selectpicker('val',''+"");
		document.getElementById("input").value="";

	}

	}
		
	</script>

	<script type="text/javascript">
function myFunction1() {
	
	 $('#itemName').focus();
	 var x = document.getElementById("itemName").length;

	 document.getElementById("itemName").size = x;
}
</script>


	<script type="text/javascript">
	function todaysDayClose(){
			//alert("Hi ");
			 var x = confirm("Do you really want to submit the bill (Day Close) ?");
				if (x == true) {
					document.getElementById("dayClose1").disabled = true;
					 $('#loader11').show();
							$.getJSON('${dayClose}',{

								ajax : 'true',
							 },
							 function(data) {
								 //alert(data);
								 
								 window.location.reload();
								 
			});
				return true;
				$('#loader11').hide();
		}
		return false; 			
		//	alert("Hi End  ");
	}
	
	</script>




	<!-- <script type="text/javascript">
	function todaysDayClose(){
			alert("Hi ");
							$('#loader11').show();

			$.ajax({

				type : "get",
				url : "dayClose", 
			
				 complete: function() {
					
					 window.location.reload();
				 }
			});
			$('#loader11').hide();
			alert("Hi End  ");
	}
	
	</script> -->

	<script type="text/javascript">
	function deleteItem(sellBillDetailNo,qty,id){
		
		$('#loader').show();

		//alert("Hello");
			var billNo=sellBillDetailNo;
			
			 $.getJSON('${deleteItem}',{

				sellBillDetailNo:billNo,
				qty:qty,
				id:id,
				type : "get",
			

			 },
			 function(data) {
					//$('#loader').hide();


					$('#loader').hide();
					var len = data.length;
                      if(len==0){
  						document.getElementById('dayClose1').disabled=true;

                      }else{
  						document.getElementById('dayClose1').disabled=false;

                      }
					$('#table_grid1 td').remove();
					
					var total=0;

					$.each(data,function(key, item) {

					var tr = $('<tr></tr>');
					
					 
						
						tr.append($('<td></td>').html(' <input type="checkbox" style="width:25px;height:25px;" onchange="selectToPrint()" name="select_to_print" id="select_to_print" value="'+item.sellBillDetailNo+'" >'));
						
						//tr.append($('<td></td>').html(key+1));
						
						tr.append($('<td></td>').html(len));
						
						len=len-1;
						
						tr.append($('<td></td>').html(item.sellBillDetailNo));
						
				  	tr.append($('<td></td>').html(item.itemId));

				  	tr.append($('<td></td>').html(item.itemName));

					tr.append($('<td style="text-align: right;"></td>').html(item.qty));

					tr.append($('<td style="text-align: right;"></td>').html(item.mrp));

					tr.append($('<td style="text-align: right;"></td>').html((item.grandTotal).toFixed(1)));
					
				//	tr.append($('<td ><input type="button" id="deleteButton" onclick="deleteItem('+item.sellBillDetailNo+')" value="Delete" /></td>'));
				    tr.append($('<td style="text-align:center;"><a href="#" class="action_btn" onclick="deleteItem('+item.sellBillDetailNo+','+item.qty+','+item.itemId+')"><abbr title="Delete"><i class="fa fa-trash"></i></abbr></a></td>'));


					$('#table_grid1 tbody').append(tr);
					
					total=total+item.grandTotal;

				});
					
					document.getElementById("total").value=total.toFixed(1);
				
		         });
				
		}
	
	
	function printExBill()
	{
		//alert("in print");
		
		var checkedId=[];
		var checkboxes=document.getElementsByName("select_to_print");
		
		 
			for (var i = 0, n = checkboxes.length; i < n; i++) {
				if(checkboxes[i].checked) {
					
					checkedId.push(checkboxes[i].value );
					
				}
			}
			if(checkedId.length>0){
			//alert(checkboxes);
			 $.getJSON('${getSelectedIdForPrint}',{

					id :  JSON.stringify(checkedId),
					ajax : 'true',
				

				 },	function(data) {
					 
					 window.open("${pageContext.request.contextPath}/printSelectedOrder");
					 
				 });
			}
			else
				{
				 alert("Please Select atleast one item!!")
				}
	}
	
	function selectToPrint()
	{
		//alert("hh");
	 
		var checkboxes=document.getElementsByName("select_to_print");
		//alert(checkboxes[0].value);
		var flag=0;
			for (var i = 0, n = checkboxes.length; i < n; i++) {
				if(checkboxes[i].checked) {
					 
					flag=1;
				}
			}
		if(flag==1)
			{
		 //alert("KK");
			document.getElementById("printExBill").disabled=false;
			}
		else{
		document.getElementById("printExBill").disabled=true;
		}
		
		 
	}
	
	function onQty(event) {
		var x = event.which || event.keyCode;
		if (x == 13) {
			//document.getElementById("b" + token).focus();
			
			   document.getElementById("qty1").value="1";

		}
	}
	</script>
	<script>

(function() {
  var fauxTable = document.getElementById("faux-table");
  var mainTable = document.getElementById("table_history");
  var clonedElement = table_grid.cloneNode(true);
  var clonedElement2 = table_grid.cloneNode(true);
  clonedElement.id = "";
  clonedElement2.id = "";
  fauxTable.appendChild(clonedElement);
  fauxTable.appendChild(clonedElement2);
});

$('#sp').change(function() {
	   if($(this).is(":checked")) {
		   $("#tp").show();
		   document.getElementById("type").value="";
		   $("#orderHistory").hide();
	      return;
	   }
	   else
		   {
		   $("#tp").hide();
		   $("#byOrderNo").hide();
		   $("#byDate").hide();
		   $("#orderHistory").hide();
		   return;
		   }
	   //'unchecked' event code
	});
	
	function onchangetype()
	{
		var selectedValue = document.getElementById("type").value;

		if(selectedValue==1)
		{
			  $("#byDate").show();
			  $("#byOrderNo").hide();
			  $("#orderHistory").show();
				$('#table_history td').remove();
				document.getElementById("group").value="";
		}
		else if(selectedValue==2)
			{
			  $("#byOrderNo").show();
			  $("#byDate").hide();
			  $("#orderHistory").show();
				$('#table_history td').remove();
				document.getElementById("group").value="";
				document.getElementById("orderno").value="";
			}
		
	}
	</script>
	<script type="text/javascript">
	function searchOrders()
	{ 
		
		$('#table_history td').remove();
		on();
			var date = document.getElementById("todatepicker").value;
			var group=document.getElementById("group").value;
			
			$.getJSON('${getSpOrders}',{
				
				date : date,
				group:group,
				ajax : 'true',

							},
							function(data) {
								if (data == "") {
									off();
									alert("No records found !!");
								}
								off();
								$.each(data.spCakeOrder,function(key, order) {

								
									var tr = $('<tr></tr>');
									var spName="";
									if((order.spBookForMobNo).length==1)
									{
									tr.append(/* $('<td class="col-md-1"></td>').html("&nbsp;&nbsp; <button class='btn btn-info' value='Generate' id='genBill"+order.spOrderNo+"'  onclick='genBill("+order.spOrderNo+")'>Generate</button>")); */
											$('<td class="col-md-1"></td>').html("&nbsp;&nbsp; <button class='btn btn-info' value='Generate' id='genBill"+order.spOrderNo+"'  onclick='openPaymentPopup("+order.spOrderNo+")'>Generate</button>"));
									spName=order.spName+"&nbsp;&nbsp;&nbsp;	<a href='editSpOrder/"+order.spOrderNo+"'  ><span	class='fa fa-pencil'></span></a>";
									}else
										{
										tr.append($('<td class="col-md-1"></td>').html(order.spBookForMobNo));
										spName=order.spName;   
										}
									tr.append($('<td class="col-md-1"></td>').html(order.spDeliveryPlace));
								  	tr.append($('<td class="col-md-1"></td>').html(spName));
									tr.append($('<td class="col-md-1"></td>').html(order.spfName));	
									tr.append($('<td class="col-md-1"></td>').html(order.spSelectedWeight+" Kg"));
									var price=parseFloat(order.spGrandTotal-order.spTotalAddRate);
									tr.append($('<td class="col-md-1"></td>').html(order.spDeliveryDate));	
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(price));
								/* 	tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.spTotalAddRate)); */
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.spGrandTotal));
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.spAdvance));
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.spGrandTotal-order.spAdvance));
									if((order.spBookForMobNo).length>1)
									{
									tr.append($('<td class="col-md-1"></td>').html("&nbsp;&nbsp;&nbsp;&nbsp;<a href='${pageContext.request.contextPath}/showSpCakeOrderHisPDF/"+order.spOrderNo+"' target='_blank' >	<abbr title='Order Memo'><i class='fa fa-file-pdf-o'></i></abbr></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='${pageContext.request.contextPath}/printSpCkBill/"+order.spOrderNo+"' target='_blank'><abbr title='Bill'><i class='fa fa-file-pdf-o'></i></abbr></a>"));
									}else{
									tr.append($('<td class="col-md-1"></td>').html("&nbsp;&nbsp;&nbsp;&nbsp;<a href='${pageContext.request.contextPath}/showSpCakeOrderHisPDF/"+order.spOrderNo+"' target='_blank' >	<abbr title='Order Memo'><i class='fa fa-file-pdf-o'></i></abbr></a>&nbsp;&nbsp;&nbsp;&nbsp;"));

									}
									$('#table_history tbody').append(tr);


												})
									$.each(data.regularSpCkOrders,function(key, order) {

								
									var tr = $('<tr></tr>');
									tr.append($('<td class="col-md-1"></td>').html("Reg SP"));
									tr.append($('<td class="col-md-1"></td>').html(order.rspPlace));

								  	tr.append($('<td class="col-md-1"></td>').html(order.itemName));
									tr.append($('<td class="col-md-1"></td>').html("NA"));
									tr.append($('<td class="col-md-1"></td>').html(order.qty));	
									tr.append($('<td class="col-md-1"></td>').html(order.rspDeliveryDt));	
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.rate));
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(0));
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.rspSubTotal));
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.rspAdvanceAmt));
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.rspSubTotal-order.rspAdvanceAmt));
									tr.append($('<td class="col-md-1"></td>').html("&nbsp;&nbsp;&nbsp;&nbsp;<a href='${pageContext.request.contextPath}/showRegCakeOrderHisPDF/"+order.rspId+"' target='_blank' >	<abbr title='Order Memo'><i class='fa fa-file-pdf-o'></i></abbr></a>"));
									$('#table_history tbody').append(tr);


												})		
								
								
							});

		
	}
	function searchOrder()
	{ 
		
		$('#table_history td').remove();
		on();
			var orderno = document.getElementById("orderno").value;
			
			$.getJSON('${getSpOrder}',{
				
				orderno : orderno,
				ajax : 'true',

							},
							function(data) {
								if (data == null) {
									off();
									alert("No records found !!");
								}
							
								off();
								$.each(data.spCakeOrder,function(key, order) {
									var tr = $('<tr></tr>');
									var spName="";
									if((order.spBookForMobNo).length==1)
										{
										tr.append(/* $('<td class="col-md-1"></td>').html("&nbsp;&nbsp; <button class='btn btn-info' value='Generate' id='genBill"+order.spOrderNo+"'  onclick='genBill("+order.spOrderNo+")'>Generate</button>")); */
												$('<td class="col-md-1"></td>').html("&nbsp;&nbsp; <button class='btn btn-info' value='Generate' id='genBill"+order.spOrderNo+"'  onclick='openPaymentPopup("+order.spOrderNo+")'>Generate</button>"));
										spName=order.spName+"&nbsp;&nbsp;&nbsp;	<a href='editSpOrder/'"+order.spOrderNo+" ><span	class='fa fa-pencil'></span></a>";
										}else
											{
											tr.append($('<td class="col-md-1"></td>').html(order.spBookForMobNo));
											spName=order.spName;
											}
									tr.append($('<td class="col-md-1"></td>').html(order.spDeliveryPlace));
								  	tr.append($('<td class="col-md-1"></td>').html(spName));
									tr.append($('<td class="col-md-1"></td>').html(order.spfName));	
									tr.append($('<td class="col-md-1"></td>').html(order.spSelectedWeight+" Kg"));
									var price=parseFloat(order.spGrandTotal-order.spTotalAddRate);
									tr.append($('<td class="col-md-1"></td>').html(order.spDeliveryDate));	
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(price));
									/* tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.spTotalAddRate)); */
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.spGrandTotal));
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.spAdvance));
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.spGrandTotal-order.spAdvance));
									if((order.spBookForMobNo).length>1)
									{
									tr.append($('<td class="col-md-1"></td>').html("&nbsp;&nbsp;&nbsp;&nbsp;<a href='${pageContext.request.contextPath}/showSpCakeOrderHisPDF/"+order.spOrderNo+"' target='_blank' >	<abbr title='Order Memo'><i class='fa fa-file-pdf-o'></i></abbr></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='${pageContext.request.contextPath}/printSpCkBill/"+order.spOrderNo+"' target='_blank'><abbr title='Bill'><i class='fa fa-file-pdf-o'></i></abbr></a>"));
									}else{
									tr.append($('<td class="col-md-1"></td>').html("&nbsp;&nbsp;&nbsp;&nbsp;<a href='${pageContext.request.contextPath}/showSpCakeOrderHisPDF/"+order.spOrderNo+"' target='_blank' >	<abbr title='Order Memo'><i class='fa fa-file-pdf-o'></i></abbr></a>&nbsp;&nbsp;&nbsp;&nbsp;"));

									}
									$('#table_history tbody').append(tr);
								  
								})		
								$.each(data.regularSpCkOrders,function(key, order) {

									
									var tr = $('<tr></tr>');
									tr.append($('<td class="col-md-1"></td>').html("Reg SP"));
									tr.append($('<td class="col-md-1"></td>').html(order.rspPlace));

								  	tr.append($('<td class="col-md-1"></td>').html(order.itemName));
									tr.append($('<td class="col-md-1"></td>').html("NA"));	
									tr.append($('<td class="col-md-1"></td>').html(order.qty));	

									tr.append($('<td class="col-md-1"></td>').html(order.rspDeliveryDt));	
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.rate));
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(0));
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.rspSubTotal));
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.rspAdvanceAmt));
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(order.rspSubTotal-order.rspAdvanceAmt));
									tr.append($('<td class="col-md-1"></td>').html("&nbsp;&nbsp;&nbsp;&nbsp;<a href='${pageContext.request.contextPath}/showRegCakeOrderHisPDF/"+order.rspId+"' target='_blank' >	<abbr title='Order Memo'><i class='fa fa-file-pdf-o'></i></abbr></a>"));
									$('#table_history tbody').append(tr);


												})					
											
								
								
							});

		
	}
	</script>
	<script type="text/javascript">
	function genBill(spOrderNo)
	{
		
		document.getElementById("genBill"+spOrderNo).disabled = true;

           //end ajax send this to php page
		   $.getJSON('${getSpBill}', {
			   spOrderNo:spOrderNo,
               ajax : 'true'
           }, function(data) {
        	   if(data==true)
        		   {
        		   alert("Bill Generated Successfully");
        		  // document.getElementById("frm_search").submit();
                 if(selectedValue==1)
                	 {
                	 searchOrders();
                	 }else
                		 {
                		 searchOrder();
                		 }
        		   }else{
        			   document.getElementById("genBill"+spOrderNo).disabled = false;
        			   
        		   }        	   
           });  
		
	}
    </script>
	<script type="text/javascript">
/* 	$(".table tbody tr").click(function(e) {
	    if($(e.target).is(':checkbox')) return; //ignore when click on the checkbox
	    document.getElementById("printExBill").disabled=false;
	    var $cb = $(this).find(':checkbox');
	    $cb.prop('checked', !$cb.is(':checked'));
	  
	}); */
	
/* 	  if(this.style.background == "" || this.style.background =="white") {
          $(this).css('background', 'lightpink');
          
      }
      else {
          $(this).css('background', 'white');
      } */
	</script>
	<script>
function on() {
    document.getElementById("overlay").style.display = "block";
}

function off() {
    document.getElementById("overlay").style.display = "none";
}
</script>
<!-- ************************************************* -->
	<div id="payment" class="modal">
		<div class="modal-content" style="width: 75%">
			<span class="close" onclick="closePaymentPopup()" style="opacity: 2;">&times;</span>

			<h3 class="pageTitle">Payment</h3>

			<div class="row">
				<form action="saveFranchiseeEmp" id="fr_emp_form" method="post"
					autocomplete="off">
					<div class="col-lg-12">

						<input type="hidden" name="sp_bill_no" id="sp_bill_no">
						<!-- 1 -->
						<div class="mon_pop_row">
							<div class="pop_row_l">
								<div class="profilefildset">Total AMT</div>
							<div class="profileinput" >
							<input name="totalAmtPopup" id="totalAmtPopup" type="text"
										class="texboxitemcode" readonly="readonly"
										style="background-color: lightgrey; font-size: 16px; " />
							</div>	
							</div>
							<div class="pop_row_r">
								<div class="profilefildset">Advance AMT</div>
							<div class="profileinput" >
							<input name="advAmtPopup" id="advAmtPopup"type="text"
										class="texboxitemcode" readonly="readonly"
										style="background-color: lightgrey; font-size: 16px; " />
							</div>
							</div>
							<div class="clr"></div>
						</div>	
						
						<!-- 2 -->
						<div class="mon_pop_row">
							<div class="pop_row_l">
								<div class="profilefildset">Discount %</div>
							<div class="profileinput" id="discountPopup">
								<input name="discPer" id="discPer" step="0.01" readonly="readonly"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
									onchange="itemDiscPerCalculation(1)"
									onkeyup="itemDiscPerCalculation(1)" type="text"
									class="texboxitemcode" value="0" placeholder="Disc %"
									style=" background-color: lightgrey;" />
							</div>	
							</div>
							<div class="pop_row_r">
								<div class="profilefildset">Discount Amt</div>
							<div class="profileinput">
								<input class="texboxitemcode" type="text" name="discAmt"
									id="discAmt"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
									onchange="itemDiscPerCalculation(2)"
									onkeyup="itemDiscPerCalculation(2)" class="form-control"
									 placeholder="Disc Amt"
									style="background-color: lightgrey;" />
							</div>
							</div>
							<div class="clr"></div>
						</div>	
						
						<!-- 3 -->
						<div class="mon_pop_row">
							<div class="pop_row_l">
								<div class="profilefildset">Total Payable</div>
							<div class="profileinput">
								<input name="totalPayableAmt" id="totalPayableAmt" type="text"
										class="texboxitemcode" readonly="readonly"
										style="background-color: lightgrey; font-size: 16px; " />
							</div>
							</div>
							<div class="pop_row_r">
								<div class="profilefildset">Credit Bill</div>
							<div class="profileinput">
								<input type="radio" id="creditBillyes" name="creditBill"
									onclick="modeOfPayDivHideShow(1)"> Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="radio" id="creditBillno" name="creditBill"
									onclick="modeOfPayDivHideShow(2)" checked> NO
							</div>
							</div>
							<div class="clr"></div>
						</div>	
						
						<div id="modeOfPayDiv">
							<div class="mon_pop_row" style="display: none;">
								<div class="pop_row_l">
								<div class="profilefildset">Mode of Payment</div>
								<div class="profileinput">
									<input type="radio" id="single" name="modePay"
										value="0" checked onclick="changeSplitSingle(1)"> Single
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
										<input type="radio" name="modePay" id="split" name="modePay" onclick="changeSplitSingle(2)" > Split
								</div>
							</div>
							<div class="pop_row_r">&nbsp;</div>
							</div>
							
							<div id="splitDiv" style="display: none;">
								<div class="mon_pop_row">
									<div class="pop_row_l">
										<div class="profilefildset">Cash</div>
							<div class="profileinput">
								
									<ul>
										<li>
											<!-- <input type="checkbox" id="cashCheck"
											name="cashCheck" checked> &nbsp;  --> <input type="text"
											id="cashAmt" name="cashAmt" class="texboxitemcode"
											oninput="matchSplitAmt(1)" onchange="matchSplitAmt(1)"
											style="font-size: 16px;" placeholder="Cash Amount" value="0">
										</li>
									</ul>								
							</div>
									</div>
									<div class="pop_row_r">
										<div class="profilefildset">Card</div>
							<div class="profileinput">
								
									<ul style="padding-left: 5px;">
										<li>
											<!-- <input type="checkbox" id="cardCheck"
											name="cardCheck"> &nbsp;  --> <input type="text" id="cardAmt"
											name="cardAmt" class="texboxitemcode"
											placeholder="Card Amount" value="0" style="font-size: 16px;"
											oninput="matchSplitAmt(2)" onchange="matchSplitAmt(2)">
										</li>
										<li style="padding-left: 5px;"><select
											name="cardTypeSplit" id="cardTypeSplit"
											data-placeholder="Card Type" class="texboxitemcode"
											style="text-align: left; font-size: 16px;">
												<option value="" style="text-align: left;">Select
													Card</option>

												<option value="4" style="text-align: left;">Debit
													Card</option>
												<option value="5" style="text-align: left;">Credit
													Card</option>
										</select></li>
									</ul>								
							<div class="clr"></div>
						</div>
									</div>
									<div class="clr"></div>
								</div>
								<div class="mon_pop_row">
									<div class="pop_row_l">
										<div class="add_customer_one">E-Pay</div>
							<div class="add_input">
								<div class="radio_row popup_radio">
									<ul>
										<li>
											<!-- <input type="checkbox" id="epayCheck"
											name="epayCheck"> &nbsp;  --> <input type="text" id="epayAmt"
											name="epayAmt" class="texboxitemcode"
											placeholder="E-Pay Ammount" value="0"
											style="font-size: 16px;" oninput="matchSplitAmt(3)"
											onchange="matchSplitAmt(3)">
										</li>
										<li style="padding-left: 5px;"><select
											name="ePayTypeSplit" id="ePayTypeSplit"
											data-placeholder="E-Pay Type" class="texboxitemcode "
											style="text-align: left; font-size: 16px;">
												<option value="">E-Pay Type</option>

												<option value="7" style="text-align: left;">Paytm</option>

												<option value="8" style="text-align: left;">Google
													Pay</option>
												<option value="6" style="text-align: left;">Bank
													Transaction</option>
												<option value="9" style="text-align: left;">Amazon
													Pay</option>
										</select></li>

									</ul>
								</div>
							</div>
							<div class="texboxitemcode" id="epayLabel"></div>
									</div>
									<div class="pop_row_r">&nbsp;</div>
									<div class="clr"></div>
								</div>
								
							</div>
							
							<div class="mon_pop_row" >
							
							<div class="pop_row_l">
								<div class="profilefildset">Type</div>
									<div class="profileinput">
										<select  name="billType" id="billType" style="" data-placeholder="Type"
										onchange="onPayTypeChange(this.value)" class="texboxitemcode"
											class="input_add " style="text-align: left;">
											<option value="1" style="text-align: left;" selected>Cash</option>
											<option value="2" style="text-align: left;">Card</option>
											<option value="3" style="text-align: left;">E-Pay</option>
										</select>
									</div>
							</div>
							<div class="pop_row_r" id="cardTypeDiv" style="display: none;">
								<div class="profilefildset">Card Type</div>
							<div class="profileinput">
								<select name="cardType" id="cardType"  
									data-placeholder="Card Type" class="texboxitemcode"
									style="text-align: left; font-size: 16px;">
									<option value="" style="text-align: left;">Select Card</option>

									<option value="4" style="text-align: left;">Debit Card</option>
									<option value="5" style="text-align: left;">Credit
										Card</option>
								</select>

							</div>
							</div>
							<div class="pop_row_r"  id="epayTypeDiv" style="display: none;">
								<div class="profilefildset">E-Pay Type</div>
							<div class="profileinput">
								<select name="ePayType" id="ePayType"
									data-placeholder="E-Pay Type" class="texboxitemcode"
									style="text-align: left; font-size: 16px; " >
									<option value="">Select E-Pay Type</option>
									<option value="7" style="text-align: left;">Paytm</option>
									<option value="8" style="text-align: left;">Google Pay</option>
									<option value="6" style="text-align: left;">Bank
										Transaction</option>

									<option value="9" style="text-align: left;">Amazon Pay</option>
								</select>
							</div>
							</div>
							<div class="pop_row_r">
								<div class="profilefildset">Amount</div>
								<div class="profileinput">
									<input name="payAmt" id="payAmt" type="text"
										class="texboxitemcode" readonly="readonly"
										value="${totalAmt-advanceAmt}" placeholder="Enter Amount"
										style="background-color: lightgrey; font-size: 16px;" />
								</div>
							</div>
							<div class="pop_row_l">
								<div class="profilefildset">Remark</div>
								<div class="profileinput">
									<textarea  name="payRemark" id="payRemark" type="text" cols="3" rows="3"
										class="texboxitemcode" placeholder="Enter Remark" style="resize: none;"></textarea>
								</div>
							</div>
						</div>
						
							
							
						</div>
						
						
						
									
					</div>
				</form>
			</div>
			<div class="pop_btns">
				<div class="close_l" style="text-align: center;">
					<input type="submit" class="btn additem_btn" id="sbtbtn4" onclick="saveSpOrderBill()" value="Save">
					<!-- <button class="btn additem_btn" onclick="closePaymentPopup()" id="cls_btn">Close</button> -->
				</div>				
				<div class="clr"></div>
			</div>
		</div>

	</div>


	<!-- ************************************************* -->
<script type="text/javascript">
function openPaymentPopup(spOrderNo) {
	//alert(spOrderNo)
	document.getElementById("genBill"+spOrderNo).disabled = true;

    //end ajax send this to php page
	   $.getJSON('${getSpOrderBill}', {
		   spOrderNo:spOrderNo,
        ajax : 'true'
    }, function(data) {
 	   if(data!=null)
 		   {
	 		  	var modal = document.getElementById("payment");
	 			modal.style.display = "block";
	 		  	document.getElementById("genBill"+spOrderNo).disabled = false;
	 		   
	 		 	
	 		 	document.getElementById("sp_bill_no").value = data.spOrderNo;  
 			   	 document.getElementById("totalAmtPopup").value = data.spPrice;				
 				 document.getElementById("discPer").value = data.disc; 
 				 var discAmt = data.spPrice*(data.disc/100)
 				 document.getElementById("discAmt").value = discAmt; 
 				 var pableAmt = data.spPrice - discAmt;
 				 document.getElementById("totalPayableAmt").value = pableAmt;
 				 document.getElementById("advAmtPopup").value = data.spAdvance;
 		   }        
 	   		
 	   
    });  
	
	
}

function saveSpOrderBill(){
	
	document.getElementById("sbtbtn4").disabled = true;
	
	var spOrderNo = $('#sp_bill_no').val();
	var billType = $('#billType').val();	
	var cashAmt =  $('#cashAmt').val();
	var cardAmt =  $('#cardAmt').val();
	var epayAmt =  $('#epayAmt').val();
	
	var payType=0;var payTypeFlag=0; var payTypeSplit="0";var msg="";
	if(billType==1){
		payTypeFlag=0;
		payType=1;
	}else if(billType==2) {
		var cardType = $('#cardType option:selected').val();
		if(cardType=="")
			{
				payTypeFlag=1;
			}
		payType=cardType;
		}else if(billType==3)
			{
			var ePayType =  $('#ePayType option:selected').val();
			if(ePayType=="")
			{
				payTypeFlag=1;
			msg="Please Select Pay Type( Card Type Or E-Pay type)";
			}
				payType=ePayType;
			} 
	var payAmt =  $('#payAmt').val() ;
	var frtype =  $('#frtype').val() ;
	var discPer =  $('#discPer').val() ;
	var discAmt =  $('#discAmt').val() ;
	
	var creditBill = 1;
	var single = 1;	
	var flag=0;
	
	if (document.getElementById('creditBillno').checked) {
		creditBill = 2;
	}
	if (document.getElementById('split').checked) {
		single = 2;
		if(cashAmt>0){
			payTypeSplit=",1";
		}
		var cardTypeSplit = $('#cardTypeSplit option:selected').val();
		if(cardTypeSplit=="" && cardAmt>0)
			{
			msg="Please Select Card Type";
			payTypeFlag=1;
			}else if(cardAmt>0)
				{
				payTypeSplit=payTypeSplit+","+cardTypeSplit;
				}
		var ePayTypeSplit =  $('#ePayTypeSplit option:selected').val();
		if(ePayTypeSplit=="" && epayAmt>0)
		{
			msg="Please Select Card & E-pay Type";payTypeFlag=1;
		}else if(epayAmt>0)
		{
			payTypeSplit=payTypeSplit+","+ePayTypeSplit;
		}
	}
	
	if (cashAmt=="") {
		cashAmt=0;
	}
	if (cardAmt=="") {
		cardAmt=0;
	}
	if (epayAmt=="") {
		epayAmt=0;
	}
	if (discPer=="") {
		discPer=0;
	}
	if (discAmt=="") {
		discAmt=0;
	}
	var payRemark = $('#payRemark').val();
	
	  $.getJSON('${saveSpOrderBill}', {
		    spOrderNo : spOrderNo,
		    creditBill : creditBill,
			paymentMode : single,
			billType : billType,
			payType : payType,
			payTypeSplit : payTypeSplit,
			cashAmt : cashAmt,
			cardAmt : cardAmt,
			epayAmt : epayAmt,			
			payAmt : payAmt,
			discPer :discPer,
			discAmt : discAmt,
			remark : payRemark,
      		 ajax : 'true'
   }, function(data) {
	   document.getElementById("sbtbtn4").disabled = false;
	   document.getElementById("genBill"+spOrderNo).disabled = true;
	   if(data)
		   {
		   	document.getElementById("sp_bill_no").value = '';  
		   	 document.getElementById("totalAmtPopup").value = ''; 				
			 document.getElementById("discPer").value = '';  			 
			 document.getElementById("discAmt").value = ''; 
			 document.getElementById("totalPayableAmt").value = ''; 
			 document.getElementById("advAmtPopup").value = ''; 
			 alert("Special Cake Order Saved Successfully")
			 closePaymentPopup();
		   } else{
			   document.getElementById("genBill"+spOrderNo).disabled = false;
		   }       
	   		
	   
   });  
}

function closePaymentPopup() {
	var modal = document.getElementById("payment");
	modal.style.display = "none";	
}
function modeOfPayDivHideShow(value) {
	if (value == 2) {
		$("#modeOfPayDiv").show();
	} else {
		
		$("#modeOfPayDiv").hide();
		 document.getElementById('single').checked = true;
		 changeSplitSingle(1);
		
		
		/*  let element = document.getElementById('billType');
		    element.value = 1; */		    
	}

}

function changeSplitSingle(value) {

	if (value == 2) {
		$("#splitDiv").show();
		$("#singleDiv").hide();
	} else {
		$("#singleDiv").show();
		$("#splitDiv").hide();
	}

}

function onPayTypeChange(type){
	if(type==1){
		$('#cardTypeDiv').hide();
		$('#epayTypeDiv').hide();
	}else
	if(type==2){
		$('#cardTypeDiv').show();
		$('#epayTypeDiv').hide();
		document.getElementById("cardType").value=4;
	}else if(type==3){
		$('#epayTypeDiv').show();
		$('#cardTypeDiv').hide();
		
		document.getElementById("ePayType").value=7;
	}
}
</script>
</body>
</html>
