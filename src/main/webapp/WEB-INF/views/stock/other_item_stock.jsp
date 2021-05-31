

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<style>
table, th, td {
	border: 1px solid #9da88d;
}
</style>
<style>
.alert1 {
	padding: 10px;
	background-color: #f44336;
	color: white;
}

.closebtn {
	margin-left: 25px;
	color: white;
	font-weight: bold;
	float: right;
	font-size: 18px;
	line-height: 10px;
	cursor: pointer;
	transition: 0.3s;
}

.closebtn:hover {
	color: black;
}
</style>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loader.css">
!--datepicker-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#fromdatepicker").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#todatepicker").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
</script>
<!--datepicker-->


<c:url var="getOtherStock" value="/getOtherStock"></c:url>

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

			<!--leftNav-->

			<jsp:include page="/WEB-INF/views/include/left.jsp">
				<jsp:param name="myMenu" value="${menuList}" />
			</jsp:include>


			<!--leftNav-->
		

			<!--rightSidebar-->
			<div class="sidebarright">
			
				<div class="row_one">
					<div class="history_l"><h2 class="pageTitle"><i class="fa fa-file-pdf-o "></i> Other Item Stock Details </h2></div>
					<div class="history_r"></div>
					<div class="clr"></div>
				</div>
				
				<div class="single_frm">
					<div class="form_one">
						<div class="view_lft">View Option</div>
						<div class="view_frm">
							<select name="selectStock" class="form-control chosen"
							tabindex="6" id="selectStock" onchange="showDiv(this)" required>

							<option value="-1">Select Option</option>
							<option value="1" id="currentStock">Get Current Stock</option>

							<option value="3" id="dateStock">Stock Between Dates</option>

						</select>
						</div>
					</div>
					
					<div class="button_one">
						<div id="crnt_stk_btn">
					<div class="button_stock">
						<input name="search_stock" class="btn additem_btn" value="Search"
							type="button" onclick="searchStock()" style="margin:0;">
					</div>

					<div class="button_stock">
						<button type="button" class="btn additem_btn" id='pdf' style="margin:0;"
							onclick="genPdf()" disabled >PDF</button>
					</div>
					 <div class="month_txt">
						<b>Month: ${monthName}/${year}</b>
			     	</div>
					</div>
					</div>
					
					
					<div class="colOuter_bx" style="display: none" id=select_date>
						
					<div class="form_one date">
						<div class="view_lft">From Date</div>
						<div class="view_frm">
							<input id="fromdatepicker" class="texboxitemcode texboxcal"
							autocomplete="off" placeholder="From Date" name="from_datepicker"
							type="text">
						</div>
					</div>
					
					<div class="form_one date">
						<div class="view_lft">To Date</div>
						<div class="view_frm">
							<input id="todatepicker" class="texboxitemcode texboxcal"
							autocomplete="off" placeholder="To Date" name="to_datepicker"
							type="text">
						</div>
					</div>	
					
					<div class="button_stock">
						<input name="search_stock" class="btn additem_btn" value="Search"
							type="button" onclick="searchStock()" style="margin:0 10px; float: left;">
							
							<button type="button" class="btn additem_btn" id='date_pdf'
							onclick="genPdf()" disabled style="margin:0; float: left;">PDF</button>
					</div>
						
					
					</div>
					
				</div>
		
				
				



				<div class="row">
					<div class="col-md-12">
						<!--table-->
						<form action="otherItemMonthEndProcess" method="POST" id="otherItemStock">
							<div class="clearfix"></div>
							<div class="col-md-10" id="loader" style="display: none">
				

						<div align="center" >

							<span>
								<h4>
									<font color="#343690">Loading</font>
								</h4>
							</span> <span class="l-1"></span> <span class="l-2"></span> <span
								class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
							<span class="l-6"></span>
						</div>
				</div>

			
							<label for="search" class="col-md-3" id="search" style="float: right; "> <i
								class="fa fa-search" ></i> <input
								type="text" id="myInput" onkeyup="myFunction()"
								style="border-radius: 25px;" placeholder="Search items by name"
								title="Type item name Or Code">
							</label>


							<div id="table-scroll">
								
								<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center;">Item Code</th>
			<th style="text-align: center;">Item Name</th>
			<th style="text-align: center;">Opening Stock</th>
			<th style="text-align: center;">Purchase Qty</th>
			<th style="text-align: center;">Sale Qty</th>
			<th style="text-align: center;">Damage Qty</th>
			<th style="text-align: center;">Current Stock</th>
		</tr>
	</thead>
	
	<tbody>
	
	</tbody>
	</table>
