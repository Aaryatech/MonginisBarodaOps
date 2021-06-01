<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
 <style>
table, th, td {
    border: 1px solid #9da88d;
}
</style>

<!--topLeft-nav-->
<div class="sidebarOuter"></div>
<!--topLeft-nav-->

<!--wrapper-start-->
<div class="wrapper">

	<!--topHeader-->
	<c:url var="getGvnList" value="/getGvnList" />

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
			
				<div class="det_row">
					<div class="det_l"><h2 class="pageTitle"><i class="fa fa-refresh" aria-hidden="true"></i> GVN Details </h2></div>
					<div class="det_r">
						<form action="" id="gvnForm" method="get">
							<div class="grn_one">Gvn Date :<span>${gvnDate}</span></div>
							<div class="grn_one">Gvn SrNo :<span>${gvnSrNo}</span></div>
							<div class="grn_one">Aprroved Amt :<span>${aprAmt}</span></div>
						</form>
					</div>
					<div class="clr"></div>
				</div>
			
				<!-- <div class="order-left">
					<h2 class="pageTitle">GVN Details</h2>
					
				</div> -->
				<%-- <div class="colOuter">
					<div class="calender-title"></div>

					<div class="col-md-6">
						<form action="" id="gvnForm" method="get">

							<table border="1">
								<tr bgcolor="orange">
									<th width="30%" align="left">Gvn Date</th>
									<th width="40%" align="left">Gvn SrNo</th>
									<th width="30%" align="left">Aprroved Amt</th>
								</tr>
								<tbody>
									<tr>
										<td align="center">${gvnDate}</td>
										<td align="center">${gvnSrNo}</td>
										<td align="center">${aprAmt}</td>
									</tr>
								</tbody>
							</table>
							
						</form>
					</div>
				</div> --%>

				<input type="hidden" name="mod_ser" id="mod_ser"
					value="search_result">



				<div class="clearfix"></div>
				
				<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center;">Invoice No</th>
			<th style="text-align: center;">Item Name</th>
			<th style="text-align: center;">Disc.%</th>
			<th style="text-align: center;">Bill Rate</th>
			<th style="text-align: center;">Refund Rate</th>
			<th style="text-align: center;">Gvn Qty</th>
			<th style="text-align: center;">Total Refund Requested</th>
			<th style="text-align: center;">Approved Qty</th>
			<th style="text-align: center;">Approved total Refund</th>
			<th style="text-align: center;">Photo 1</th>
			<th style="text-align: center;">Photo 2</th>
			<th style="text-align: center;">Status</th>
		</tr>
	</thead>
	
	<tbody>


								<c:set var="status" value=""></c:set>

								<c:forEach items="${gvnList}" var="gvnList" varStatus="count">

									<c:set var="color" value="a"></c:set>

									<c:set var="color" value="white"></c:set>
									<c:choose>
										<c:when test="${gvnList.grnGvnQty!=gvnList.aprQtyAcc or gvnList.grnGvnStatus==7}">
											<c:set var="color" value="re-order"></c:set>
										</c:when>
										<c:otherwise>
											<c:set var="color" value="white"></c:set>
										</c:otherwise>
									</c:choose>

									<tr class="${color}">


										<td style="text-align: center;"><c:out value="${gvnList.invoiceNo}" /></td>
										<td style="text-align: left;"><c:out value="${gvnList.itemName}" /></td>
										<td style="text-align: right;"><c:out value="${gvnList.itemMrp}" /></td>
										<td style="text-align: right;"><c:out value="${gvnList.itemRate}" /></td>
										<td style="text-align: right;"><c:out value="${gvnList.itemRate}" /></td>
										<td style="text-align: right;"><c:out value="${gvnList.grnGvnQty}" /></td>
										<td style="text-align: right;"><c:out value="${gvnList.grnGvnAmt}" /></td>
										<c:choose>
										<c:when test="${gvnList.isCreditNote==1}">
										<td style="text-align: right;"><c:out value="${gvnList.aprQtyAcc}" /></td>
										<td style="text-align: right;"><c:out value="${gvnList.aprGrandTotal}" /></td>
										</c:when>
										<c:otherwise>
										<td style="text-align: right;"><c:out value="-" /></td>
										<td style="text-align: right;"><c:out value="-" /></td>
										</c:otherwise>
										</c:choose>
										<td style="text-align: right;"><a href="${url}${gvnList.gvnPhotoUpload1}" data-lightbox="image-1">Image 1</a></td>
										<td style="text-align: right;"><a href="${url}${gvnList.gvnPhotoUpload2}" data-lightbox="image-2">Image 2</a></td>
										<c:set var="statusGVN" value="NA"></c:set>
										<c:forEach items="${gvStatusLst}" var="gvnStatus">
										<c:if test="${gvnStatus.statusValue==gvnList.grnGvnStatus}">
										<c:set var="statusGVN" value="${gvnStatus.statusName}"></c:set>
										</c:if>
										</c:forEach>
										<td style="text-align: left;"><c:out value="${statusGVN}"></c:out></td>
								</c:forEach>

							</tbody>
	</table>
