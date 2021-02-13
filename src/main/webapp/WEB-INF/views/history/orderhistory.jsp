<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script> --%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<html>
<head>
<style>
table, th, td {
	border: 1px solid #9da88d;
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

<%-- <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Monginis</title>
<link href="${pageContext.request.contextPath}/resources/css/monginis.css" rel="stylesheet" type="text/css"/>
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/feviconicon.png" type="image/x-icon"/> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>

<!--rightNav-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/menuzord.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery("#menuzord").menuzord({
		align:"left"
	});
});
</script> --%>
<!--rightNav-->

<!--selectlistbox-->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.selectlistbox.js"></script> --%>
<script>
	function createByJson() {
		var jsonData = [
				{
					description : 'Choos your payment gateway',
					value : '',
					text : 'Payment Gateway'
				},
				{
					image : '${pageContext.request.contextPath}/resources/images/msdropdown/icons/Amex-56.png',
					description : 'My life. My card...',
					value : 'amex',
					text : 'Amex'
				},
				{
					image : '${pageContext.request.contextPath}/resources/images/msdropdown/icons/Discover-56.png',
					description : 'It pays to Discover...',
					value : 'Discover',
					text : 'Discover'
				},
				{
					image : '${pageContext.request.contextPath}/resources/images/msdropdown/icons/Mastercard-56.png',
					title : 'For everything else...',
					description : 'For everything else...',
					value : 'Mastercard',
					text : 'Mastercard'
				},
				{
					image : '${pageContext.request.contextPath}/resources/images/msdropdown/icons/Cash-56.png',
					description : 'Sorry not available...',
					value : 'cash',
					text : 'Cash on devlivery',
					disabled : true
				},
				{
					image : '${pageContext.request.contextPath}/resources/images/msdropdown/icons/Visa-56.png',
					description : 'All you need...',
					value : 'Visa',
					text : 'Visa'
				},
				{
					image : '${pageContext.request.contextPath}/resources/images/msdropdown/icons/Paypal-56.png',
					description : 'Pay and get paid...',
					value : 'Paypal',
					text : 'Paypal'
				} ];
		$("#byjson").msDropDown({
			byJson : {
				data : jsonData,
				name : 'payments2'
			}
		}).data("dd");
	}
	$(document).ready(function(e) {
		//no use
		try {
			var pages = $("#pages").msDropdown({
				on : {
					change : function(data, ui) {
						var val = data.value;
						if (val != "")
							window.location = val;
					}
				}
			}).data("dd");

			var pagename = document.location.pathname.toString();
			pagename = pagename.split("/");
			pages.setIndexByValue(pagename[pagename.length - 1]);
			$("#ver").html(msBeautify.version.msDropdown);
		} catch (e) {
			//console.log(e);	
		}

		$("#ver").html(msBeautify.version.msDropdown);

		//convert
		$("select").msDropdown({
			roundedBorder : false
		});
		createByJson();
		$("#tech").data("dd");
	});
	function showValue(h) {
		console.log(h.name, h.value);
	}
	$("#tech").change(function() {
		console.log("by jquery: ", this.value);
	})
	//
</script>
<!--selectlistbox-->



<!-- -----------------------------------------CODE FOR MULTIPLE DROPDOWN (CSS)------------------------------------------------------------ -->

<!-- chosen CSS ============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dropdownmultiple/bootstrap-chosen.css">

<!-- ----------------------------------------------------END------------------------------------------------------------ -->

<!-- </head>
<body> -->

<!--datepicker-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#datepicker2").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#datepicker3").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#datepicker4").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#datepicker5").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
</script>
</head>
<body>
	<!--datepicker-->
	<c:url var="getMenus" value="/getMenus" />

	<!--topLeft-nav-->
	<div class="sidebarOuter"></div>
	<!--topLeft-nav-->

	<!--wrapper-start-->
	<div class="wrapper">

		<!--topHeader-->
		<c:url var="findAddOnRate" value="/getAddOnRate" />
		<c:url var="findItemsByCatId" value="/getFlavourBySpfId" />
		<c:url var="findAllMenus" value="/getAllTypes" />
		<c:url var="getSpBill" value="/getSpBill" />
		<c:url var="deleteSpOrder" value="/deleteSpOrder" />

