<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.pageTitle {
	margin-top: 0px;
}
</style>
<%-- <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Monginis</title>
<link
	href="${pageContext.request.contextPath}/resources/css/monginis.css"
	rel="stylesheet" type="text/css" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/feviconicon.png"
	type="image/x-icon" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>

<!--rightNav-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/menuzord.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery("#menuzord").menuzord({
			align : "left"
		});
	});
	$(".toggle").on("click", function() {
		$(".marquee").toggleClass("microsoft");
	});
</script>
<!--rightNav-->

</head>
<body> comment by sachin --%>
<style type="text/css">
.fit-img {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	margin: auto;
	max-width: 60%;
	max-height: 60%
}

.fit-img-bottom {
	top: auto;
}

.fit-img-tight {
	max-width: 60%;
	max-height: 60%
}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<c:url var="getCatSellList" value="/getCatSellList" />
<c:url var="getItemSellBill" value="/getItemSellBill" />
<c:url var="getDatewiseSellList" value="/getDatewiseSellList" />
<c:url var="drawLineChart" value="/drawLineChart" />
<!--topLeft-nav-->
<div class="sidebarOuter"></div>
<!--topLeft-nav-->
<body onload="drawAllCharts()">
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
	<!--wrapper-start-->
	<div class="wrapper">

		<!--topHeader-->
		<jsp:include page="/WEB-INF/views/include/logo.jsp">

			<jsp:param name="fr" value="${frDetails}" />
		</jsp:include>




		<!--topHeader-->

		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2">

				<jsp:include page="/WEB-INF/views/include/left.jsp">
					<jsp:param name="myMenu" value="${menuList}" />

				</jsp:include>
				<%--     <input type="hidden" id="achievedTarget" value="${sessionScope.achievedTarget}">
       <input type="hidden" id="target" value="${sessionScope.fraTarget}"> --%>
				<%--  <c:choose>
       <c:when test="${loginInfo.accessRight==1}">
                  	<a href="${pageContext.request.contextPath}/viewMonthwiseSellBill">  <div id="chart_div" style="width: 220px;height: 70px;  float:right;margin-right: 60px;margin-top: 10px;"></div></a>
       
       </c:when>
       
       </c:choose> --%>

				<!--rightSidebar-->
				<div class="sidebarright">
				
					<h2 class="pageTitle"><i class="fa fa-bar-chart-o" aria-hidden="true"></i> Dashboard</h2>

					<div class="row">
						<div class="col-md-12">
							<div class="custom_right">

								<form action="${pageContext.request.contextPath}/dashboarddemo"
									method="get">
									<input type="hidden" name="tod" id="tod" value="${tod}">
									<input type="hidden" name="frmd" id="frmd" value="${frmd}">
									<input type="hidden" name="catId" id="catId" value="${tod}">
									<input type="hidden" name="typesele" id="typesele"
										value="${type}">
									<div style="text-align: left; margin: 0 0 20px 0;">
									
										<div class="row">
										<c:choose>
											<c:when test="${type==1}">
												<div class="col-md-1 radio_align_1"
													style="margin: 10px 0 0 0px;">
													<input type="radio" name="type" value="1"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;" checked>Today
												</div>
												<div class="col-md-1 radio_align_1"
													style="margin: 10px 0 0 0px;">
													<input type="radio" name="type" value="2"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;">
													Week
												</div>
												<div class="col-md-1 radio_align_1"
													style="margin: 10px 0 0 0px;">
													<input type="radio" name="type" value="3"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;">
													Month
												</div>
												<div class="col-md-1 radio_align_1"
													style="margin: 7px 0 0 0px;">
													<input type="radio" name="type" value="4"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;">
													Custom
												</div>
											</c:when>
											<c:when test="${type==2}">
												<div class="col-md-1 radio_align_1"
													style="margin: 7px 0 0 0px;">
													<input type="radio" name="type" value="1"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;">Today
												</div>
												<div class="col-md-1 radio_align_1"
													style="margin: 7px 0 0 0px;">
													<input type="radio" name="type" value="2"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;" checked>
													Week
												</div>
												<div class="col-md-1 radio_align_1"
													style="margin: 7px 0 0 0px;">
													<input type="radio" name="type" value="3"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;">
													Month
												</div>
												<div class="col-md-1 radio_align_1"
													style="margin: 7px 0 0 0px;">
													<input type="radio" name="type" value="4"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;">
													Custom
												</div>
											</c:when>

											<c:when test="${type==3}">
												<div class="col-md-1 radio_align_1"
													style="margin: 7px 0 0 0px;">
													<input type="radio" name="type" value="1"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;">Today
												</div>
												<div class="col-md-1 radio_align_1"
													style="margin: 7px 0 0 0px;">
													<input type="radio" name="type" value="2"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;">
													Week
												</div>
												<div class="col-md-1 radio_align_1"
													style="margin: 7px 0 0 0px;">
													<input type="radio" name="type" value="3"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;" checked>
													Month
												</div>
												<div class="col-md-2 radio_align_1"
													style="margin: 7px 0 0 0px;">
													<input type="radio" name="type" value="4"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;">
													Custom
												</div>
											</c:when>

											<c:when test="${type==4}">
												<div class="col-md-1 radio_align_1"
													style="margin: 7px 0 0 0px;">
													<input type="radio" name="type" value="1"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;">Today
												</div>
												<div class="col-md-1 radio_align_1"
													style="margin: 7px 0 0 0px;">
													<input type="radio" name="type" value="2"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;">
													Week
												</div>
												<div class="col-md-1 radio_align_1"
													style="margin: 7px 0 0 0px;">
													<input type="radio" name="type" value="3"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;">
													Month
												</div>
												<div class="col-md-1 radio_align_1"
													style="margin: 7px 0 0 0px;">
													<input type="radio" name="type" value="4"
														class="radio-align" onclick="showDiv(this.value)"
														style="vertical-align: sub; margin: 0 2px 0 0;" checked>
													Custom
												</div>
											</c:when>
										</c:choose>

										<div id="ihide" style="display: none;">
											<div class="col-md-1">
												<div class="col1title">From Date</div>
											</div>
											<div class="col-md-2">
												<input id="fromdatepicker" class="texboxitemcode texboxcal"
													required="required" placeholder="From Date" name="fromDate"
													value="${fromDate}" autocomplete="off" type="text">

											</div>
											<div class="col-md-1">
												<div class="col1title">To Date</div>
											</div>
											<div class="col-md-2">
												<input id="todatepicker" class="texboxitemcode texboxcal"
													required="required" placeholder="To Date" name="toDate"
													value="${toDate}" autocomplete="off" type="text">

											</div>

										</div>






										<div class="sub_right">
											<input name="submit" class="btn additem_btn" value="Submit"
												type="submit" id="submtbtn" style="margin:0;">
										</div>
										
										
										<div class="sub_right"></div>
										</div>
									</div>
								</form>
							</div>
						</div>



						<div class="clr"></div>
						<!-- box 1 -->
						<div class="sales_list">
							<ul>
								<!-- first li box -->
								<li>
									<div class="sale_one bg_one">
										<div class="sale_l">
											<i class="fa fa-inr" aria-hidden="true"></i>
										</div>
										<div class="sale_r">
											<h3 class="sale_head">Sale</h3>

											<div class="sale_divide">
												<div class="sales_l">
													<span> <fmt:formatNumber value="${dashboardData.totalSell}" minFractionDigits="0" maxFractionDigits="0"/></span>
												</div>
												<div class="sales_l">
													<span> <fmt:formatNumber value="${dashboardData.spCakeTotalBill}" minFractionDigits="0" maxFractionDigits="0"/> </span>
												</div>
												<div class="clr"></div>
											</div>


											<h1 class="price_sale">