</div>

							</div>
							
							
							<div class="button_row_btm">
								<div class="button_left">
									<input type="button" id="expExcel" class="btn additem_btn" style="margin:0;"
									value="EXPORT TO Excel" onclick="exportToExcel();" disabled="disabled">
								</div>
								<div class="button_right" id="monthEnd" style="display: none;">
									<input name="" class="buttonsaveorder" value="Month End" type="submit">
								</div>
								<div class="clr"></div>
							</div>
							
						</form>
					</div>
				</div>

			</div>
		</div>

		<!--rightSidebar-->

	</div>
	<!--fullGrid-->
</div>
<!--rightContainer-->

<!--wrapper-end-->

<!--easyTabs-->
<!--easyTabs-->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<!--easyTabs-->

<script>
var form = document.getElementById('otherItemStock');
form.onsubmit = function () {
    // this method is cancelled if window.confirm returns false
    return window.confirm('Are you sure that you want to submit this form?');
}
</script>
<!-- Select Only Month and Year -->
<script>
	$(document)
			.ready(
					function() {
						$('#txtDate')
								.datepicker(
										{
											changeMonth : true,
											changeYear : true,
											dateFormat : 'MM yy',

											onClose : function() {
												var iMonth = $(
														"#ui-datepicker-div .ui-datepicker-month :selected")
														.val();
												var iYear = $(
														"#ui-datepicker-div .ui-datepicker-year :selected")
														.val();
												$(this).datepicker(
														'setDate',
														new Date(iYear, iMonth,
																1));
											},

											beforeShow : function() {
												if ((selDate = $(this).val()).length > 0) {
													iYear = selDate.substring(
															selDate.length - 4,
															selDate.length);
													iMonth = jQuery
															.inArray(
																	selDate
																			.substring(
																					0,
																					selDate.length - 5),
																	$(this)
																			.datepicker(
																					'option',
																					'monthNames'));
													$(this).datepicker(
															'option',
															'defaultDate',
															new Date(iYear,
																	iMonth, 1));
													$(this).datepicker(
															'setDate',
															new Date(iYear,
																	iMonth, 1));
												}
											}
										});
					});
</script>

<script>
	$(document)
			.ready(
					function() {
						$('#txtDateto')
								.datepicker(
										{
											changeMonth : true,
											changeYear : true,
											dateFormat : 'MM yy',

											onClose : function() {
												var iMonth = $(
														"#ui-datepicker-div .ui-datepicker-month :selected")
														.val();
												var iYear = $(
														"#ui-datepicker-div .ui-datepicker-year :selected")
														.val();
												$(this).datepicker(
														'setDate',
														new Date(iYear, iMonth,
																1));
											},

											beforeShow : function() {
												if ((selDate = $(this).val()).length > 0) {
													iYear = selDate.substring(
															selDate.length - 4,
															selDate.length);
													iMonth = jQuery
															.inArray(
																	selDate
																			.substring(
																					0,
																					selDate.length - 5),
																	$(this)
																			.datepicker(
																					'option',
																					'monthNames'));
													$(this).datepicker(
															'option',
															'defaultDate',
															new Date(iYear,
																	iMonth, 1));
													$(this).datepicker(
															'setDate',
															new Date(iYear,
																	iMonth, 1));
												}
											}
										});
					});
</script>
<script>
	function showDiv(elem) {
		//alert(elem.value);
		if (elem.value == 1) {
			//document.getElementById('select_month_year').style = "display:none";
			document.getElementById('select_date').style = "display:none";
			document.getElementById('monthEnd').style = "display:none";
			document.getElementById('crnt_stk_btn').style.display = "block";
		} else if (elem.value == 3) {
			//document.getElementById('select_month_year').style = "display:none";
			document.getElementById('select_date').style.display = "block";			
			document.getElementById('crnt_stk_btn').style = "display:none";			
			document.getElementById('monthEnd').style = "display:none";

		}
	}
</script>

