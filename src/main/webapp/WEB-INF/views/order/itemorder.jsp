<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">

<!--rightNav
<script type="text/javascript">
jQuery(document).ready(function(){
	
	
	
});
</script>-->

<!--datepicker-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script>
	
	$(function() {
		
		var today = new Date();
		//today.setDate(today.getDate() -1);SaChin Comment 08-03-2021
		today.setDate(today.getDate());
		var dd = String(today.getDate()).padStart(2, '0');
		var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
		var yyyy = today.getFullYear();
		
		today = dd + '-' + mm + '-' + yyyy;
		
		$("#prevdatepicker").datepicker({
			dateFormat : 'dd-mm-yy',
			maxDate : today
		});
	});
</script>
<!--datepicker-->


<style>
.myInput1 {
	margin-top: 10px;
	margin-bottom: 0px;
	margin-left: 0px;
	padding: 5px 5px 5px 38px;
	width: 100%;
	background-position: 10px 10px;
	background-repeat: no-repeat;
	font-size: 14px;
}

.main-table tbody>tr:hover {
	background-color: #ffa;
}

.alert {
	padding: 15px;
	background-color: #f44336;
	color: white;
}

.closebtn {
	margin-left: 15px;
	color: white;
	font-weight: bold;
	float: right;
	font-size: 22px;
	line-height: 20px;
	cursor: pointer;
	transition: 0.3s;
}

.closebtn:hover {
	color: black;
}

a:link {
	color: black;
}

a:hover {
	color: black;
}
</style>



<c:url var="qtyValidation" value="/quantityValidation"></c:url>

<!--topLeft-nav-->
<div class="sidebarOuter"></div>
<!--topLeft-nav-->


