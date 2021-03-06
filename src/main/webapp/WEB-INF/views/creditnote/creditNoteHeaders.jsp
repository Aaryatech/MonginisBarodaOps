<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<style>
table, th, td {
	border: 1px solid #9da88d;
}
</style>

<!--datepicker-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#todatepicker").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#fromdatepicker").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
</script>
<!--datepicker-->

<c:url var="getHeaders" value="/getHeaders" />
<div class="sidebarOuter"></div>

<div class="wrapper">

	<!--topHeader-->

	<jsp:include page="/WEB-INF/views/include/logo.jsp">
		<jsp:param name="frDetails" value="${frDetails}" />

	</jsp:include>

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

			<!-- Place Actual content of page inside this div -->
			<div class="sidebarright">


				<div class="row">
					<div class="col-md-12">
						<h2 class="pageTitle"><i class="fa fa-pie-chart" aria-hidden="true"></i> Credit Note Report</h2>
					</div>
				</div>

				<div class="row">
					<form action="" class="form-horizontal" method="get"
						id="validation-form">
						
						<div class="form-quarter">
							<div class="form_text">From</div>
							<div class="form_input">
								<input id="fromdatepicker" autocomplete="off"
								class="texboxitemcode texboxcal" placeholder="DD-MM-YYYY"
								name="fromDate" type="text">
							</div>
						</div>
						
						<div class="form-quarter">
							<div class="form_text">To</div>
							<div class="form_input">
								<input id="todatepicker" autocomplete="off"
								class="texboxitemcode texboxcal" placeholder="DD-MM-YYYY"
								name="toDate" type="text">
							</div>
						</div>
					
					<div class="form-quarter center">
							<input type="button" value="Search" onclick="searchReport()"
								class="btn additem_btn" style="margin: 0;">
						</div>	
						
						
						
					</form>

				</div>

				<div class="row">
					<div class="clearfix"></div>


					<div id="table-scroll">
						
						<div>
							<table id="table1" class="responsive-table" border="1">
								<thead>
									<tr class="bgpink">

										<th style=" white-space: nowrap;"><input type="checkbox" onClick="selectBillNo(this)" /></th>
										<th style="text-align: center; white-space: nowrap;">Sr No.</th>
										<th style="text-align: center; white-space: nowrap;">Date</th>
										<th style="text-align: center; white-space: nowrap;">CRN No.</th>
										<th style="text-align: center; white-space: nowrap;">Invoice No.
										</th>
										<!-- <th class="col-md-3" style="text-align: center;">Franchise</th>
										<th class="col-md-1" style="text-align: center;">Taxable
											Amt</th>
										<th class="col-md-1" style="text-align: center;">Tax Amt</th> -->
										<th style="text-align: center; white-space: nowrap;">Amount</th>
										<th style="text-align: center; white-space: nowrap;">Action</th>
									</tr>

								</thead>
								<tbody>
							</table>

						</div>

					</div>
					<!--table end-->
					
					<div class="col-md-12 controls">
						<input type="button" value="PDF" onclick="genPdf()" class="btn additem_btn" style="margin: 0;">
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

<!--easyTabs-->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<!--easyTabs-->


<script>

function selectBillNo(source) {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i] != source)
            checkboxes[i].checked = source.checked;
    }
}

	function genPdf() {
		//alert("Inside Gen Pdf ");
		checkboxes = document.getElementsByName('select_to_agree');
		//alert(checkboxes.length);

		var selArray = 0;

		for (var x = 0; x < checkboxes.length; x++) {
			if (document.getElementById("select_to_agree" + x).checked == true) {
				if (x == 0) {

					selArray = document.getElementById("select_to_agree" + x).value;
					//alert(selArray);
				} else {
					selArray = selArray
							+ ","
							+ document.getElementById("select_to_agree" + x).value;
					//alert(selArray);
				}
			}

		}
		//	alert(selArray);

		window
				.open('${pageContext.request.contextPath}/pdf?reportURL=pdf/getCrnCheckedHeadersNew/'
						+ selArray);

	}
</script>




