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

.form-control {
	text-align: left !important;
}
</style>

<body onload="getData()">

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/loader.css">
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

					<div class="row" style="margin: 0 0 20px 0;">
						<div class="col-md-6">

							<h2 class="pageTitle">
								<i class="fa fa-suitcase" aria-hidden="true"></i> Add Expense
							</h2>
							<!--<h3 class="pageTitle2">Order Date : 22-02-2017 </h3>-->

						</div>
						<div class="col-md-6">
							<div align="right">

								<a href="${pageContext.request.contextPath}/showAddExpense"><input
									type="button" value="Add Expense" class="btn additem_btn"
									style="margin: 0;"> </a>
							</div>
						</div>
					</div>


					<form name="frm_search" id="frm_search" method="post"
						enctype="multipart/form-data"
						action="${pageContext.request.contextPath}/addSubmitExpense">


						<div class="row">
							<div class="col-md-2">
								<div class="col1title">Challan No</div>
							</div>
							<div class="col-md-2">

								<c:if test="${isEdit==0}">
									<input id="itemCode" class="texboxitemcode"
										placeholder="Chalan No" name="chalanNo" autocomplete="off"
										readonly="readonly" value="${chSeq}" type="text" required>
								</c:if>


								<c:if test="${isEdit==1}">
									<input id="itemCode" class="texboxitemcode"
										placeholder="Chalan No" name="chalanNo" autocomplete="off"
										readonly="readonly" value="${expEdit.chalanNo}" type="text"
										required>
								</c:if>

							</div>


							<div class="col-md-2">
								<div class="col1title">Date</div>
							</div>
							<div class="col-md-2">
								<c:choose>
									<c:when test="${not empty expEdit.expDate}">
										<input id="fromdatepicker" class="texboxitemcode texboxcal"
											required placeholder=" Date" name="fromdatepicker"
											value="${expEdit.expDate}" autocomplete="off" type="text"
											readonly="readonly">
									</c:when>
									<c:otherwise>
										<input id="fromdatepicker" class="texboxitemcode texboxcal"
											required placeholder=" Date" name="fromdatepicker"
											value="${todaysDate}" autocomplete="off" type="text"
											readonly="readonly">
									</c:otherwise>
								</c:choose>
							</div>

							<div class="col-md-2">
								<div class="col1title">Type</div>
							</div>
							<div class="col-md-2">
								<select name="isActive" id="isActive" class="form-control"
									data-rule-required="true">
									<option value="1" ${expEdit.expType == 1 ? 'selected' : ''}>Regular</option>
									<option value="2" ${expEdit.expType == 2 ? 'selected' : ''}>Payment
										Challan</option>

								</select>
							</div>
						</div>
						<br>

						<div class="row">

							<div class="col-md-2">
								<div class="col1title">Amount</div>
							</div>
							<div class="col-md-2">
								<input id="amount" class="texboxitemcode" placeholder="Amount"
									value="${expEdit.chAmt}" autocomplete="off" name="amount"
									type="text"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
									required>
							</div>

							<div class="col-md-2">
								<div class="col1title">Remark</div>
							</div>
							<div class="col-md-6">
								<textarea id="remark" class="texboxitemcode" autocomplete="off"
									name="remark">${expEdit.remark}</textarea>

								<input type="hidden" name="expId" value="${expEdit.expId}">
							</div>
						</div>

						<br>
						<div class="row">

							<div class="col-md-2">
								<div class="col1title">Image</div>
							</div>
							<div class="col-md-4">

								<div class="btn btn-primary btn-file legitRipple"
									style="width: -webkit-fill-available; width: -moz-available;">
									<i class="icon-file-plus"></i> <span class="hidden-xs">Browse</span><input
										type="file" class="file-input browseimage browseimage1"
										data-fouc="" id="1" name="photo">
								</div>



								<input type="hidden" value="${expEdit.imgName}" name="profPic">


								<c:if test="${not empty expEdit.imgName}">


									<a href="${imageUrl}${expEdit.imgName}" target="_blank"> <img
										style="width: 100px; height: auto;"
										src="${pageContext.request.contextPath}/resources/images/attach_file.png">
									</a>


								</c:if>

								<span class="filename" style="user-select: none1;"><img
									id="temppreviewimageki1" name="image1"
									class="temppreviewimageki1" alt="l"
									style="width: 100px; height: auto; display: none"
									onerror="this.src='${pageContext.request.contextPath}/resources/images/attach_file.png';">
								</span> <br>
								<button type="button" title="Clear selected files"
									class="btn btn-default btn-secondary fileinput-remove fileinput-remove-button legitRipple image-preview-clear image-preview-clear1"
									id="1" style="display: none; margin-top: 20px;">
									<i class="icon-cross2 font-size-base mr-2"></i> Clear Image
								</button>

							</div>


						</div>

						<div class="row">
							<div align="center">
								<input class="btn additem_btn" value="Submit" type="submit"
									id="btnsub" style="margin: 30px 0 0 0;">

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


</body>

</html>