<!--wrapper-start-->
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
			<div class="sidebarright">
				<c:choose>
					<c:when test="${isSameDayApplicable=='2'}">
						<c:if test="${not empty qtyMessage}">
							<div class="alert">
								<span class="closebtn"
									onclick="this.parentElement.style.display='none';">&times;</span>
								<strong>Alert!</strong> ${qtyMessage}
							</div>
						</c:if>
					</c:when>
				</c:choose>
				<div class="order-left">
					<h2 class="pageTitle">
						<i class="fa fa-birthday-cake" aria-hidden="true"></i>
						${menuTitle}
					</h2>
					<h3 class="pageTitle2">Order Date :
						${orderDate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Delivery Date :
						${deliveryDate}</h3>


					<form
						action="${pageContext.request.contextPath}/showSavouries/${con_index}"
						name="form2" method="get">
						<c:if test="${prevDateFlag==1}">
							<c:set var="prev_ord_del_date" value="${prevDate}">	</c:set>
						</c:if>
						
						<c:if test="${prevDateFlag==0}">
							<c:set var="prev_ord_del_date" value="${deliveryDate}">	</c:set>
						</c:if>
					
					
						<h3 class="pageTitle2">
							Previous Delivery Date: <input id="prevdatepicker" autocomplete="off"
								style="width: 30%" placeholder="Previous Order Date"
								name="prevdatepicker" type="text"
								class="texboxitemcode texboxcal" value="${prev_ord_del_date}"
								onchange="onChangePrevOrderDate(this.value,${con_index});"
								min="${prev_ord_del_date}"> <input type="submit" vlaue="submit" class="btn additem_btn">
						</h3>


					</form>


					<input type="hidden" name="menuId" value="${menuId}"> <input
						type="hidden" name="rateCat" value="${frDetails.frRateCat}">
					<input type="hidden" value="${isSameDayApplicable}"
						id="isSameDayApplicable" />

				</div>




				<div class="order-right">
					<div class="ordermto2px">
						<div class="orderclose">Order Closing Time :</div>
						<div class="ordercloser2">
							<span>${toTime}</span>
						</div>
					</div>
					<div class="ordermto20px">
						<div class="order-price">Total Amount :</div>
						<div class="order-amount">

							<fmt:formatNumber type="number" minFractionDigits="2"
								maxFractionDigits="2" value="${grandTotal}" />
						</div>


					</div>
				</div>

				<c:if test="${not empty message}">
					<!-- here would be a message with a result of processing -->
					<div class="messages messagesErr">${message}</div>
				</c:if>











				<form action="${pageContext.request.contextPath}/saveOrder"
					name="form1" method="post">
					<!-- <div class="col-md-9"></div>
					<label for="search" class="col-md-3" id="search"> <i
						class="fa fa-search" style="font-size: 20px"></i> <input
						type="text" id="myInput" onkeyup="myFunction()"
						style="border-radius: 25px;" placeholder="Search items by name"
						title="Type item name">
					</label> -->
					<input type="hidden" name="menuTitle" value="${menuTitle}">


					<!--tabNavigation-->
					<div class="cd-tabs" style="margin-top: 2px;">
						<!--tabMenu-->
						<nav>
							<ul class="cd-tabs-navigation">

								<c:forEach var="tab" items="${subCatListTitle}" varStatus="loop">


									<c:choose>
										<c:when test='${loop.index==0}'>
											<li><a data-content='${tab.name}' href="#0"
												class="selected"
												onClick="javascript:se_tab_id('${loop.index}')">${tab.header}</a></li>

										</c:when>
										<c:otherwise>
											<li><a data-content='${tab.name}' href="#0"
												onClick="javascript:se_tab_id('${loop.index}')">${tab.header}</a></li>

										</c:otherwise>
									</c:choose>


								</c:forEach>

							</ul>
						</nav>
						<!--tabMenu-->
						<ul class="cd-tabs-content">
							<!--tab1-->

							<c:forEach var="tabs" items="${subCatListTitle}" varStatus="loop">

								<c:choose>
									<c:when test='${loop.index==0}'>
										<li data-content='${tabs.name}' class="selected">
									</c:when>
									<c:otherwise>
										<li data-content='${tabs.name}'>
									</c:otherwise>
								</c:choose>





								<div class="col-md-9"></div>
								<label for="search" class="col-md-3" id="search"> <i
									class="fa fa-search" style="font-size: 20px"></i> <input
									class="myInput1" type="text" id="myInput${loop.index}"
									onkeyup="myFunction1(${loop.index})"
									style="border-radius: 25px;" placeholder="Search items by name"
									title="Type item name">
								</label>
								<div id="table-scroll" class="table-scroll responsive-table-one">
									<!-- class="table-scroll" -->

									<div id="faux-table" class="faux-table" aria="hidden">
										<!-- style="display:none" -->
										<table id="table_grid" class="main-table">
											<thead>
												<tr class="bgpink">
													<th style="text-align: center; white-space: nowrap; width: 40%;">Item Name</th>	
													<th style="text-align: center; white-space: nowrap;">Quantity</th>												
													<th style="text-align: center; white-space: nowrap;">Mul Quantity</th>
													<th style="text-align: center; white-space: nowrap;">Min Quantity</th>
													
													<th style="text-align: center; white-space: nowrap;">Max Quantity</th>
													
													<th style="text-align: center; white-space: nowrap;">MRP</th>
													<th style="text-align: center; white-space: nowrap;">Rate</th>
													<th style="text-align: center; white-space: nowrap;">Total</th>
													<c:choose>
														<c:when test="${menuIdFc eq menuIdShow}">
															<th class="col-md-1">Order1</th>
														</c:when>
													</c:choose>
												</tr>
											</thead>
										</table>

									</div>
									<div class="table-wrap">

										<table id="table_grid${loop.index}" class="responsive-table"
											style="margin: 0px;">
											<!--   class="main-table" -->
											<thead>
												<tr class="bgpink">
													<th style="text-align: center; white-space: nowrap;  width: 40%;">Item Name</th>
													<th style="text-align: center; white-space: nowrap;">Quantity</th>
													<th style="text-align: center; white-space: nowrap;">Mul Quantity</th>
													<th style="text-align: center; white-space: nowrap;">Min Quantity</th>
													<th style="text-align: center; white-space: nowrap;">Max Quantity</th>
													
													<th style="text-align: center; white-space: nowrap;">MRP</th>
													<th style="text-align: center; white-space: nowrap;">Rate</th>
													<th style="text-align: center; white-space: nowrap;">Total</th>
													<c:choose>
														<c:when test=" ${menuIdFc eq menuIdShow}">
															<th style="white-space: nowrap;">Order1</th>
														</c:when>
													</c:choose>
												</tr>
											</thead>
											<tbody>
												<c:set var="menuTime" value="${menu.timing}" />

												<c:forEach var="items" items="${itemList}" varStatus="loop">
													<c:if test="${items.subCatName eq tabs.name}">
													
																<tr>

																	<td style="text-align: left; max-width: 140px; white-space: nowrap;  overflow: hidden; text-overflow: ellipsis;">
  	
  <c:choose>
																			<c:when test="${items.itemImage!=''}">
																				<a href="${url}${items.itemImage}"
																					data-lightbox="image-1" tabindex="-1"
																					style="color: #000000;">${items.itemName} <c:if test="${menuDiscPer!=0}">
																	(Disc: ${menuDiscPer} %)
																	</c:if> </a>
																			</c:when>
																			<c:otherwise>
																	${items.itemName} <c:if test="${menuDiscPer!=0}">
																	(Disc: ${menuDiscPer} %)
																	</c:if> 
																	</c:otherwise>
																		</c:choose></td>

															<td style="text-align: center; white-space: nowrap;"><input
																name='${items.id}' id='${items.id}'
																value='${items.itemQty}' class="tableInput" type="text"
																onkeydown="myFunction()"
																onkeypress='return event.charCode >= 48 && event.charCode <= 57'
																onchange="onChange('${items.orderRate}',${items.id},'${items.itemGrp3}')">

																<input type="hidden" value="${items.minQty}"
																id="multipleqty${items.id}" />
																<input type="hidden" value="${items.minQuantity}"
																id="minqty${items.id}" />
															</td>

															<td style="text-align: center; white-space: nowrap;"><c:out
																			value='${items.minQty}' /></td>
															<td style="text-align: center; white-space: nowrap;"><c:out
																			value='${items.minQuantity}' /></td>
												
														<td style="text-align: center; white-space: nowrap;"><c:out
																			value='${items.itemGrp3}' /></td>
												
																	
																	<td style="text-align: center; white-space: nowrap;"><c:out
																			value='${items.orderMrp}' /></td>

																	<c:set var="rate" value="${items.orderRate}" />
																	<c:set var="qty" value="${items.itemQty}" />
																	<td style="text-align: center; white-space: nowrap;"><fmt:formatNumber
																			type="number" minFractionDigits="2"
																			maxFractionDigits="2" value="${rate}" /></td>
																
																	<td id="total${items.id}" style="white-space: nowrap;"
																		style="text-align: center;"><fmt:formatNumber
																			type="number" minFractionDigits="2"
																			maxFractionDigits="2" value="${rate * qty}" /></td>


																	<%-- <c:choose>
																		<c:when test="${menuIdFc eq menuIdShow}">

																			<c:choose>
																				<c:when test="${flagRes==1}">
																					<c:set var="orderQty" value="0" />
																					<c:forEach var="orderListRes" items="${orderList}"
																						varStatus="cnt">
																						<c:choose>
																							<c:when test="${orderListRes.id==items.id}">
																								<c:set var="orderQty"
																									value="${orderListRes.orderQty}" />
																							</c:when>

																						</c:choose>

																					</c:forEach>
																					<td style="white-space: nowrap;">A ${orderQty}</td>
																				</c:when>
																				<c:otherwise>
																					<td style="white-space: nowrap;">A 0</td>
																				</c:otherwise>
																			</c:choose>
																		</c:when>
																	</c:choose> --%>

																</tr>
														
													
														<%-- <c:choose>
															<c:when test="${frDetails.frRateCat=='1'}">
																<tr>

																	<td class="col-md-2" style="text-align: left;"><c:choose>
																			<c:when test="${items.itemImage!=''}">
																				<a href="${url}${items.itemImage}"
																					data-lightbox="image-1" tabindex="-1"
																					style="color: #000000;">${items.itemName} ${items.itemGrp3}</a>
																			</c:when>
																			<c:otherwise>
																	${items.itemName} ${items.itemGrp3}
																	</c:otherwise>
																		</c:choose></td>

																	<td class="col-md-1" style="text-align: center;"><c:set
																			value="0" var="temp"></c:set> <c:forEach var="shelf"
																			items="${itemStock}">

																			<c:if test="${temp==0}">
																				<c:if test="${shelf.id==items.id}">
																					<c:set value="1" var="temp"></c:set>
																					<c:out value='${shelf.itemShelfLife}' />

																				</c:if>
																			</c:if>
																		</c:forEach></td>

																	<td class="col-md-1" style="text-align: center;"><c:out
																			value='${items.minQty}' /></td>

																	<td class="col-md-1" style="text-align: right;"><c:set
																			value="0" var="temp"></c:set> <c:forEach var="stock"
																			items="${itemStock}">

																			<c:if test="${temp==0}">
																				<c:if test="${stock.id==items.id}">
																					<c:set value="1" var="temp"></c:set>
																					<c:out value='${stock.currentStock}' />

																				</c:if>
																			</c:if>
																		</c:forEach></td>


																	<td class="col-md-1" style="text-align: center;"><input
																		name='${items.id}' id='${items.id}'
																		value='${items.itemQty}' class="tableInput"
																		type="text" onkeydown="myFunction()"
																		onkeypress='return event.charCode >= 48 && event.charCode <= 57'
																		onchange="onChange('${items.itemRate1}',${items.id},'${items.itemGrp3}')">

																		<input type="hidden" value="${items.minQty}"
																		id="minqty${items.id}" /></td>
																	<td class="col-md-1" style="text-align: center;"><c:out
																			value='${items.itemMrp1}' /></td>


																	<td class="col-md-1" style="text-align: center;"><c:out
																			value='${items.itemRate1}' /></td>
																	<c:set var="rate" value="${items.itemRate1}" />
																	<c:set var="qty" value="${items.itemQty}" />
																	<td class="col-md-1" id="total${items.id}"
																		style="text-align: center;"><fmt:formatNumber
																			type="number" minFractionDigits="2"
																			maxFractionDigits="2" value="${rate * qty}" /></td>


																	<c:choose>
																		<c:when test="${menuIdFc eq menuIdShow}">

																			<c:choose>
																				<c:when test="${flagRes==1}">
																					<c:set var="orderQty" value="0" />
																					<c:forEach var="orderListRes" items="${orderList}"
																						varStatus="cnt">
																						<c:choose>
																							<c:when test="${orderListRes.id==items.id}">
																								<c:set var="orderQty"
																									value="${orderListRes.orderQty}" />
																							</c:when>

																						</c:choose>

																					</c:forEach>
																					<td class="col-md-1">A ${orderQty}</td>
																				</c:when>
																				<c:otherwise>
																					<td class="col-md-1">A 0</td>
																				</c:otherwise>
																			</c:choose>
																		</c:when>
																	</c:choose>

																</tr>
															</c:when>

															<c:when test="${frDetails.frRateCat=='2'}">
																<tr>

																	<td class="col-md-1" style="text-align: left;"><c:choose>
																			<c:when test="${items.itemImage!=''}">
																				<a href="${url}${items.itemImage}"
																					data-lightbox="image-1" tabindex="-1"
																					style="text-decoration: underline; color: #000000;">${items.itemName}${items.itemGrp3}</a>
																			</c:when>
																			<c:otherwise>
																	${items.itemName} ${items.itemGrp3}
																	</c:otherwise>
																		</c:choose></td>


																	<td class="col-md-1" style="text-align: center;"><c:set
																			value="0" var="temp"></c:set> <c:forEach var="shelf"
																			items="${itemStock}">

																			<c:if test="${temp==0}">
																				<c:if test="${shelf.id==items.id}">
																					<c:set value="1" var="temp"></c:set>
																					<c:out value='${shelf.itemShelfLife}' />

																				</c:if>
																			</c:if>
																		</c:forEach></td>

																	<td class="col-md-1" style="text-align: center;"><c:out
																			value='${items.minQty}' /></td>

																	<td class="col-md-1" style="text-align: right;"><c:set
																			value="0" var="temp"></c:set> <c:forEach var="stock"
																			items="${itemStock}">

																			<c:if test="${temp==0}">
																				<c:if test="${stock.id==items.id}">
																					<c:set value="1" var="temp"></c:set>
																					<c:out value='${stock.currentStock}' />

																				</c:if>
																			</c:if>
																		</c:forEach></td>




																	<td class="col-md-1" style="text-align: center;"><input
																		name='${items.id}' id='${items.id}'
																		value='${items.itemQty}' class="tableInput"
																		type="text"
																		onkeypress='return event.charCode >= 48 && event.charCode <= 57'
																		onchange="onChange('${items.itemRate2}',${items.id},'${items.itemGrp3}')">

																		<input type="hidden" value="${items.minQty}"
																		id="minqty${items.id}" /></td>
																	<td class="col-md-1" style="text-align: center;"><c:out
																			value='${items.itemMrp2}' /></td>

																	<td class="col-md-1" style="text-align: center;"><c:out
																			value='${items.itemRate2}' /></td>
																	<c:set var="rate" value="${items.itemRate2}" />
																	<c:set var="qty" value="${items.itemQty}" />
																	<td id="total${items.id}" style="text-align: center;"><fmt:formatNumber
																			type="number" minFractionDigits="2"
																			maxFractionDigits="2" value="${rate * qty}" /></td>
																	<c:choose>
																		<c:when test="${menuIdFc eq menuIdShow}">
																			<c:choose>
																				<c:when test="${flagRes==1}">
																					<c:set var="orderQty" value="0" />
																					<c:forEach var="orderListRes" items="${orderList}"
																						varStatus="cnt">
																						<c:choose>
																							<c:when test="${orderListRes.id==items.id}">
																								<c:set var="orderQty"
																									value="${orderListRes.orderQty}" />
																							</c:when>

																						</c:choose>

																					</c:forEach>
																					<td class="col-md-1">B ${orderQty}</td>
																				</c:when>
																				<c:otherwise>
																					<td class="col-md-1">B 0</td>
																				</c:otherwise>
																			</c:choose>
																		</c:when>
																	</c:choose>

																</tr>
															</c:when>

															<c:when test="${frDetails.frRateCat=='3'}">
																<tr>

																	<td class="col-md-1" style="text-align: left;"><c:choose>
																			<c:when test="${items.itemImage!=''}">
																				<a href="${url}${items.itemImage}"
																					data-lightbox="image-1" tabindex="-1"
																					style="text-decoration: underline; color: #000000;">${items.itemName} ${items.itemGrp3}</a>
																			</c:when>
																			<c:otherwise>
																	${items.itemName} ${items.itemGrp3}
																	</c:otherwise>
																		</c:choose></td>


																	<td class="col-md-1" style="text-align: center;"><c:set
																			value="0" var="temp"></c:set> <c:forEach var="shelf"
																			items="${itemStock}">

																			<c:if test="${temp==0}">
																				<c:if test="${shelf.id==items.id}">
																					<c:set value="1" var="temp"></c:set>
																					<c:out value='${shelf.itemShelfLife}' />

																				</c:if>
																			</c:if>
																		</c:forEach></td>

																	<td class="col-md-1" style="text-align: center;"><c:out
																			value='${items.minQty}' /></td>

																	<td class="col-md-1" style="text-align: right;"><c:set
																			value="0" var="temp"></c:set> <c:forEach var="stock"
																			items="${itemStock}">

																			<c:if test="${temp==0}">
																				<c:if test="${stock.id==items.id}">
																					<c:set value="1" var="temp"></c:set>
																					<c:out value='${stock.currentStock}' />

																				</c:if>
																			</c:if>
																		</c:forEach></td>


																	<td class="col-md-1" style="text-align: center;"><input
																		name='${items.id}' id='${items.id}'
																		value='${items.itemQty}' class="tableInput"
																		type="text"
																		onkeypress='return event.charCode >= 48 && event.charCode <= 57'
																		onchange="onChange('${items.itemRate3}',${items.id},'${items.itemGrp3}')">

																		<input type="hidden" value="${items.minQty}"
																		id="minqty${items.id}" /></td>
																	<td class="col-md-1" style="text-align: center;"><c:out
																			value='${items.itemMrp3}' /></td>

																	<td class="col-md-1" style="text-align: center;"><c:out
																			value='${items.itemRate3}' /></td>
																	<c:set var="rate" value="${items.itemRate3}" />
																	<c:set var="qty" value="${items.itemQty}" />
																	<td class="col-md-1" id="total${items.id}"
																		style="text-align: center;"><fmt:formatNumber
																			type="number" minFractionDigits="2"
																			maxFractionDigits="2" value="${rate * qty}" /></td>

																	<c:choose>
																		<c:when test="${menuIdFc eq menuIdShow}">
																			<c:choose>
																				<c:when test="${flagRes==1}">
																					<c:set var="orderQty" value="0" />
																					<c:forEach var="orderListRes" items="${orderList}"
																						varStatus="cnt">
																						<c:choose>
																							<c:when test="${orderListRes.id==items.id}">
																								<c:set var="orderQty"
																									value="${orderListRes.orderQty}" />
																							</c:when>

																						</c:choose>

																					</c:forEach>
																					<td class="col-md-1">${orderQty}</td>
																				</c:when>
																				<c:otherwise>
																					<td class="col-md-1">0</td>
																				</c:otherwise>
																			</c:choose>
																		</c:when>
																	</c:choose>
																</tr>
															</c:when>
														</c:choose> --%>

													</c:if>
												</c:forEach>

											</tbody>

										</table>
									</div>
								</div>






							</c:forEach>


						</ul>
					</div>
					<!--tabNavigation-->

					<!--<div class="order-btn"><a href="#" class="saveOrder">SAVE ORDER</a></div>-->
					<div class="order-btn textcenter">

						<input name="" id="subm" class="btn additem_btn" value="SAVE ORDER" type="button" ONCLICK="button1()" style="margin:0;" >
					</div>



				</form>

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
});


	</script>