<script type="text/javascript">
	function searchReport() {

		//	alert("in side get Header ");

		var fromDate = $("#fromdatepicker").val();
		var toDate = $("#todatepicker").val();

		var valid = true;

		if (fromDate == null || fromDate == "") {
			valid = false;
			alert("Please select from date");
		}

		else if (toDate == null || toDate == "") {
			valid = false;
			alert("Please select to date");
		}

		/* if (fromDate > toDate) {
			valid = false;
			alert("from date greater than todate ");
		} */

		if (valid == true) {

			$
					.getJSON(
							'${getHeaders}',
							{
								fromDate : fromDate,
								toDate : toDate,

								ajax : 'true',

							},
							function(data) {
								//alert(data);
								var len = data.length;

								$('#table1 td').remove();

								$
										.each(
												data,
												function(key, headers) {

													var tr = $('<tr></tr>');

													tr
															.append($('<td style=" white-space: nowrap;"><input class="chk" type=checkbox name="select_to_agree" id="select_to_agree'+key+'"  value='+headers.crnId+'></td>'));
													tr
															.append($(
																	'<td style=" white-space: nowrap;"></td>')
																	.html(
																			key + 1));
													tr
															.append($(
																	'<td style="text-align:center; white-space: nowrap;"></td>')
																	.html(
																			headers.crnDate));

													tr
															.append($(
																	'<td style="text-align:center; white-space: nowrap;"></td>')
																	.html(
																			headers.crnNo));
													tr
															.append($(
																	'<td style="text-align:center; white-space: nowrap;"></td>')
																	.html(
																			headers.exVarchar1));//inv no

													/* tr
															.append($(
																	'<td class="col-md-3" style="text-align:center"></td>')
																	.html(
																			headers.frName));

													tr
															.append($(
																	'<td class="col-md-1"  style="text-align:right"></td>')
																	.html(
																			(headers.crnTaxableAmt)
																					.toFixed()));

													tr
															.append($(
																	'<td class="col-md-1"  style="text-align:right"></td>')
																	.html(
																			(headers.crnTotalTax)
																					.toFixed(2))); */

													tr
															.append($(
																	'<td style="text-align:right;white-space: nowrap;"></td>')
																	.html(
																			(headers.crnGrandTotal)
																					.toFixed(2)));

													tr
															.append($('<td style="text-align:center; white-space: nowrap;"><a href="#" class="action_btn" onclick="getCrnDetail('
																	+ headers.crnId
																	+ ')"><abbr title="Detail"><i class="fa fa-list"></i></abbr></a> &nbsp;&nbsp;&nbsp;<a href="#" class="action_btn" onclick="genPdfSingle('
																	+ headers.crnId
																	+ ')"><abbr title="Detail"><i class="fa fa-file-pdf-o"></i></abbr></a></td>'));

													$('#table1 tbody').append(
															tr);

												})

							});
		}

	}
</script>

<script type="text/javascript">
	function getCrnDetail(crnId) {
		//alert("HIII");
		//alert("header ID "+headerId)

		//alert("HHHHHH");
		var form = document.getElementById("validation-form");
		form.action = "${pageContext.request.contextPath}/getCrnDetailList/"
				+ crnId;
		form.submit();
	}
</script>

<script>
	function genPdfSingle(selArray) {
		//alert("Inside Gen Pdf ");
		//alert("Inside Gen Pdf " + selArray);

		window
				.open('${pageContext.request.contextPath}/billPdf?url=pdf/getCrnCheckedHeadersNew/'
						+ selArray);

	}
</script>


<script type="text/javascript">
	function validate() {

		var fromDate = $("#fromdatepicker").val();
		var toDate = $("#todatepicker").val();

		var isValid = true;

		if (fromDate == "" || fromDate == null) {

			isValid = false;
			alert("Please select From Date");
		} else if (toDate == "" || toDate == null) {

			isValid = false;
			alert("Please select To Date");
		}
		return isValid;

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

	function exportToExcel() {

		window.open("${pageContext.request.contextPath}/exportToExcel");
		document.getElementById("expExcel").disabled = true;
	}
</script>

<!-- onclick="var checkedVals = $('.chk:checkbox:checked').map(function() { return this.value;}).get();checkedVals=checkedVals.join(',');if(checkedVals==''){alert('No Rows Selected');return false;	}else{   return confirm('Are you sure want to generate pdf');}"
 -->
</body>
</html>