</div>


				



			</div>
			<!--rightSidebar-->

		</div>
		<!--fullGrid-->
	</div>
	<!--rightContainer-->

</div>
<!--wrapper-end-->

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
	})();
</script>

<script type="text/javascript">
	function searchGVN() {

		$('#table_grid td').remove();

		var isValid = validate();

		if (isValid) {

			var fromDate = document.getElementById("datepicker").value;
			var toDate = document.getElementById("datepicker2").value;

			$
					.getJSON(
							'${getGvnList}',
							{

								fromDate : fromDate,
								toDate : toDate,
								ajax : 'true'

							},
							function(data) {

								//$('#table_grid td').remove();

								if (data == "") {
									alert("No records found !!");

								}

								$
										.each(
												data,
												function(key, gvndata) {

													var tr = $('<tr></tr>');

													tr
															.append($(
																	'<td class="col-md-1"></td>')
																	.html(
																			gvndata.invoiceNo));
													tr
															.append($(
																	'<td class="col-md-2"></td>')
																	.html(
																			gvndata.itemName));
													tr
															.append($(
																	'<td class="col-md-1"></td>')
																	.html(
																			gvndata.itemRate));
													tr
															.append($(
																	'<td class="col-md-1"></td>')
																	.html(
																			gvndata.itemRate));
													tr
															.append($(
																	'<td class="col-md-1"></td>')
																	.html(
																			gvndata.grnGvnQty));
												
													var status;
													if (gvndata.grnGvnStatus == 1)
														status = "Pending";
													else if (gvndata.grnGvnStatus == 2)
														status = "Approved From Dispatch";
													else if (gvndata.grnGvnStatus == 3)
														status = "Reject From Dispatch";
													else if (gvndata.grnGvnStatus == 4)
														status = "Approved From Sales";
													else if (gvndata.grnGvnStatus == 5)
														status = "Reject From Sales";
													else if (gvndata.grnGvnStatus == 6)
														status = "Approved From Account";
													else	if (gvndata.grnGvnStatus == 7)
														status = "Reject From Account";


													tr
															.append($(
																	'<td class="col-md-2"></td>')
																	.html(
																			grnGvnAmt));
													tr
															.append($(
																	'<td class="col-md-1"></td>')
																	.html(
																			gvndata.aprQtyAcc
																					.toFixed(2)));
													tr
															.append($(
																	'<td class="col-md-1"></td>')
																	.html(
																			gvndata.aprGrandTotal
																					.toFixed(2)));
													tr
															.append($(
																	'<td class="col-md-1"></td>')
																	.html(
																			aprTaxableAmt));
													
													
													tr
													.append($(
															'<td class="col-md-1"></td>')
															.html(
																	aprTotalTax));
													
													tr
													.append($(
															'<td class="col-md-1"></td>')
															.html(
																	aprTaxableAmt));
													
													
													tr
															.append($(
																	'<td class="col-md-1"></td>')
																	.html(
																			'<a href="'
																							+gvndata.gvnPhotoUpload1+'" data-lightbox="image-1" data-title="My caption"><i class="fa fa-image icon2"></i></a>'));
													tr
															.append($(
																	'<td class="col-md-1"></td>')
																	.html(
																			'<a href="'
																							+gvndata.gvnPhotoUpload2+'" data-lightbox="image-1" data-title="My caption"><i class="fa fa-image icon2"></i></a>'));

													tr
															.append($(
																	'<td class="col-md-1"></td>')
																	.html(
																			gvndata.status));

													/* 
													 var index = key + 1;

													 var tr = "<tr>";
													

													 var billNo = "<td>"
													 + gvndata.billNo
													 + "</td>";
													 var grnGvnDate = "<td>"
													 + gvndata.grnGvnDate
													 + "</td>";
													 var itemName = "<td>"
													 + gvndata.itemName
													 + "</td>";

													 var itemRate = "<td>"
													 + gvndata.baseRate
													 + "</td>";

													 var grnGvnQty = "<td>"
													 + gvndata.grnGvnQty
													 + "</td>";
													
													
													 var gvnTaxPer = "<td>"
													 + calcTaxPer
													 + "</td>";
													
													 var totalTax = "<td>"
													 + gvndata.totalTax
													 + "</td>";
													
													
													

													 var grnGvnAmt = "<td>"
													 + gvndata.grnGvnAmt
													 + "</td>";

													
													
													
													 var grnGvnStatus = "<td>"
													 + gvndata.grnGvnStatus
													 + "</td>";

													 var gvnPhotoUpload1 = '<td> <a href="'
																							+gvndata.gvnPhotoUpload1+'" data-lightbox="image-1" data-title="My caption">Image 1</a>'
													 + '</td>';

													 var gvnPhotoUpload2 = '<td> <a href="'
																							+gvndata.gvnPhotoUpload2+'" data-lightbox="image-1" data-title="My caption">Image 2</a>'
													 + '</td>';

													 var frGrnGvnRemark = "<td>"
													 + gvndata.frGrnGvnRemark
													 + "</td>";

													 var trclosed = "</tr>";

													 $('#table_grid tbody')
													 .append(tr);
													

													 $('#table_grid tbody')
													 .append(billNo);
													 $('#table_grid tbody')
													 .append(
													 grnGvnDate);
													 $('#table_grid tbody')
													 .append(
													 itemName);
													 $('#table_grid tbody')
													 .append(
													 itemRate);
													 $('#table_grid tbody')
													 .append(
													 grnGvnQty);

													 $('#table_grid tbody')
													 .append(
													 gvnTaxPer);

													
													 $('#table_grid tbody')
													 .append(
													 totalTax);

													
													
													
													 $('#table_grid tbody')
													 .append(
													 grnGvnAmt);

													 $('#table_grid tbody')
													 .append(
													 grnGvnStatus);
													 $('#table_grid tbody')
													 .append(
													 gvnPhotoUpload1);
													 $('#table_grid tbody')
													 .append(
													 gvnPhotoUpload2);
													 $('#table_grid tbody')
													 .append(
													 frGrnGvnRemark);
													 */
													$('#table_grid tbody')
															.append(tr);

												})

							});

		}
	}
</script>



<script type="text/javascript">
	function validate() {

		var fromDate = $("#datepicker").val();
		var toDate = $("#datepicker2").val();

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



<script type="text/javascript">
	function show_image(data) {
	//	alert(data);
		var image = new Image();
		image.src = data;

		var w = window.open("");
		w.document.write(image.outerHTML);
	}
</script>



</body>
</html>