<c:url var="getSpOrderBill" value="/getSpOrderBill" />
<c:url var="saveSpOrderBill" value="/saveSpOrderBill" />
		<jsp:include page="/WEB-INF/views/include/logo.jsp"></jsp:include>


		<!--topHeader-->

		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2">

				<!--leftNav-->

				<jsp:include page="/WEB-INF/views/include/left.jsp">
					<jsp:param name="myMenu" value="${menuList}" />

				</jsp:include>


				<!--leftNav-->

				<!--rightSidebar-->
				<div class="sidebarright">
					<div class="order-left">
						<h2 class="pageTitle"><i class="fa fa-file-text-o"></i> Order History</h2>
						<!--<h3 class="pageTitle2">Order Date : 22-02-2017 </h3>-->
					</div>

					<form name="frm_search" id="frm_search" method="post"
						action="itemHistory">
						<input type="hidden" name="mod_ser" id="mod_ser"
							value="search_result">
						<div class="colOuter">
							<div class="col-md-1">
								<div class="col1title">Order</div>
							</div>
							<div class="col-md-2">
								<select name="orderType" id="orderType" class="form-control"
									required onchange="getMenus(this.value)">
									<c:choose>
										<c:when test="${orderType==1}">
											<option value="1" selected>Regular Order</option>
											<option value="2">Sp Order</option>
										</c:when>
										<c:when test="${orderType==2}">
											<option value="1">Regular Order</option>
											<option value="2" selected>Sp Order</option>
										</c:when>
										<c:otherwise>
											<option value="1">Regular Order</option>
											<option value="2">Sp Order</option>
										</c:otherwise>
									</c:choose>

								</select>
							</div>

							<div class="col-md-1">
								<div class="col1title">Menu</div>
							</div>
							<div class="col-md-3">
								<!-- class="chosen-select"  -->
								<select name="catId" id="catId"
									data-placeholder="Choose Menus..." class="chosen-select"
									style="text-align: left;" tabindex="6" required>
									<option value="-1" style="text-align: left;">ALL</option>

									<%-- 	<c:forEach items="${catList}" var="catList">
									<c:choose>
										<c:when test="${catId==catList.catId}">

											<option value="${catList.catId}" style="text-align:left;" selected>${catList.catName}</option>
										</c:when>
										<c:when test="${catId!=catList.catId}">

											<option value="${catList.catId}" style="text-align:left;">${catList.catName}</option>
										</c:when>
									</c:choose>
								</c:forEach> --%>
									<c:choose>
										<c:when test="${orderType!=0}">
											<c:forEach items="${menuListSelected}" var="menuListSelected">
												<option value="${menuListSelected.menuId}"
													style="text-align: left;" selected>${menuListSelected.menuTitle}</option>
											</c:forEach>
											<c:forEach items="${menuListNotSelected}"
												var="menuListNotSelected">
												<option value="${menuListNotSelected.menuId}"
													style="text-align: left;">${menuListNotSelected.menuTitle}</option>
											</c:forEach>
										</c:when>

										<c:otherwise>
											<c:forEach items="${menuListNotSelected}"
												var="menuListNotSelected">
												<option value="${menuListNotSelected.menuId}"
													style="text-align: left;">${menuListNotSelected.menuTitle}</option>
											</c:forEach>
										</c:otherwise>
									</c:choose>

									<%-- <c:choose>
										<c:when test="${catId==42}">
								<option value="42" selected style="text-align:left;">Regular Cake as Special Order</option>
								<option value="80" style="text-align:left;">Special Savories Order</option>
								</c:when>
								<c:when test="${catId==80}">
								<option value="42" style="text-align:left;">Regular Cake as Special Order</option>
								<option value="80" selected style="text-align:left;">Special Savories Order</option>
								</c:when>
								<c:otherwise>
								<option value="42" style="text-align:left;">Regular Cake as Special Order</option>
								<option value="80" style="text-align:left;">Special Savories Order</option>
								</c:otherwise>
								</c:choose> --%>
								</select>
							</div>
							<!-- 	</div> -->

							<!-- <div class="colOuter"> -->
							<div class="col-md-1">
								<div class="col1title">Del Date</div>
							</div>
							<div class="col-md-2">
								<input id="datepicker" class="texboxitemcode texboxcal"
									autocomplete="off" placeholder="Delivery Date"
									name="datepicker" id="datepicker" type="text" value="${spDeliveryDt}">
							</div>
							<!-- </div> -->

							<!-- <div class="colOuter">
 -->
							<div class="col-md-1">
								<input name="" class="buttonsaveorder" value="Search"
									type="submit" onclick="Print()">
							</div>
						</div>
					</form>

					<!--tabNavigation-->
					<div class="cd-tabs">
						<!--tabMenu-->

						<!--tabMenu-->


						<c:set var="selectedMenu" scope="session" value="${selectedMenu}" />

						<c:choose>
							<c:when test="${orderType==1}">

								<div class="clearfix"></div>


								<div id="table-scroll" class="table-scroll">
									<div id="faux-table" class="faux-table" aria="hidden"></div>
									<div class="table-wrap">
										<table id="table_grid" class="main-table">
											<thead>
												<tr class="bgpink">
													<th class="col-md-1" style="text-align: center;">Sr No</th>
													<th class="col-md-2" style="text-align: center;">Item
														Name</th>
													<th class="col-md-1" style="text-align: center;">MRP</th>
													<th class="col-sm-1" style="text-align: center;">Quantity</th>
													<c:choose>
														<c:when test="${catId!=42 && catId!=80}">
															<th class="col-md-1" style="text-align: center;">Rate</th>
														</c:when>
													</c:choose>
													<th class="col-md-1" style="text-align: center;">Total</th>
													<c:choose>
														<c:when test="${catId==42||catId==80}">
															<th class="col-md-1" style="text-align: center;">Order
																Memo</th>
														</c:when>
													</c:choose>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${catId==42||catId==80}">
														<c:forEach items="${orderHistory}" var="orderList"
															varStatus="count">

															<tr>
																<td class="col-md-1">${count.index+1}</td>
																<td class="col-md-2"><c:out
																		value="${orderList.itemName}" /></td>
																<td class="col-md-1" style="text-align: right;"><c:out
																		value="${orderList.rate}" /></td>
																<td style="text-align: center;" class="col-sm-1"><c:out
																		value="${orderList.qty}" /></td>

																<td class="col-md-1" style="text-align: right;"><fmt:formatNumber
																		type="number" maxFractionDigits="2"
																		minFractionDigits="2" groupingUsed="false"
																		value="${orderList.qty * orderList.rate}" /></td>
																<td class="col-md-1" style="text-align: center;"><a
																	href="${pageContext.request.contextPath}/showRegCakeOrderHisPDF/${orderList.rspId}"
																	target="_blank"><abbr title="PDF"><i
																			class="fa fa-file-pdf-o"></i></abbr></a></td>

															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>

														<c:forEach items="${orderHistory}" var="orderList"
															varStatus="count">

															<tr>
																<td class="col-md-1">${count.index+1}</td>
																<td class="col-md-2"><c:out
																		value="${orderList.itemName}" /></td>
																<td class="col-md-1" style="text-align: right;"><c:out
																		value="${orderList.orderMrp}" /></td>
																<td style="text-align: center;" class="col-sm-1"><c:out
																		value="${orderList.orderQty}" /></td>
																<td class="col-md-1" style="text-align: right;"><fmt:formatNumber
																		type="number" maxFractionDigits="2"
																		minFractionDigits="2" groupingUsed="false"
																		value="${orderList.orderRate}" />
																<td class="col-md-1" style="text-align: right;"><fmt:formatNumber
																		type="number" maxFractionDigits="2"
																		minFractionDigits="2" groupingUsed="false"
																		value="${orderList.orderQty * orderList.orderRate}" />
																</td>

															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</tbody>

										</table>
									</div>
								</div>



								<br />
							</c:when>
							<%--  <c:when test="${selectedMenu.mainCatId !='5'}">
       
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr class="bgpink">
    <td style="width:130px;">Type</td>
    <td style="width:130px;">Item Code</td>
    <td>Item Name</td>
    <td>MRP</td>
    <td>Quantity</td>
    <td>Rate</td>
    <td>Total</td>
  </tr>

 <c:forEach items="${orderHistory}" var="orderList"> 
  <tr>
    <td><c:out value="${orderList.orderType}"/></td>
    <td><c:out value="${orderList.itemId}"/></td>
    <td><c:out value="${orderList.itemName}"/></td>
    <td><c:out value="${orderList.orderMrp}"/></td>
    <td><c:out value="${orderList.orderQty}"/></td>
    <td><c:out value="${orderList.orderRate}"/></td>
    <td><c:out value="00"/></td>
  </tr>
  </c:forEach>   
  
 
  

