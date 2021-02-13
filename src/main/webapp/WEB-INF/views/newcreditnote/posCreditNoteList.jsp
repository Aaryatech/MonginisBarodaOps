<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script> --%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<html>
<head>
<style>
table, th, td {
	border: 1px solid #9da88d;
}
</style>


<!--rightNav-->
<!--  -->
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
		<c:url var="getPosCreditNoteHeaderList"
			value="/getPosCreditNoteHeaderList" />





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
				<br>
				<div class="sidebarright">
					<div class="order-left" style="width: 100%">
						
						
						<div class="colOuter">
							<div class="col-md-8"><h2 class="pageTitle">Credit Note List</h2></div>
							
							<div class="col-md-4" style="text-align: right;">
							<a
								href="${pageContext.request.contextPath}/insertCreditNote"><input
								type="button" value="Add Credit Note"
								class="btn btn-info"> </a>
								<br><br> 
							</div>
							
						</div>
						
					</div>

					<br>


					<div class="colOuter">
						<br>
						<div class="col-md-1">
							<div class="col1title">
								<b>Customer</b>
							</div>
						</div>
						<div class="col-md-3">
							<select name="cust" id="cust" class="chosen-select" required>
								<option value="0">Select Customer</option>


								<c:forEach items="${customerList}" var="customerList">

									<option value="${customerList.custId}"
										style="text-align: left;">${customerList.custName}
										&nbsp;${customerList.phoneNumber}</option>


								</c:forEach>


							</select>
						</div>


						<div class="col-md-1">
							<div class="col1title">
								<b>From Date</b>
							</div>
						</div>
						<div class="col-md-2">
							<input id="datepicker" class="texboxitemcode texboxcal"
								autocomplete="off" placeholder="From Date" name="fromDt"
								type="text" value="${todaysDate}">
						</div>

						<div class="col-md-1">
							<div class="col1title">
								<b>To Date</b>
							</div>
						</div>
						<div class="col-md-2">
							<input id="datepicker2" class="texboxitemcode texboxcal"
								autocomplete="off" placeholder="To Date" name="toDt" type="text"
								value="${todaysDate}">
						</div>




						<div class="col-md-2">
							<input name="" class="buttonsaveorder" value="Search"
								type="button" onclick="getBillDetails()">
						</div>
					</div>



					<!--tabNavigation-->
					<div class="cd-tabs">
						<!--tabMenu-->

						<!--tabMenu-->


						<div class="clearfix"></div>


						<div id="table-scroll" class="table-scroll">
							<div id="faux-table" class="faux-table" aria="hidden"></div>
							<div class="table-wrap"
								style="max-height: none; min-height: none;">
								<table id="table_grid" class="main-table">
									<thead>
										<tr class="bgpink">
											<th class="col-md-1" style="text-align: center;">Sr No</th>
											<th class="col-md-2" style="text-align: center;">Crn No.</th>
											<th class="col-md-1" style="text-align: center;">Crn
												Invoice</th>
											<th class="col-sm-1" style="text-align: center;">Bill
												Invoice</th>
											<th class="col-md-1" style="text-align: center;">Date</th>
											<th class="col-md-1" style="text-align: center;">Taxable
												Amt</th>
											<th class="col-md-1" style="text-align: center;">Grand
												Total</th>
											<th class="col-md-1" style="text-align: center;">Action</th>

										</tr>
									</thead>
									<tbody>

									</tbody>

								</table>
							</div>
						</div>


						<div class="col-md-2">
							<input type="button" id="expExcel" class="btn btn-primary"
								value="EXPORT TO Excel" onclick="exportToExcel();"
								style="display: none;">

						</div>

						<br />
					</div>





				</div>

				<br> <br>


			</div>
		</div>

	</div>









	<script type="text/javascript">
		$(document).ready(function() {
			$('#slide').popup({
				focusdelay : 400,
				outline : true,
				vertical : 'top'
			});
		});
	</script>



	<script type="text/javascript">
		
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

	<script type="text/javascript">
		function genPdf() {
			window
					.open('${pageContext.request.contextPath}/pdf/showOrderHistoryPdf');
		}
	</script>

	<script>
		function Print() {
			document.getElementById("expExcel").disabled = false;
		}
	</script>
	<script>
		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled = true;
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
		function getBillDetails() {
			//alert("hi");

			var fromDate = $('#datepicker').val();
			var toDate = $('#datepicker2').val();
			var custId = $('#cust').val();
			//alert("jhgjjhg "+custId);

			if (custId == 0) {
				alert("Please select customer");
			} else {

				$('#table_grid td').remove();

				$
						.getJSON(
								'${getPosCreditNoteHeaderList}',
								{
									fromDate : fromDate,
									toDate : toDate,
									custId : custId,
									ajax : 'true'
								},
								function(data) {

									//alert(JSON.stringify(data));

									if (data == "") {
										alert("No records found !!");
									}

									$
											.each(
													data,
													function(key, crn) {

														//alert(JSON.stringify(sellBillData));

														var index = key + 1;

														var tr = $('<tr></tr>');
														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				key + 1));

														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				crn.crnNo));

														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				crn.crnInvoiceNo));

														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				crn.billInvoice));

														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				crn.crnDate));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				crn.taxableAmt
																						.toFixed(2)));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				crn.grandTotal
																						.toFixed(2)));

														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				'<a  href="" onclick="return custBillPdf('
																						+ crn
																						+ ',\''
																						+ crn
																						+ ');"><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></a>'));

														$('#table_grid tbody')
																.append(tr);

													});

								});
			}

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

</body>
</html>