<!--easyTabs-->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
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
           
            function button1()
            {
                var isSubmit=confirm("Do you want to save Order?");
                if(isSubmit==true){    
                	document.getElementById("subm").disabled = true;

                       form1.submit();
                }
                
    		/* 	if(isSameDayApplicable!=2)
    				{
    				   form1.submit();
    				}
    		else if(isSameDayApplicable==2)
    				{
   			   
    				  $.getJSON(
    							'${qtyValidation}',
    							{
    								
    								ajax : 'true'
    							},
    							function(data) {
    							
    							//	alert(data.error);
        							
   								if (data.error) {
   								//	alert("hii");
    									alert(data.message);
    									 window.location.reload();
    								
    								}
    								else
    								{
    									 form1.submit();
    								
    								}	
    							});
    				}   
 */
            }    
           
        </script>





<script type="text/javascript">
		function onChange(rate,id,ordLimit) {

			//calculate total value  
			var qty = $('#'+id).val();
			//alert(qty)
		
			
			
			var minqty = $('#minqty'+id).val();
			var multipleqty = $('#multipleqty'+id).val();
			
			//alert("Qty"+qty)
			//alert("min Qty"+minqty)
			//alert("Multiple"+multipleqty)
			if(qty % multipleqty==0){
			    var total = rate * qty;
			
			   $('#total'+id).html(total.toFixed(2));
			}else
			{
				 var total =0;
				 
				alert("Please Enter Qty Multiple of"+multipleqty);
				$('#'+id).val('0');
				
				$('#total'+id).html(total);
				$('#'+id).focus();
			}
			
			
			
			if(parseInt(qty)>parseInt(ordLimit)){
				var total =0;
				alert("Order Qty Limit Exceeds");
				$('#'+id).val('0');
			
				$('#total'+id).html(total);
				
				$('#'+id).focus();
				
			}
			
			
		 if(parseInt(minqty) > parseInt(qty)){
				
				var total =0;
				alert("Plase Enter Minimum Order Qty");
				$('#'+id).val('0');
			
				$('#total'+id).html(total);
				
				$('#'+id).focus();
				
			} 
			
			
			
			
		}
	</script>