<script type="text/javascript">
	function searchStock() {

		$('#loader').show();

		var isMonthClose = ${isMonthEndAppli};
		//alert("close " +isMonthClose);

		var selectedStockOption = $("#selectStock").val();
		//	alert("selectedStockOption"+selectedStockOption);
		var selectedFromDate = $("#fromdatepicker").val();
		var selectedToDate = $("#todatepicker").val();

		//document.getElementById('monthEnd').style.display = "block";

		$
				.getJSON(
						'${getOtherStock}',
						{
							show_option : selectedStockOption,
							fromDate : selectedFromDate,
							toDate : selectedToDate,
							ajax : 'true'
						},
						function(data) {

							$('#loader').hide();
							var len = data.length;
							//alert(len);					
							$('#table_grid td').remove();

							if (isMonthClose == 1 && selectedStockOption == 1)

								document.getElementById('monthEnd').style= "display:block;float:right;";

							//alert(isMonthClose+ "month close");			
							//alert(data.monthClosed);	alert(selectedStockOption);

							//	alert(data);
							if (data != null) {

								 
								  document.getElementById("expExcel").disabled=false;
								document.getElementById("pdf").disabled = false;
								document.getElementById("date_pdf").disabled = false;

							}
							$
									.each(
											data,
											function(key, item) {
												//alert(JSON.stringify(item));
												var tr = $('<tr class=bgpink></tr>');
												var curStock = (parseFloat(item.openingStock) + parseFloat(item.purchaseQty))
														- (parseFloat(item.sellQty));//+parseFloat(item.damagedStock)
												tr
														.append($(
																'<td class="col-md-1"></td>')
																.html(
																		item.itemId
																				+ '<input type="hidden" id="currStk'+item.id+'" value='+curStock+'  />'));
												tr
														.append($(
																'<td class="col-md-1"></td>')
																.html(
																		item.itemName));
												tr
														.append($(
																'<td class="col-md-1"></td>')
																.html(
																		item.openingStock));
												tr
														.append($(
																'<td class="col-md-1"></td>')
																.html(
																		item.purchaseQty));
												tr
														.append($(
																'<td class="col-md-1"></td>')
																.html(
																		item.sellQty));

												if (isMonthClose == 0) {
													tr
															.append($('<td class="col-md-1"> <input type="text" readonly min=0 style="width:80px;text-align:center;"  onchange= updateStockDiff('
																	+ item.id
																	+ ','
																	+ curStock
																	+ ')  id=damagedStock'
																	+ item.id
																	+ ' name=damagedStock'
																	+ item.id
																	+ ' value = '
																	+ item.damagedStock
																	+ '   ></td>'));
												} else {

													tr
															.append($('<td class="col-md-1"> <input type=text min=0 style="width:80px;text-align:center;"   onchange= updateStockDiff('
																	+ item.id
																	+ ','
																	+ curStock
																	+ ')  id=damagedStock'
																	+ item.id
																	+ ' name=damagedStock'
																	+ item.id
																	+ ' value = '
																	+ item.damagedStock
																	+ '><input type="hidden" id="currStk'+item.id+'" value='+curStock+'  /></td>'));
												}
												//	tr.append($('<td class="col-md-1"></td>').html(item.damagedStock));

												tr
														.append($(
																'<td class="col-md-1" id="stockDiff'+item.id+'"></td>')
																.html(curStock));

												$('#table_grid tbody').append(
														tr);

											})
						});
	}
</script>

<script type="text/javascript">
	function updateStockDiff(id, currentStock) {

		var physicalStockQty = $("#damagedStock" + id).val();
		var oldDiff = $('#stockDiff' + id).val();
		var currStk = $('#currStk' + id).val();
		var stockDiff = 0;

		if (currentStock >= physicalStockQty) {

			stockDiff = currentStock - physicalStockQty;
			$('#stockDiff' + id).html(stockDiff);
		} else {

			// stockDiff =physicalStockQty - currentStock ;
			alert("You can not enter damaged qty greator than current stock!!");

			document.getElementById('damagedStock' + id).value = 0;
			$('#stockDiff' + id).html(currStk);
		}

	}
</script>

<script>
	/*
	//  jquery equivalent
	jQuery(document).ready(function() {
	jQuery(".main-table").clone(true).appendTo('#table-scroll .faux-table').addClass('clone');
	jQuery(".main-table.clone").clone(true).appendTo('#table-scroll .faux-table').addClass('clone2'); 
	});
	 */
	(function() {
		var fauxTable = document.getElementById("faux-table");
		var mainTable = document.getElementById("table_grid");
		var clonedElement = table_grid.cloneNode(true);
		var clonedElement2 = table_grid.cloneNode(true);
		clonedElement.id = "";
		clonedElement2.id = "";
		fauxTable.appendChild(clonedElement);
		fauxTable.appendChild(clonedElement2);
	})();
</script>
<script>
	function myFunction() {
		var input, filter, table, tr, td, td1, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("table_grid");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[1];
			td1 = tr[i].getElementsByTagName("td")[0];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
</script>

<script>
	function genPdf() {
		//alert("Inside Gen Pdf ");

		// window.open('${pageContext.request.contextPath}/pdf?reportURL=pdf/getGrnPdf/'+fromDate+'/'+'/'+toDate+'/'+headerId+'/'+1+'/'+type);
		var fromDate = document.getElementById("fromdatepicker").value;
		var toDate = document.getElementById("todatepicker").value;
		
		if(fromDate!=null && fromDate!="" && toDate!=null && toDate!=""){		
			window.open('${pageContext.request.contextPath}/getOtherItemStockPdf/'+ fromDate + '/' + toDate);
		}else{
			
			window.open('${pageContext.request.contextPath}/getOtherItemStockPdf');
		}

	}
	
	function exportToExcel() {

		window.open("${pageContext.request.contextPath}/exportToExcel");
		document.getElementById("expExcel").disabled = true;
	}
</script>

</body>

</html>