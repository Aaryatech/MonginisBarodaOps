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
<body onload="hideShowCat()">
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
		<c:url var="getItemOfAdv" value="/getItemOfAdv" />
		<c:url var="getCustBillsForCreditNote"
			value="/getCustBillsForCreditNote" />

		<c:url var="getCustBillDetailsForCreditNote"
			value="/getCustBillDetailsForCreditNote" />




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
				<div class="sidebarright padd_zero">
				
					<div class="order-left">
						<h2 class="pageTitle"><i class="fa fa-credit-card" aria-hidden="true"></i> Sell Credit Note </h2>
					</div>
					<div class="order-right button_left_mob">
						<a href="${pageContext.request.contextPath}/creditNoteHeaderList"><input
							type="button" value="Credit Note List" class="btn additem_btn" style="margin:0;" >
						</a>
					</div>
					

					<form name="frm_search" id="frm_search"
						action="${pageContext.request.contextPath}/addCreditNote"
						method="post">
						<input type="hidden" name="mod_ser" id="mod_ser"
							value="search_result"> <br>
						<div class="colOuter">
							<div class="col-md-1">
								<div class="col1title">
									Customer
								</div>
							</div>
							<div class="col-md-2">
								<select name="cust" id="cust" class="form-control chosen-select"
									required onchange="getBills(this.value)">
									<option value="0">Select Customer</option>


									<c:forEach items="${customerList}" var="customerList">

										<option value="${customerList.custId}"
											style="text-align: left;">${customerList.custName}
											&nbsp;${customerList.phoneNumber}</option>


									</c:forEach>


								</select>
							</div>
							
								<div class="col-md-1">
									<div class="col1title" >
										Bills
									</div>
								</div>
								<div class="col-md-2">
									<!-- class="chosen-select"  -->
									<select name="billno" id="billno"
										data-placeholder="Choose Bill" class="chosen-select"
										style="text-align: left;" tabindex="6" required>

										<option value="0">Select Bill</option>

									</select>
								</div>

							


							
								<div class="col-md-1" >
									<div class="col1title">
										Stockable
									</div>
								</div>
								<div class="col-md-2"
									style="text-align: left; margin-top: 7px;">
									<input type="radio" name="stockable" id="stockable" value="0"
										checked>&nbsp; No &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <input
										type="radio" name="stockable" id="stockable" value="1">&nbsp; Yes
								</div>
							

							
								<div class="col-md-1">
									<div class="col1title" >
										Return %
									</div>
								</div>
								<div class="col-md-1" style="text-align: left; margin-top: 7px;">
									<input type="number" id="returnPer" name="returnPer" value="0"
										min="0" max="100" style="width: 50px; padding:0 5px;"
										oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">


								</div>
							


							<div class="col-md-1">
								<input name="" class="btn additem_btn" value="Search"  style="margin:0;"
									type="button" onclick="getBillDetails()">
							</div>
						</div>



						<input type="text" id="tempDetailId" style="display: none;">

						<!--tabNavigation-->
						<div class="cd-tabs">

							<div class="clearfix"></div>
							
							
							<div class="tableFixHead">
								<table id="table_grid">         
								<thead style="background-color: #f3b5db;">
									<tr class="bgpink">
										<th style="text-align: center; display: none;">Check</th>
										<th style="text-align: center;">Item Name</th>
										<th style="text-align: center;">Rate</th>
										<th style="text-align: center;">Bill Qty</th>
										<th style="text-align: center;">Disc</th>
										<th style="text-align: center;">Qty</th>
										<th style="text-align: center;">Bill Total</th>
										<th style="text-align: center;">Ret %</th>
										<th style="text-align: center;">Taxable Amt</th>
										<th style="text-align: center;">Tax Amt</th>
										<th style="text-align: center;">Cess</th>
										<th style="text-align: center;">Grand Total</th>
									</tr>
								</thead>
								
								<tbody>
								
								</tbody>
								</table>
							</div>
								
						</div>
								<div class="col-md-12" style="text-align: center;">
									<input name="" class="btn additem_btn" value="Save"
										type="submit" id="frmSubmit" style="display: none; text-align: center; margin:0 auto;">
								</div>
					</form>

				</div>

				<br> <br>

			</div>
			<!--tabNavigation-->

			<!--fullGrid-->
		</div>
		<!--rightContainer-->

	</div>
	<!--wrapper-end-->

	<script type="text/javascript">
		function showCustBillForAdvOrder(headId, custId) {
			//alert("hii"+custId);

			$
					.getJSON(
							'${getItemOfAdv}',
							{
								headId : headId,
								custId : custId,
								ajax : 'true'
							},
							function(data) {

								if (data.error == false) {
									window
											.open(
													"${pageContext.request.contextPath}/newcustomerbill/0",
													"_self");

								}

							});

		}
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
		function genBill(spOrderNo) {

			$
					.getJSON('${getSpBill}', {
						spOrderNo : spOrderNo,
						ajax : 'true'
					},
							function(data) {
								if (data == true) {
									alert("Bill Generated Successfully");
									document.getElementById("frm_search")
											.submit();

									document.getElementById("genBill"
											+ spOrderNo).disabled = true;

								}

							});

		}
	</script>
	<script type="text/javascript">
		function deleteSpOrder(spOrderNo) {
			if (confirm("Do you want to Delete this order?") == true) {
				$.getJSON('${deleteSpOrder}', {
					sp_order_no : spOrderNo,
					ajax : 'true',
				}, function(data) {

					if (data.isError == false) {
						document.getElementById("frm_search").submit();

					} else {
						document.getElementById("frm_search").submit();
						//  alert("Failed,Sorry,Your Order Not deleted")
					}
				});
			}
		}
	</script>


	<script>
		function getBills(custId) {
			//alert(custId);
			$.getJSON('${getCustBillsForCreditNote}', {
				custId : custId,
				ajax : 'true'
			},
					function(data) {

						//alert(JSON.stringify(data));

						var len = data.length;

						$('#billno').find('option').remove().end();

						$("#billno").append(
								$("<option align=left; selected></option>")
										.attr("value", 0).text("Select Bill"));

						for (var i = 0; i < len; i++) {

							var billName = data[i].invoiceNo + " - "
									+ data[i].billDate;

							$("#billno").append(
									$("<option align=left;></option>").attr(
											"value", data[i].sellBillNo).text(
											billName));
						}

						$('.chosen-select').trigger('chosen:updated');

					});

		}
	</script>

	<script type="text/javascript">
		function getBillDetails() {
			//alert("hi");

			$('#table_grid td').remove();

			var billNo = $('#billno').val();
			var retPer = $('#returnPer').val();

			if(billNo==0){
				alert("Please Select Bill");
			}else if (retPer == "") {
				alert("Please Enter Return Percent");
			} else if (retPer <= 0) {
				alert("Please Enter Return Percent");
			} else {

				$
						.getJSON(
								'${getCustBillDetailsForCreditNote}',
								{
									sellBillNo : billNo,
									ajax : 'true'
								},
								function(data) {

									//alert(JSON.stringify(data));
									document.getElementById("frmSubmit").style.display = "block";

									if (data == "") {
										alert("No records found !!");
										document.getElementById("frmSubmit").style.display = "none";
									}

									$
											.each(
													data,
													function(key, sellBillData) {

														//alert(JSON.stringify(sellBillData));

														var index = key + 1;

														var tr = $('<tr></tr>');
														//tr.append($('<td></td>').html(key + 1));

														//tr.append($('<td></td>').html('<a  href="" onclick="return custBillPdf('+sellBillData.sellBillNo+',\'' + sellBillData.billType + ');"><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></a>'));

														tr
																.append($(
																		'<td style="text-align:center; display:none;" ></td>')
																		.html(
																				'<input type="checkbox" id="'
																						+ sellBillData.sellBillDetailNo
																						+ '" name="chk" class="detail" value="'
																						+ sellBillData.sellBillDetailNo
																						+ '" onClick="checkboxOperation(this,this.value)">'));

														tr
																.append($(
																		'<td style="text-align:left;"></td>')
																		.html(
																				sellBillData.itemName));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				'<p class="detail" id="rate_'+sellBillData.sellBillDetailNo+'">'
																						+ sellBillData.mrp
																						+ '</p>'));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				'<p class="detail" id="oldQty_'+sellBillData.sellBillDetailNo+'">'
																						+ sellBillData.qty
																						+ '</p>'));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				'<p class="detail" id="discAmt_'+sellBillData.sellBillDetailNo+'">'
																						+ sellBillData.discAmt
																								.toFixed(2)
																						+ '</p>'));

														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				'<input class="detail" type="text" min="0" style="text_align:center; width:70px;" name="qty'
																						+ sellBillData.sellBillDetailNo
																						+ '" id="qty_'
																						+ sellBillData.sellBillDetailNo
																						+ '"  value="0" onKeyup="qtyChange('
																						+ sellBillData.sellBillDetailNo
																						+ ')" >'));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				'<p class="detail" id="billTot_'+sellBillData.sellBillDetailNo+'">0</p>'));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				'<p class="detail" name="ratePer'+sellBillData.sellBillDetailNo+'" id="retPer_'+sellBillData.sellBillDetailNo+'">'
																						+ retPer
																						+ '</p>'));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				'<p class="detail" id="taxable_'+sellBillData.sellBillDetailNo+'">0</p>'));
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				'<p class="detail" id="tax_'+sellBillData.sellBillDetailNo+'">0</p>'));
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				'<p class="detail" id="cess_'+sellBillData.sellBillDetailNo+'">0</p>'));
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				'<p class="detail" id="grandTot_'+sellBillData.sellBillDetailNo+'">0</p>'));

														tr
																.append($(
																		'<td style="text-align:right; display:none;"></td>')
																		.html(
																				'<p class="detail" id="sgstPer_'+sellBillData.sellBillDetailNo+'">'
																						+ sellBillData.sgstPer
																						+ '</p>'));

														tr
																.append($(
																		'<td style="text-align:right; display:none;"></td>')
																		.html(
																				'<p class="detail" id="cgstPer_'+sellBillData.sellBillDetailNo+'">'
																						+ sellBillData.cgstPer
																						+ '</p>'));

														$('#table_grid tbody')
																.append(tr);

													});

								});

			}//else

		}
	</script>


	<script type="text/javascript">
		function checkboxOperation(id, val) {

			if (id.checked) {
				document.getElementById('qty_' + val).readOnly = false;
				document.getElementById("tempDetailId").value = val;
			} else {

				qtyChange1(val);

				document.getElementById('qty_' + val).readOnly = true;
				document.getElementById('qty_' + val).value = 0;
				document.getElementById("tempDetailId").value = 0;

			}

		}
	</script>

	<script type="text/javascript">
		function qtyChange(x) {
			
			// var x = document.getElementsByClassName("detail")[0].id;
			//alert(x);

			//var x = document.getElementById("tempDetailId").value;

			var qty = parseFloat(document.getElementById("qty_" + x).value);
			var oldQty = parseFloat(document.getElementById("oldQty_" + x).innerHTML);

			//alert(qty);
			
			if(isNaN(qty)==true){
				//alert("dsf")
				qty=0;
				document.getElementById("qty_" + x).value=qty;
			}
			
			
			if (qty > oldQty) {
				alert("Invalid Qty");
				document.getElementById("qty_" + x).value = 0;

				qtyChange1(x);

			} else {

				var discAmt = parseFloat(document
						.getElementById("discAmt_" + x).innerHTML);
				var rate = parseFloat(document.getElementById("rate_" + x).innerHTML);
				var retPer = parseFloat(document.getElementById("retPer_" + x).innerHTML);
				var sgstPer = parseFloat(document
						.getElementById("sgstPer_" + x).innerHTML);
				var cgstPer = parseFloat(document
						.getElementById("cgstPer_" + x).innerHTML);

				var billTot = parseFloat((rate - (discAmt / oldQty)) * qty);
				//alert(billTot);

				var tempGrandTot = (billTot * retPer) / 100;

				var taxableAmt = (tempGrandTot * 100)
						/ (100 + sgstPer + cgstPer);
				//alert("Taxable = "+taxableAmt);

				var cgstAmt = taxableAmt * (cgstPer / 100);
				//alert(cgstAmt);
				var sgstAmt = taxableAmt * (sgstPer / 100);

				var taxedAmt = cgstAmt + sgstAmt;

				var grandTotal = taxableAmt + taxedAmt;

				document.getElementById("billTot_" + x).innerHTML = billTot
						.toFixed(2);
				document.getElementById("taxable_" + x).innerHTML = taxableAmt
						.toFixed(2);
				document.getElementById("tax_" + x).innerHTML = taxedAmt
						.toFixed(2);
				document.getElementById("grandTot_" + x).innerHTML = grandTotal
						.toFixed(2);

			}

		}

		function qtyChange1(x) {

			document.getElementById("billTot_" + x).innerHTML = 0;
			document.getElementById("taxable_" + x).innerHTML = 0;
			document.getElementById("tax_" + x).innerHTML = 0;
			document.getElementById("grandTot_" + x).innerHTML = 0;

		}
	</script>



	<!-- chosen JS
		============================================ -->
	<%-- <script
		src="${pageContext.request.contextPath}/resources/dropdownmultiple/chosen.jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/dropdownmultiple/chosen-active.js"></script> --%>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/chosen.jquery.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/init.js"
		type="text/javascript" charset="utf-8"></script>
</body>
</html>
