<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="icon" href="${pageContext.request.contextPath}/resources/images/MongiFavicon.png" type="image/x-icon">

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

.form-control {
	text-align: left !important;
}
</style>

<body onload="getData()">

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loader.css">
	<!--datepicker-->
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


	<c:url var="editFrSupplier" value="/editFrSupplier"></c:url>
	<c:url var="getBillReceiptDetailListForOpsByExpId"
		value="/getBillReceiptDetailListForOpsByExpId"></c:url>


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
			<div class="wrapperIn2 single">

				<!--leftNav-->

				<jsp:include page="/WEB-INF/views/include/left.jsp">
					<jsp:param name="myMenu" value="${menuList}" />
				</jsp:include>


				<!--leftNav-->
				<div class="colOuter">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<c:if test="${not empty message}">
							<div class="alert1">
								<span class="closebtn"
									onclick="this.parentElement.style.display='none';">&times;</span>
								${message}
							</div>
						</c:if>
					</div>
				</div>

				<!--rightSidebar-->
				<div class="sidebarright">
				
					<div class="row_one">
						<div class="row_one_l">
							<h2 class="pageTitle">
								<i class="fa fa-suitcase" aria-hidden="true"></i> Expense List
							</h2>
						</div>
						<div class="row_one_r">
							<a href="${pageContext.request.contextPath}/showAddExpense"><input
							type="button" value="Add Expense" class="btn additem_btn" style="margin: 0;"> </a>
						</div>
						<div class="clr"></div>
					</div>
				

					


					<form name="frm_search" id="frm_search" method="get"
						action="${pageContext.request.contextPath}/showExpenseList">


						<div class="row">
							<div class="col-md-1">
								<div class="col1title">From Date</div>
							</div>
							<div class="col-md-2">
								<input id="fromdatepicker" class="texboxitemcode texboxcal"
									required name="fromDate" autocomplete="off" value="${fromDate}"
									type="text">

							</div>

							
							<div class="col-md-1">
								<div class="col1title">To Date</div>
							</div>
							<div class="col-md-2">
								<input id="todatepicker" class="texboxitemcode texboxcal"
									required name="toDate" autocomplete="off" value="${toDate}"
									type="text">

							</div>
							
							<div class="col-md-1">
								<div class="col1title">Type</div>
							</div>
							<div class="col-md-2">
								<select name="type" id="isActive" class="form-control"
									data-rule-required="true">
									<option value="1" ${type == 1 ? 'selected' : ''}>Regular</option>
									<option value="2" ${type == 2 ? 'selected' : ''}>Payment
										Challan</option>

								</select>
							</div>
							
							<div class="col-md-1">
								<div class="marg_tp" align="center">
								<input class="btn additem_btn" value="Submit" type="submit" id="btnsub" style="margin: 0;">
								</div>
							</div>


						</div>

						<!-- <div class="row">
							<div align="center">
								<input class="btn additem_btn" value="Submit" type="submit"
									id="btnsub" style="margin: 30px 0 0 0;">
							</div>

						</div> -->




						<div class="marg_top">
						
						<div class="tableFixHead ">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center;">Sr No</th>
			<th style="text-align: center;">Chalan No.</th>
			<th style="text-align: center;">Date</th>
			<th style="text-align: center;">Amount</th>
			<th style="text-align: center;">Remark</th>
			<th style="text-align: center;">Attachment</th>
			<th style="text-align: center;">User</th>
			<th style="text-align: center;">Type</th>
			<th style="text-align: center;">Action</th>

		</tr>
	</thead>
	
	<tbody>

									<c:forEach items="${expList}" var="expList" varStatus="count">

										<tr>
											<td style="text-align: center;"><c:out
													value="${count.index+1}" /></td>
											<td style="text-align: center;"><c:out
													value="${expList.chalanNo}" /></td>

											<td style="text-align: center;"><c:out
													value="${expList.expDate}" /></td>
											<td><c:out value="${expList.chAmt}" /></td>

											<td style="text-align: left;"><c:out
													value="${expList.remark}" /></td>

											<td style="text-align: left;"><a
												href="${imageUrl}${expList.imgName}" download><img
													src="${imageUrl}${expList.imgName}"
													style="width: 80px; height: 80px;"
													onerror="this.src='${pageContext.request.contextPath}/resources/images/No_Image_Available.jpg';"></a>

											</td>

											<td style="text-align: left;"><c:out
													value="${expList.exVar2}" /></td>

											<td style="text-align: center;"><c:choose>
													<c:when test="${expList.expType==1}">
 														Regular						
 												    </c:when>
													<c:otherwise>
												         Payment Chalan
												    </c:otherwise>
												</c:choose></td>


											<td style="text-align: center;">

													<c:if
														test="${expList.expType==1  && (currDate == expList.expDate)}">
														<a
															href="${pageContext.request.contextPath}/showEditExpense/${expList.expId}">
															<abbr title='Edit'><i class='fa fa-edit'></i></abbr>
														</a> &nbsp;&nbsp; <a
															href="${pageContext.request.contextPath}/deleteExpense/${expList.expId}"
															onClick="return confirm('Are you sure want to delete this record');">
															<abbr title='Delete'><i class='fa fa-trash'></i></abbr>
														</a>
													</c:if>

													<c:if
														test="${expList.expType==2  && (currDate == expList.expDate)}">
														<c:if test="${expList.status==2}">

															<a
																href="${pageContext.request.contextPath}/showEditExpense/${expList.expId}">
																<abbr title='Edit'><i class='fa fa-edit'></i></abbr>
															</a> &nbsp;&nbsp; <a
																href="${pageContext.request.contextPath}/deleteExpense/${expList.expId}"
																onClick="return confirm('Are you sure want to delete this record');">
																<abbr title='Delete'><i class='fa fa-trash'></i></abbr>
															</a>
														</c:if>

													</c:if>




												</td>
										</tr>
									</c:forEach>
								</tbody>
	</table>
</div>
						
						
							

						</div>


					</form>

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
	<!--easyTabs-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!--easyTabs-->





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
		function showDetailsForBillReceipt(expId) {
			//alert("hi");

			//document.getElementById("expAmt").innerHTML = expAmt;

			$('#table_grid1 td').remove();

			$.getJSON('${getBillReceiptDetailListForOpsByExpId}', {

				expId : expId,
				ajax : 'true',
			}, function(data) {

				if (data == "") {
					alert("No Record Found!");
				}

				$('#table_grid1 td').remove();

				$.each(data, function(key, data1) {

					var tr = $('<tr></tr>');

					tr.append($('<td></td>').html(key + 1));

					tr.append($('<td></td style="text_align:center;">').html(
							data1.exVar2));

					tr.append($('<td></td style="text_align:center;">').html(
							data1.invoiceNo));
					tr.append($('<td></td style="text_align:right;">').html(
							data1.billAmt));
					tr.append($('<td></td style="text_align:right;">').html(
							data1.paidAmt));

					$('#table_grid1 tbody').append(tr);

				});

			});
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
		})();
	</script>
	<script>
		function myFunction() {
			var input, filter, table, tr, td, i;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("table_grid");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
				if (td) {
					if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>





</body>

</html>