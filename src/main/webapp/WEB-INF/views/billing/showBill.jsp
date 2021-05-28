

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
table, th, td {
	border: 1px solid #9da88d;
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

<link
	href="${pageContext.request.contextPath}/resources/css/monginis.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/custom.css"
	rel="stylesheet" type="text/css" />

<!--rightNav-->




</head>
<body>
 --%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>


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

<!--topLeft-nav-->
<div class="sidebarOuter"></div>
<!--topLeft-nav-->

<!--wrapper-start-->
<div class="wrapper">

	<!--topHeader-->
	<c:url var="findAddOnRate" value="/getAddOnRate" />
	<c:url var="findItemsByCatId" value="/getFlavourBySpfId" />
	<c:url var="findAllMenus" value="/getAllTypes" />
	<c:url value="/updateMultiBillStatus" var="updateMultiBillStatus" ></c:url>
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
				<!-- <div class="order-left">
						<h2 class="pageTitle">Bills</h2>
						<h3 class="pageTitle2">Order Date : 22-02-2017 </h3>
					</div> -->

				<form name="frm_search" id="frm_search" method="post"
					action="${pageContext.request.contextPath}/showBillProcess">
					<input type="hidden" name="mod_ser" id="mod_ser"
						value="search_result">
						
						
						<div class="title_row">
					<div class="title_l">
							<h2 class="pageTitle" style="margin:0; padding: 0;"><i class="fa fa-money "></i> Purchase Bill Details</h2>
					</div>
					<div class="title_r">
						<form id="validation-form">
 <input type="hidden" value="${gstType}" name="type" id="type"/>

					<div class="colOuter">
						<!-- copy div kalpesh -->

						<div class="frm_l_one">
						<div class="frm_l">From </div>
						<div class="frm_r_one">
							<input id="fromdatepicker" class="texboxitemcode texboxcal"
								placeholder="From Date" name="from_datepicker"  autocomplete="off" type="text" value="${fromDate}">
						</div>
						</div>
						
						<div class="frm_l_one">
						<div class="frm_l">To </div>
						<div class="frm_r_one">
							<input id="todatepicker" class="texboxitemcode texboxcal"
								placeholder="To Date" name="to_datepicker" autocomplete="off" type="text" value="${toDate}">
						</div>
						</div>
						
						



						
						
						<div class="frm_single">
						<input name="" class="btn additem_btn" value="Search"
								type="submit" align="center" style="margin: 0;">
								
						
								
							

						</div>

					</div>
					</div>
					<div class="clr"></div>
				</div>
						
						

					
						
					

				</form>

				

				<div class="clearfix"></div>
				
				<div class="tableFixHead">
					<table id="table_grid">         
					<thead style="background-color: #f3b5db;">
						<tr class="bgpink">
							<th style="text-align: center; white-space: nowrap;">
							<input type="checkbox" name="selAll" id="selAllChk"  onclick="selAll()" style="display: inline-block !important; margin: 0 3px;" />
							Invoice No </th>
							<th style="text-align: center; white-space: nowrap;">Date</th>
							<th style="text-align: center; white-space: nowrap;">Taxable Amt</th>
							<th style="text-align: center; white-space: nowrap;">Tax Amt</th>
							<th style="text-align: center; white-space: nowrap;"> Total</th>
							<th style="text-align: center; white-space: nowrap;">Status</th>
							<th style="text-align: center; white-space: nowrap;">Date & Time</th>
							<th style="text-align: center; white-space: nowrap;">Action</th>
						</tr>
					</thead>
					
					<c:forEach items="${billHeader}" var="billHeader"
									varStatus="count">
									<tr>
										<td style="text-align: center; white-space: nowrap;">
										<input type="checkbox" class="chkcls" name="chkcls" id="catCheck+${billHeader.billNo}" value="${billHeader.billNo}" style="display: inline-block !important; margin: 0 3px;">
										<c:out value="${billHeader.invoiceNo}" />
											</td>
										<td style="text-align: left; white-space: nowrap;"><c:out
												value="${billHeader.billDate}" /></td>
										<td style="text-align: right; white-space: nowrap;"><c:out
												value="${billHeader.taxableAmt}" /></td>
										<td style="text-align: right; white-space: nowrap;"><c:out
												value="${billHeader.totalTax}" /></td>
										<td style="text-align: right; white-space: nowrap;"><c:out
												value="${billHeader.grandTotal}" /></td>
										<%-- 	<td><c:out value="${billHeader.status}" /></td> --%>
										<c:choose>
											<c:when test="${billHeader.status==1}">
												<td style=" text-align: center; white-space: nowrap; ">
												<span class="label label-danger"style="font-size: 14px;padding-top: 3px;">
												<c:out value="Pending"></c:out></span></td>
											</c:when>
											<c:when test="${billHeader.status==2}">
												<td style=" text-align: center; white-space: nowrap; ">
												<span class="label label-success"style="font-size: 14px;padding-top: 3px;">
												<c:out value="Received"></c:out></span></td>
											</c:when>
											<c:when test="${billHeader.status==3}">
												<td style=" text-align: center; white-space: nowrap; ">
												<span class="label label-default"style="font-size: 14px;padding-top: 3px;">
												<c:out value="GVN Apply"></c:out></span></td>
											</c:when>
											<c:when test="${billHeader.status==4}">
												<td style=" text-align: center; white-space: nowrap; ">
												<span class="label label-primary"style="font-size: 14px;padding-top: 3px;">
												<c:out value="GVN Approve"></c:out></span></td>
											</c:when>
											<c:when test="${billHeader.status==5}">
												<td style=" text-align: center; white-space: nowrap; ">
												<span class="label label-info"style="font-size: 14px;padding-top: 3px;">
												<c:out value="GRN Apply"></c:out></span></td>
											</c:when>
											<c:when test="${billHeader.status==6}">
												<td style=" text-align: center; white-space: nowrap; ">
												<span class="label label-warning"style="font-size: 14px;padding-top: 3px;">
												<c:out value="GRN Approve"></c:out></span></td>
											</c:when>
											<c:when test="${billHeader.status==7}">
												<td style=" text-align: center; white-space: nowrap; ">
												<span class="label label-default"style="font-size: 14px;padding-top: 3px;">
												<c:out value="Closed"></c:out></span></td>
											</c:when>

										</c:choose>
										<td style="text-align: left; white-space: nowrap;">
										<fmt:parseDate var="parsedDate" value="${billHeader.remark}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                       <fmt:formatDate var="newFormattedDateString" value="${parsedDate}" pattern="dd-MM-yyyy hh:mm a"/>
										<c:out value="${newFormattedDateString}" /></td>
										<td style="text-align: center; white-space: nowrap;">
												<a
													href="${pageContext.request.contextPath}/showBillDetailProcess/?billNo=${billHeader.billNo}&billDate=${billHeader.billDate}&billStatus=${billHeader.status}&grandTotal=${billHeader.grandTotal}&Inv=${billHeader.invoiceNo}" target="_blank"
													class="fa fa-info"></a>&nbsp;&nbsp;
													 <a
													href="${pageContext.request.contextPath}/billPdf?url=pdf/showBillPdf/By-Road/0/${billHeader.billNo}"	class="fa fa-file-pdf-o" target="_blank"></a>
							 			
											</td>
										<c:set var="billNo" value="${billHeader.billNo}" />
									</tr>
								</c:forEach>
					</table>
					
					
				</div>
				
				<div class="btn_l"> <input name="" class="btn additem_btn" value="Received" style="margin: 15px; border:none;" 
					type="button" id="updateStatus" onclick="updateStatus()">
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
<script>
function updateStatus() {
	
	var elemntIds = [];										
	
	$(".chkcls:checkbox:checked").each(function() {
		elemntIds.push($(this).val());
	});
	if(elemntIds==""){
		alert("Select Atleast One Bill!!!");
	}else{
		$.post('${updateMultiBillStatus}', {
			billNos:JSON.stringify(elemntIds),
			 ajax : 'true'
		   }, function(data) {
			  alert(data.message)
			   window.location.reload();
		   });
	}
	
	
	
	
}

/*function selAll(){
 	alert("All")
	  var ele=document.getElementsByName('chkcls');  
    for(var i=0; i<ele.length; i++){  
        if(ele[i].type=='checkbox')  
            ele[i].checked=true;  
    } 
}*/  
</script>
<script>
$(document).on('click','#selAllChk',function(){
	//alert()
	var ele=document.getElementsByName('chkcls');  
  
	var flag=$('#selAllChk').prop('checked');
	  if(flag){
	  //	$('.chkcls').attr("checked",true)
	    for(var i=0; i<ele.length; i++){  
	        if(ele[i].type=='checkbox')  
	            ele[i].checked=true;  
	    } 
	  }
	  else
	  {
	  //$('.chkcls').attr("checked",false)
		  for(var i=0; i<ele.length; i++){  
		        if(ele[i].type=='checkbox')  
		            ele[i].checked=false;  
		    } 
	  }  
	   });
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
	

</body>
</html>