</table>
        <br />
    </c:when>     --%>
							<c:otherwise>
								<div class="clearfix"></div>
								<div class="table-wrap">

									<div id="table-scroll">
										<!-- class="table-scroll"> -->
										<div id="faux-table" aria="hidden">
											<!-- class="faux-table1" -->
										</div>
										<!-- 					<div class="table-wrap">
 -->
										<table id="table_grid" class="responsive-table">
											<!-- class="main-table" -->
											<thead>
												<tr class="bgpink">
													<th class="col-md-1" style="text-align: center;">Sr No</th>
													<th class="col-md-2" style="text-align: center;">Item
														Name</th>
													<th class="col-md-1" style="text-align: center;">Delivery
														Date</th>
													<th class="col-md-1" style="text-align: center;">Flavour</th>
													<th class="col-md-1" style="text-align: center;">Message</th>
													<th class="col-md-1" style="text-align: center;">Instructions</th>

													<th class="col-md-1" style="text-align: center;">Weight</th>
													<!-- <th class="col-md-1"style="text-align: center;">Rate</th> -->
													<!-- 	<th class="col-md-1"style="text-align: center;">Add On Rate</th> -->
													<th class="col-md-1" style="text-align: center;">Total</th>
													<th class="col-md-1" style="text-align: center;">Advance</th>
													<th class="col-md-1" style="text-align: center;">Remaining</th>
													<th class="col-md-1" style="text-align: center;">Memo
														& Bill</th>

												</tr>
											</thead>
											<tbody>
												<c:forEach items="${orderHistory}" var="orderList"
													varStatus="count">
													<tr>
														<td class="col-md-1">${count.index+1}<c:choose>
																<c:when test="${fn:length(orderList.spBookForMobNo)==1}">
																	<%-- <button class="btn btn-info" value="Generate"
																		id="genBill${orderList.spOrderNo}"
																		onclick="genBill(${orderList.spOrderNo})">Generate</button> --%>
																	<button class="btn btn-info" value="Generate"
																		id="genBill${orderList.spOrderNo}"
																		onclick="openPaymentPopup(${orderList.spOrderNo})">Generate</button>
																</c:when>
																<c:otherwise>

																</c:otherwise>
															</c:choose>
														</td>
														<td class="col-md-2">&nbsp;&nbsp;&nbsp;&nbsp; <c:out
																value="${orderList.spName}" /> <c:choose>
																<c:when test="${orderList.isBillGenerated==0}">
												&nbsp;&nbsp;<a href="editSpOrder/${orderList.spOrderNo}"><span
																		class="fa fa-pencil"></span></a>&nbsp;&nbsp;<a href="#"
																		onclick="deleteSpOrder(${orderList.spOrderNo})"><span
																		class="fa fa-trash"></span></a>
																</c:when>
																<c:otherwise>

																</c:otherwise>
															</c:choose>
														</td>
														<td class="col-md-1"><c:out
																value="${orderList.spDeliveryDate}" /></td>
														<td class="col-md-1"><c:out
																value="${orderList.spfName}" /></td>
														<td class="col-md-1" style="font-size: 14px;"><c:out
																value="${orderList.spEvents} - ${orderList.spEventsName}" /></td>
														<c:set var="price"
															value="${orderList.spGrandTotal-orderList.spTotalAddRate}"></c:set>
														<td class="col-md-1" style="font-size: 14px;"><c:out
																value="${orderList.spInstructions}" /></td>

														<td class="col-md-1" style="text-align: right;"><c:out
																value="${orderList.spSelectedWeight}" /></td>
														<%-- 	<td class="col-md-1" style="text-align: right;"><fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits = "2"  groupingUsed = "false" value = "${price}" /></td> --%>
														<%-- <td class="col-md-1"style="text-align: right;"><c:out
														value="${orderList.spTotalAddRate}" /></td> --%>
														<td class="col-md-1" style="text-align: right;"><fmt:formatNumber
																type="number" maxFractionDigits="2"
																minFractionDigits="2" groupingUsed="false"
																value="${orderList.spGrandTotal}" /></td>
														<td class="col-md-1" style="text-align: right;"><c:out
																value="${orderList.spAdvance}" /></td>
														<td class="col-md-1" style="text-align: right;"><fmt:formatNumber
																type="number" maxFractionDigits="2"
																minFractionDigits="2" groupingUsed="false"
																value="${orderList.spGrandTotal-orderList.spAdvance}" /></td>
														<td class="col-md-1" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<a
															href="${pageContext.request.contextPath}/showSpCakeOrderHisPDF/${orderList.spOrderNo}"
															target="_blank"> <abbr title="Order Memo"><i
																	class="fa fa-file-pdf-o"></i></abbr></a> &nbsp;&nbsp;&nbsp;&nbsp;
															<c:choose>
																<c:when test="${fn:length(orderList.spBookForMobNo)>1}">
																	<a
																		href="${pageContext.request.contextPath}/printSpCkBill/${orderList.spOrderNo}"
																		target="_blank"> <abbr title="Bill"><i
																			class="fa fa-file-pdf-o"></i></abbr></a>
																</c:when>
															</c:choose>

														</td>
													</tr>
												</c:forEach>

											</tbody>


										</table>
									</div>

								</div>
								<br />
							</c:otherwise>
						</c:choose>



					</div>

				</div>
				<div class="col-md-12">
					<input type="button" id="expExcel" class="btn additem_btn"
						value="EXPORT TO Excel" onclick="exportToExcel();">
					
					<button class="btn additem_btn" value="PDF" id="PDFButton"
						onclick="genPdf()">PDF</button>
				</div>
				<!--tab1-->

				<!--tab2-->

				<!--tab2-->

				<!--tab3-->

				<!--tab4-->
				</ul>
			</div>
			<!--tabNavigation-->

			<!--<div class="order-btn"><a href="#" class="saveOrder">SAVE ORDER</a></div>-->
			<!-- <div class="order-btn textcenter">