<span> <fmt:formatNumber value="${dashboardData.totalSell+dashboardData.spCakeTotalBill}" minFractionDigits="0" maxFractionDigits="0"/>
												</h1>
										</div>
										<div class="clr"></div>
									</div>
								</li>

								<!-- second li box -->
								<!-- <li>
									<div class="sale_one bg_two">
										<div class="sale_l">
											<i class="fa fa-inr" aria-hidden="true"></i>
										</div>
										<div class="sale_r">
											<h3 class="sale_head">Discount Rate</h3>

											<h5 class="price_sale">57236</h5>
										</div>
										<div class="clr"></div>
									</div>
								</li> -->

								<li>
									<div class="sale_one bg_two">
										<div class="sale_l">
											<i class="fa fa-inr" aria-hidden="true"></i>
										</div>
										<div class="sale_r">
											<h3 class="sale_head">Return</h3>

											<div class="sale_divide">
												<div class="sales_l">
													<span><fmt:formatNumber value="${dashboardData.grnAprAmt}" minFractionDigits="0" maxFractionDigits="0"/>   </span>
												</div>
												<div class="sales_l">
													<span> <fmt:formatNumber value="${dashboardData.grnAprAmmt}" minFractionDigits="0" maxFractionDigits="0"/> </span>
												</div>
												<div class="clr"></div>
											</div>


											<h1 class="price_sale">
											 <fmt:formatNumber value="${dashboardData.grnAprAmt+dashboardData.grnAprAmmt}" minFractionDigits="0" maxFractionDigits="0"/> 

												</h1>
										</div>
										<div class="clr"></div>
									</div>
								</li>

								<!-- third li box -->
								<li>
									<div class="sale_one bg_three">
										<div class="sale_l">
											<i class="fa fa-inr" aria-hidden="true"></i>
										</div>
										<div class="sale_r">
											<h3 class="sale_head">Contribution</h3>

											<h5 class="price_sale">
											<fmt:formatNumber value="${(dashboardData.totalSell+dashboardData.spCakeTotalBill)-
													(dashboardData.grnAprAmt+dashboardData.grnAprAmmt+dashboardData.purchaseBill)} 	" minFractionDigits="0" maxFractionDigits="0"/>
												
											</h5>


										</div>
										<div class="clr"></div>
									</div>
								</li>

								<!-- fourth li box -->
								<li>
									<div class="sale_one bg_fourth">
										<div class="sale_l">
											<i class="fa fa-inr" aria-hidden="true"></i>

										</div>
										<div class="sale_r">
											<h3 class="sale_head">Target</h3>
											<h5 class="price_sale"><fmt:formatNumber value="${((dashboardData.totalSell+dashboardData.spCakeTotalBill) * 100)/1000000}"  minFractionDigits="0" maxFractionDigits="0"/>%</h5>
										
										</div>
										<div class="clr"></div>
									</div>
								</li>



							</ul>
							<div class="clr"></div>
						</div>



						<div class="row">
							<!-- <div class="col-md-4">
						<div class="one_graph">
							<div class="graph_one one"></div>
							<div class="daily_sale">
								<h2>Daily Sales</h2>
 								<p><span>55%</span> increase in today sales.</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="one_graph">
							<div class="graph_one  two"></div>
							<div class="daily_sale">
								<h2>Email Subscriptions</h2>
 								<p>Last Campaign Performance</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="one_graph ">
							<div class="graph_one three"></div>
							<div class="daily_sale">
								<h2>Completed Tasks</h2>
 								<p>Last Campaign Performance</p>
							</div>
						</div>
					</div> -->

							<div class="col-md-6">
								<div class="one_graph ">
									<div class="graph_one two" style="background-color: white; padding:10px;">
										<div id="line_chart_div" style="width: 100%; height: 100%;"></div>
									</div>
									<!-- <div class="daily_sale">
										<div id="chart_div"></div>
									</div> -->
								</div>
							</div>
							<div class="col-md-6">
								<div class="one_graph ">
									<div class="graph_one one" style="background-color: white; padding:10px;">
										<div id="donutchart" style="width: 100%; height: 100%;"></div>
									</div>
									<!-- <div class="daily_sale">
										<h2>Completed Tasks</h2>
										<p>Last Campaign Performance</p>
									</div> -->
								</div>
							</div>


						</div>
						
						<div class="row">
							<div class="col-md-6">
								<div class="one_graph padd_bx">
									
									<h3 class="bx_title">Today's Special Cakes Customer List</h3>
									
									
									<div id="scrollbarsmodaldiv" class="table-scroll responsive-table-one"><!-- class="table-scroll" -->

									<div id="scrollbarsmodaldiv" class="faux-table" aria="hidden"><!-- style="display:none" -->
										<table id="customertable" class="main-table">
											<thead>
												<tr class="bgpink">												
												<th width="10%" class="sr_no" style="text-align: left;">Sr</th>
												<th width="60%" class="sr_no" style="text-align: left;">Customer Name</th>
												<th width="10%" class="sr_no" style="text-align: left;">Total</th>
												<th width="10%" class="sr_no" style="text-align: left;">Status</th>
												</tr>
											</thead>
										</table>

									</div>
									<div class="table-wrap inner_height">

										<table id="customertable" class="responsive-table" style="margin:0px;"><!--   class="main-table" -->
											<thead>
												<tr class="bgpink">
												<th width="10%" class="sr_no" style="text-align: left;">Sr</th>
												<th width="60%" class="sr_no" style="text-align: left;">Customer Name</th>
												<th width="10%" class="sr_no" style="text-align: left;">Total</th>
												<th width="10%" class="sr_no" style="text-align: left;">Status</th>
												</tr>
											</thead>
											<tbody style="jtext-align:left !important">
												
												<c:forEach items="${customerListForDashlist}" var="custList"
												varStatus="count">

												<tr>
													<td style="text-align: center">${count.index+1}</td>
													<td style="text-align: left"><c:out
															value="${custList.spCustName} - ${custList.spCustMobNo}" /></td>
													<td style="text-align: right"><c:out
															value="${custList.spGrandTotal}" /></td>
													<td style="text-align: center;"><c:choose>
															<c:when test="${custList.spBookForMobNo eq '0'}">Pending</c:when>
															<c:otherwise>Paid</c:otherwise>
														</c:choose></td>


												</tr>
											</c:forEach>
											
											</tbody>

										</table>
									</div>
								</div>
									
									
									
									
									<%-- <div class="scrollbars" id="scrollbarsmodaldiv">
									<table id="customertable" width="100%">

										<thead>
											<tr>
												<th class="sr_no" style="text-align: center;">Sr</th>
												<th class="sr_no" style="text-align: center;">Customer
													Name</th>
												<th class="sr_no" style="text-align: center;">Total</th>
												<th class="sr_no" style="text-align: center;">Status</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${customerListForDashlist}" var="custList"
												varStatus="count">

												<tr>
													<td style="text-align: center">${count.index+1}</td>
													<td style="text-align: left"><c:out
															value="${custList.spCustName}" /></td>
													<td style="text-align: right"><c:out
															value="${custList.spGrandTotal}" /></td>
													<td style="text-align: center;"><c:choose>
															<c:when test="${custList.spBookForMobNo eq '0'}">Pending</c:when>
															<c:otherwise>Paid</c:otherwise>
														</c:choose></td>


												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div> --%>
									
								</div>
							</div>
							<div class="col-md-6">
								<div class="one_graph padd_bx">

									<h3 class="bx_title">Top Products</h3>
								<div class="right_btns">
									<input name="submit" class="sub_btn" value="All" type="submit"
										onclick="itemSellBillCal2(0)" id="submtbtn">
									<button type="reset" class="sub_btn" value="Reset"
										onclick="itemSellBillCal2(2)">
										<i class="fa fa-arrow-down" aria-hidden="true"></i>
									</button>
									<button type="reset" class="sub_btn" value="Reset"
										onclick="itemSellBillCal2(1)">
										<i class="fa fa-arrow-up" aria-hidden="true"></i>
									</button>



								</div>

								
								<div id="table-scroll" class="table-scroll responsive-table-one"><!-- class="table-scroll" -->

									<div id="scrollbarsmodaldiv" class="faux-table" aria="hidden"><!-- style="display:none" -->
										<table id="custCreditTable" class="main-table">
											<thead>
												<tr class="bgpink">
												<th width="10%" class="sr_no" style="text-align: left;">Sr</th>
												<th width="60%" class="sr_no" style="text-align: left;">Item Name</th>
												<th width="10%" class="sr_no" style="text-align: left;">QTY/WT</th>
												<th width="10%" class="sr_no" style="text-align: left;">Amount</th>
												<th width="10%" class="sr_no" style="text-align: left;">Contribution</th>
													
														
													
												</tr>
											</thead>
										</table>

									</div>
									<div class="table-wrap inner_height">

										<table id="custCreditTable" class="responsive-table" style="margin:0px;"><!--   class="main-table" -->
											<thead>
												<tr class="bgpink">
												<th width="10%" class="sr_no" style="text-align: left;">Sr</th>
												<th width="60%" class="sr_no" style="text-align: left;">Item Name</th>
												<th width="10%" class="sr_no" style="text-align: left;">QTY/WT</th>
												<th width="10%" class="sr_no" style="text-align: left;">Amount</th>
												<th width="10%" class="sr_no" style="text-align: left;">Contribution</th>
													
														
													
												</tr>
											</thead>
											<tbody style="jtext-align:left !important"></tbody>

										</table>
									</div>
								</div>
					
					
								<!-- <div class="scrollbars" id="scrollbarsmodaldiv">
									<table id="custCreditTable" width="100%">

										<thead>
											<tr>
												<th class="sr_no" style="text-align: center;">Sr</th>
												<th class="sr_no" style="text-align: center;">Item Name</th>
												<th class="sr_no" style="text-align: center;">QTY/WT</th>
												<th class="sr_no" style="text-align: center;">Amount</th>
												<th class="sr_no" style="text-align: center;">Contribution</th>
											</tr>
										</thead>
										<tbody>

										</tbody>
									</table>
								</div> -->
					

								
									
								</div>
							</div>
						</div>


						<div class="row">
							<div class="col-md-12">
							<c:if test="${type!=1}">
							<div class="one_graph padd_bx">
								<div id="chart_div"></div>
							</div>
							</c:if>
							</div>
						</div>



						<%-- <div class="charts_bx">
							<c:if test="${type!=1}">
								<div class="chart_l">
									<div id="chart_div"></div>
								</div>
							</c:if>
							<!-- <div class="chart_r">
							<h3 class="bx_title">Top Products</h3>
							<div class="right_btns">
								<input name="submit" class="sub_btn" value="All" type="submit"
									onclick="itemSellBillCal2(0)" id="submtbtn">
								<button type="reset" class="sub_btn" value="Reset"
									onclick="itemSellBillCal2(2)">
									<i class="fa fa-arrow-down" aria-hidden="true"></i>
								</button>
								<button type="reset" class="sub_btn" value="Reset"
									onclick="itemSellBillCal2(1)">
									<i class="fa fa-arrow-up" aria-hidden="true"></i>
								</button>



							</div>



							<div class="scrollbars" id="scrollbarsmodaldiv">
								<table id="custCreditTable" width="100%">

									<thead>
										<tr>
											<th class="sr_no" style="text-align: center;">Sr</th>
											<th class="sr_no" style="text-align: center;">Item Name</th>
											<th class="sr_no" style="text-align: center;">Amount</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>


						</div> -->
							<div class="clr"></div>


						</div> --%>




					</div>
					<!--slider-->

					<!--latestNews-->


					<%-- 	<div class="latestNews">
					
						<h3 class="latestNewsTitle">Latest News</h3>
							<div class="microsoft marquee">
						<c:forEach items="${schedulerLists}" var="schedulerLists">
						
					

								<span> ${schedulerLists.schMessage} </span>
							
						
						</c:forEach>
						</div>
					</div> --%>


					<!--latestNews-->

				</div>
				<!--rightSidebar-->

			</div>
			<!--fullGrid-->
		</div>
		<!--rightContainer-->

	</div>
	<!--wrapper-end-->

	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		function drawDonutChart() {
			//alert("hii donut ch");
			//to draw donut chart
			var chart;
			var datag = '';
			var frmd = document.getElementById("frmd").value;
			var tod = document.getElementById("tod").value;
			var a = "";
			var dataSale = [];
			var Header = [ 'Category', 'Amount', 'ID' ];
			dataSale.push(Header);
			$.post('${getCatSellList}', {
				frmd : frmd,
				tod : tod,
				ajax : 'true'
			}, function(chartsdata) {
				//alert(JSON.stringify(data));
				//	console.log('data ' + JSON.stringify(chartsdata));
				var len = chartsdata.length;
				datag = datag + '[';
				$.each(chartsdata, function(key, chartsdata) {
					var temp = [];
					temp.push(chartsdata.catName + " ("
							+ (parseFloat(chartsdata.total).toFixed(2)) + ")",
							(parseFloat(chartsdata.total)),
							parseInt(chartsdata.catId));
					dataSale.push(temp);

				});

				//console.log(dataSale);
				var data1 = google.visualization.arrayToDataTable(dataSale);

				var options = {
					title : 'Categorywise Sell(%)',
					pieHole : 0.4,
					backgroundColor : 'transparent',
					pieSliceText : 'none',
					sliceVisibilityThreshold : 0,
					legend : {
						position : 'labeled',
						labeledValueText : 'both',
						textStyle : {
							color : 'red',
							fontSize : 10
						}
					},
					is3D : true,
				};
				//  alert(222);
				chart = new google.visualization.PieChart(document
						.getElementById('donutchart'));

				function selectQtyHandler() {
					// alert("hii");
					var selectedItem = chart.getSelection()[0];
					if (selectedItem) {
						// alert("hii selectedItem");
						i = selectedItem.row, 0;

						//alert("hii selectedItem" + chartsdata[i].catId);
						itemSellBillCal(chartsdata[i].catId);

					}
				}

				google.visualization.events.addListener(chart, 'select',
						selectQtyHandler);
				chart.draw(data1, options);

			});

		}
	</script>
	<script type="text/javascript">
		function drawAllCharts() {

			google.charts.load("current", {
				packages : [ "corechart" ]
			});
			google.charts.setOnLoadCallback(drawDonutChart);

			google.charts.load('current', {
				'packages' : [ 'corechart', 'bar' ]
			});
			google.charts.setOnLoadCallback(drawStuff);

			google.charts.load('current', {
				'packages' : [ 'corechart', 'line' ]
			});
			google.charts.setOnLoadCallback(drawlinechart);

			var type = document.getElementById("typesele").value;
			if (type == 4) {
				document.getElementById("ihide").style = "visible"
				document.getElementById("fromdatepicker").required = true;
				document.getElementById("todatepicker").required = true;
			} else {
				document.getElementById("ihide").style = "display:none"
				document.getElementById("fromdatepicker").required = false;
				document.getElementById("todatepicker").required = false;
			}

		}
	</script>
	<script type="text/javascript">
		function drawStuff() {
			//alert("hii bar ch");
			var frmd = document.getElementById("frmd").value;
			var tod = document.getElementById("tod").value;
			var chartDiv = document.getElementById('chart_div');
			//document.getElementById("chart_div").style.border = "thin dotted red";
			var dataTable = new google.visualization.DataTable();

			dataTable.addColumn('string', 'Date'); // Implicit domain column.
			dataTable.addColumn('number', 'Amount'); // Implicit data column.

			$.post('${getDatewiseSellList}', {
				frmd : frmd,
				tod : tod,
				ajax : 'true'
			}, function(chartsBardata) {

				//alert(JSON.stringify(chartsBardata));
				$.each(chartsBardata, function(key, chartsBardata) {

					dataTable.addRows([ [ chartsBardata.billDate,
							parseInt(chartsBardata.total) ] ]);

				});

				//alert(11);

				var materialOptions = {
						height:500,
					chart : {
						title : 'Sell Amount per Day',
						subtitle : ' '
					},
					series : {
						0 : {
							axis : 'distance'
						}, // Bind series 0 to an axis named 'distance'.
						1 : {
							axis : 'brightness'
						}
					// Bind series 1 to an axis named 'brightness'.
					},
					axes : {
						y : {
							distance : {
								label : 'Sell Amount'
							}, // Left y-axis.
							brightness : {
								side : 'right',
								label : 'Total Tax'
							}
						// Right y-axis.
						}
					}
				};

				var materialChart = new google.charts.Bar(chartDiv);

				function drawMaterialChart() {
					// var materialChart = new google.charts.Bar(chartDiv);
					// google.visualization.events.addListener(materialChart, 'select', selectHandler);    
					materialChart.draw(dataTable, google.charts.Bar
							.convertOptions(materialOptions));
					// button.innerText = 'Change to Classic';
					// button.onclick = drawClassicChart;
				}

				drawMaterialChart();

			});

		}
	</script>

	<script type="text/javascript">
		function drawlinechart() {
			//alert("hii bar ch");
			var frmd = document.getElementById("frmd").value;
			var tod = document.getElementById("tod").value;
			var typesele = document.getElementById("typesele").value;
			var chartDiv = document.getElementById('line_chart_div');
			//document.getElementById("chart_div").style.border = "thin dotted red";
			var dataTable = new google.visualization.DataTable();

			dataTable.addColumn('string', 'Date'); // Implicit domain column.
			dataTable.addColumn('number', 'Amount'); // Implicit data column.

			$.post('${drawLineChart}', {
				frmd : frmd,
				tod : tod,
				typeId : typesele,
				ajax : 'true'
			}, function(chartsBardata) {

				//alert(JSON.stringify(chartsBardata));
				$.each(chartsBardata, function(key, chartsBardata) {

					dataTable.addRows([ [ chartsBardata.billDate,
							parseInt(chartsBardata.total) ] ]);

				});

				//alert(11);

				var materialOptions = {
					chart : {
						title : 'Sell Amount per Day',
						subtitle : ' '
					},
					series : {
						0 : {
							axis : 'distance'
						}, // Bind series 0 to an axis named 'distance'.
						1 : {
							axis : 'brightness'
						}
					// Bind series 1 to an axis named 'brightness'.
					},
					axes : {
						y : {
							distance : {
								label : 'Sell Amount'
							}, // Left y-axis.
							brightness : {
								side : 'right',
								label : 'Total Tax'
							}
						// Right y-axis.
						}
					}
				};

				var materialChart = new google.charts.Bar(chartDiv);

				function drawMaterialChart1() {
					// var materialChart = new google.charts.Bar(chartDiv);
					// google.visualization.events.addListener(materialChart, 'select', selectHandler);    
					materialChart.draw(dataTable, google.charts.Bar
							.convertOptions(materialOptions));
					// button.innerText = 'Change to Classic';
					// button.onclick = drawClassicChart;
				}

				drawMaterialChart1();

			});

		}
	</script>

	<script type="text/javascript">
		function itemSellBillCal(id) {

			var frmd = document.getElementById("frmd").value;
			var tod = document.getElementById("tod").value;
			var flag = 1;
			$.post('${getItemSellBill}', {
				id : id,
				frmd : frmd,
				tod : tod,
				flag : flag,
				ajax : 'true'
			}, function(data) {

				//alert(JSON.stringify(data));
				$('#custCreditTable td').remove();

				var itemtotal = 0;

				for (var i = 0; i < data.length; i++) {
					itemtotal = itemtotal + parseFloat(data[i].total);
				}

				$.each(data, function(key, data) {

					var tr = $('<tr></tr>');

					tr.append($('<td ></td>').html(key + 1));
					tr.append($('<td ></td>').html(data.itemName));
					tr.append($('<td style="text-align: right;"></td>').html(
							data.qty));
					tr.append($('<td style="text-align: right;"></td>').html(
							parseFloat(data.total).toFixed(2)));
					var contri = (data.total / itemtotal) * 100;

					tr.append($('<td style="text-align: right;"></td>').html(
							contri.toFixed(2) + '%'));
					$('#custCreditTable tbody').append(tr);
				});

			});
			document.getElementById("catId").value = id;
		}
	</script>

	<script type="text/javascript">
		function itemSellBillCal2(flag) {

			//var flag = document.getElementById("typeSort").value;
			var tod = document.getElementById("tod").value;
			var frmd = document.getElementById("frmd").value;
			var id = document.getElementById("catId").value;
			$.post('${getItemSellBill}', {
				id : id,
				frmd : frmd,
				tod : tod,
				flag : flag,
				ajax : 'true'
			}, function(data) {

				//	alert(JSON.stringify(data));
				$('#custCreditTable td').remove();

				var itemtotal = 0;

				for (var i = 0; i < data.length; i++) {
					itemtotal = itemtotal + parseFloat(data[i].total);
				}

				$.each(data, function(key, data) {

					var tr = $('<tr></tr>');

					tr.append($('<td ></td>').html(key + 1));
					tr.append($('<td ></td>').html(data.itemName));
					tr.append($('<td style="text-align: right;"></td>').html(
							data.qty));
					tr.append($('<td style="text-align: right;"></td>').html(
							parseFloat(data.total).toFixed(2)));

					var contri = (data.total / itemtotal) * 100;

					tr.append($('<td style="text-align: right;"></td>').html(
							contri.toFixed(2) + '%'));

					$('#custCreditTable tbody').append(tr);
				});

			});

		}
	</script>
	<script type="text/javascript">
		function showDiv(typdId) {
			//alert("Id="+typdId);
			if (typdId == 4) {
				document.getElementById("ihide").style = "visible"
				document.getElementById("fromdatepicker").required = true;
				document.getElementById("todatepicker").required = true;
			} else {
				document.getElementById("ihide").style = "display:none"
				document.getElementById("fromdatepicker").required = false;
				document.getElementById("todatepicker").required = false;
			}

		}
	</script>

</body>
</html>