<script type="text/javascript">
		function onKeyDown(id) {
			alert("alert");
			var e = $('#'+id).val();
			
			if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
		             // Allow: Ctrl/cmd+A
		            (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
		             // Allow: Ctrl/cmd+C
		            (e.keyCode == 67 && (e.ctrlKey === true || e.metaKey === true)) ||
		             // Allow: Ctrl/cmd+X
		            (e.keyCode == 88 && (e.ctrlKey === true || e.metaKey === true)) ||
		             // Allow: home, end, left, right
		            (e.keyCode >= 35 && e.keyCode <= 39)) {
		                 // let it happen, don't do anything
		                 return;
		        }
		        // Ensure that it is a number and stop the keypress
		        if (((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105))) {
		            e.preventDefault();
		        }
		   
			
		}
</script>
<script type="text/javascript">
$(document).ready(function() {
    $("#5").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl/cmd+A
            (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
             // Allow: Ctrl/cmd+C
            (e.keyCode == 67 && (e.ctrlKey === true || e.metaKey === true)) ||
             // Allow: Ctrl/cmd+X
            (e.keyCode == 88 && (e.ctrlKey === true || e.metaKey === true)) ||
             // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if (((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105))) {
            e.preventDefault();
        }
    });
});
</script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>

<script>
function sortTable() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById("table_grid1");
  switching = true;
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.getElementsByTagName("TR");
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[0];
      y = rows[i + 1].getElementsByTagName("TD")[0];
      //check if the two rows should switch place:
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        //if so, mark as a switch and break the loop:
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
</script>
<script>
function reload() {
    location.reload();
}
</script>
<script>
	function myFunction1(index) {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput"+index);
		filter = input.value.toUpperCase();
		table = document.getElementById("table_grid"+index);
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
	
	function myFunction() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("table_grid1");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
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



<script>

function onChangePrevOrderDate(date,index){
	
	
	//alert("Date - "+date+"    index - "+index);
	
	
}
</script>




</body>
</html>