<a href="http://monginisaurangabad.com/index.php/dashboard/order_export?sel_group=1&sel_date=2017-09-05" class="buttonsaveorder">EXPORT TO EXCEL</a>
<input name="" class="buttonsaveorder" value="EXPORT TO EXCEL" type="button">
</div>  -->


		</div>
		<!--rightSidebar-->

	</div>
	<!--fullGrid-->
	</div>
	<!--rightContainer-->

	</div>
	<!--wrapper-end-->

	<!--easyTabs-->
	<!--easyTabs-->
	<!--easyTabs-->
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

	<script type="text/javascript">
function genPdf()
{		
	var delDate = $("#datepicker").val();	
	window.open('${pageContext.request.contextPath}/pdf/showOrderHistoryPdf/'+delDate);
}

</script>

	<script>
function Print(){
 document.getElementById("expExcel").disabled=false;
}
</script>
	<script>
function exportToExcel()
{
	 
	window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled=true;
}
</script>
	<script>

(function() {
  var fauxTable = document.getElementById("faux-table");
  var mainTable = document.getElementById("table_grid");
  var clonedElement = table_grid.cloneNode(true);
  var clonedElement2 = table_grid.cloneNode(true);
  clonedElement.id = "";
  clonedElement2.id = "";
  fauxTable.appendChild(clonedElement);
  fauxTable.appendChild(clonedElement2);
});


	</script>
	<script type="text/javascript">
	function genBill(spOrderNo)
	{
		document.getElementById("genBill"+spOrderNo).disabled = true;
		
		   $.getJSON('${getSpBill}', {
			   spOrderNo:spOrderNo,
               ajax : 'true'
           }, function(data) {
        	   if(data==true)
        		   {
        		   alert("Bill Generated Successfully");
        		   document.getElementById("frm_search").submit();

        		   

        		   }else{
        			   document.getElementById("genBill"+spOrderNo).disabled = false;
        		   }
        	   
           });
		
	}
    </script>
	<script type="text/javascript">
		function deleteSpOrder(spOrderNo) {
			if (confirm("Do you want to Delete this order?") == true) {
				$.getJSON(
								'${deleteSpOrder}',
								{
									sp_order_no : spOrderNo,
									ajax : 'true',
								},
								function(data) {
								
                                   if(data.isError==false)
                                	   {
                            		   document.getElementById("frm_search").submit();

                                	   }else
                                		   {
                                		   document.getElementById("frm_search").submit();
                                		 //  alert("Failed,Sorry,Your Order Not deleted")
                                		   }
								});
			}
		}
	</script>
	<script>
	function getMenus(type)
	{
	
		                $.getJSON('${getMenus}', {
		                	type : type,
		                    ajax : 'true'
		                }, function(data) {
		                
		                    var len = data.length;

							$('#catId')
						    .find('option')
						    .remove()
						    .end()
						 $("#catId").append($("<option align=left;></option>").attr( "value",-1).text("ALL"));
		                    for ( var i = 0; i < len; i++) {
		                            
		                                
		                        $("#catId").append(
		                                $("<option align=left;></option>").attr(
		                                    "value", data[i].menuId).text(data[i].menuTitle)
		                            );
		                    }

		                    $('.chosen-select').trigger('chosen:updated');

		                });
		          
	}
	
	</script>
	<%-- 

    <!--Require for dropdown multiple jquery
		============================================ -->
    <script src="${pageContext.request.contextPath}/resources/dropdownmultiple/jquery-1.12.4.min.js"></script>
   --%>
	<!-- chosen JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/resources/dropdownmultiple/chosen.jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/dropdownmultiple/chosen-active.js"></script>
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
