



<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loader.css">
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<script>
	$(function() {
		$("#fromdatepicker").datepicker({ dateFormat: 'dd-mm-yy' });
	});
	
</script>
<style>
table, th, td {
	border: 1px solid #9da88d;
}
</style>

<style>
.fileUpload {
     margin: 0px 0px 0px 0px;
    padding-top: 1px;
}
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 555; /* Sit on top */
	padding-top: 60px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 8px 20px 20px 20px;
	border: 1px solid #888;
	width: 30%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

#overlay2 {
	position: fixed;
	display: none;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(239, 219, 219, 0.5);
	z-index: 9992;
	cursor: pointer;
}

#text2 {
	position: absolute;
	top: 50%;
	left: 50%;
	font-size: 25px;
	color: white;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}

.itemDummyClass {
	cursor: pointer;
}

.def_customer {
	display: none;
}
	</style>
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


			<c:url var="getGrnData" value="/getGrnData" />



			<!--leftNav-->

			<jsp:include page="/WEB-INF/views/include/left.jsp">
				<jsp:param name="myMenu" value="${menuList}" />

			</jsp:include>


			<!--leftNav-->
			<!--rightSidebar-->

			<!-- Place Actual content of page inside this div -->
			<div class="sidebarright">


				<%-- 	<form
								action="${pageContext.request.contextPath}/insertGrnProcess"
								name="validation_form" id="validation_form" method="post">
								
 --%>
				<c:if test="${not empty alert}">
					<!-- here would be a message with a result of processing -->
					<div class="messages messagesErr">${alert}</div>
				</c:if>
				<div class="row">
					<div class="col-md-12">
						<h3 class="pageTitle">Request GRN</h3>
						<form action="${pageContext.request.contextPath}/showGrn"
							name="search_form" id="search_form" method="get">
							<div class='colOuter' style="float: right;">
								<div class="col1" style="width: 10%;">Select Date</div>
								<div class="col1" style="width: 19.333333%;">
									<input id="fromdatepicker" class="texboxitemcode texboxcal "
										style="width: 250px;" autocomplete="off"
										placeholder="Search Date" name="searchDate" type="text"
										value="${searchDate}">
								</div>
								<div class="col1">
									<input type="submit" name="" class="buttonsaveorder"
										value="Search">
								</div>
								<div class="col1" style="float: right; width: 13.333333%;">
									<a href='${pageContext.request.contextPath}/showGrn'> <input
										type="button" name="" class="buttonsaveorder"
										value="Todays GRN"></a>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h2 class="pageTitle"><i class="fa fa-refresh" aria-hidden="true"></i>GRN Based on Stock</h2>
					</div>
				</div>
<div class="row">
					<div class="col-md-12">
						<div align="center" id="loader" style="display: none;">
							<span>
								<h4>
									<font color="#343690">Loading</font>
								</h4>
							</span> <span class="l-1"></span> <span class="l-2"></span> <span
								class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
							<span class="l-6"></span>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
				<form action="${pageContext.request.contextPath}/insertGrnProcess"
					name="validation_form" id="vf" method="post">
<c:set var="flag" value="0" />

					<div id="table-scroll">
						<!-- class="table-scroll"> -->
						<div id="faux-table" class="faux-table" aria="hidden"
							style="display: none;"></div>
						<div class="table-wrap">
							<table id="table_grid1" class="main-table">
								<thead>
									<tr class="bgpink">
										<!--	<th class="col-md-1">Invoice No</th>
										<th class="col-md-3">Name</th>
										<th class="col-md-2">Type</th>
										<th class="col-md-1">QTY</th>
										<th class="col-md-1">Bill Rate</th>
										<th class="col-md-1">Grn Rate</th>
										<th class="col-md-1">Edit Qty</th>
										<th class="col-md-1">Tax %</th>
										<th class="col-md-1">Taxable Amt</th>
										<th class="col-md-1">Tax Amt</th>
										<th class="col-md-1">Total Amt</th>
										<th class="col-md-1">Remark</th>-->
									</tr>

								</thead>
								<tbody>
							</table>
							<div class="table-wrap">
								<table id="table_grid" class="responsive-table">
									<!-- class="main-table"> -->
									<thead>
										<tr class="bgpink">
											<th class="col-md-2" style="text-align: center;">Invoice
												Date</th>
											<th class="col-md-2" style="text-align: center;">Invoice
												No</th>
											<th class="col-md-2" style="text-align: center;">Name</th>
											<th class="col-md-2" style="text-align: center;">Type</th>
											<th class="col-md-1" style="text-align: center;">Qty</th>
											<th class="col-md-1" style="text-align: center;">Rate</th>
											<!-- 	<th class="col-md-1">Grn Rate</th> -->
											<th class="col-md-1" style="text-align: center;">Edit
												Qty</th>
											<!-- <th class="col-md-1" style="text-align: center;">Tax %</th>
											<th class="col-md-1" style="text-align: center;">Taxable
												Amt</th>
											<th class="col-md-1" style="text-align: center;">Tax Amt</th> -->
											<th class="col-md-1" style="text-align: center;">Amount</th>
											<th class="col-md-1" style="text-align: center;">Remark</th>
										</tr>

									</thead>
									<tbody>


										<%-- 	
							<form
								action="${pageContext.request.contextPath}/insertGrnProcess"
								name="grn" id="grn" method="post">
								 --%>

										<c:forEach items="${grnConfList}" var="grnConfList"
											varStatus="count">
												<c:set var="flag" value="1" />
											<tr>

												<td class="col-md-1" style="text-align: center;"><fmt:formatDate
														pattern="dd-MM-yyyy" value="${grnConfList.billDate}" /></td>
												<td class="col-md-1" style="text-align: center;"><c:out
														value="${grnConfList.invoiceNo}"></c:out></td>
												<td class="col-md-3" style="text-align: center;"><c:out
														value="${grnConfList.itemName}"></c:out></td>
														<td class="col-md-1" style="text-align: center;"><c:out
																value="${grnConfList.grnType}"></c:out></td>
												<%-- <c:choose>
													<c:when test="${grnConfList.grnType==0}">
														<td class="col-md-1" style="text-align: center;"><c:out
																value="GRN 1(85%)"></c:out></td>
													</c:when>
													<c:when test="${grnConfList.grnType==1}">
														<td class="col-md-1" style="text-align: center;"><c:out
																value="GRN 2(75%)"></c:out></td>
													</c:when>
													<c:when test="${grnConfList.grnType==2}">
														<td class="col-md-1" style="text-align: center;"><c:out
																value="GRN 3(100%)"></c:out></td>
													</c:when>
													<c:when test="${grnConfList.grnType==3}">
														<td class="col-md-1" style="text-align: center;"><c:out
																value="No GRN"></c:out></td>
													</c:when>

													<c:when test="${grnConfList.grnType==4}">
														<td class="col-md-1" style="text-align: center;"><c:out
																value="GRN 3(100%)"></c:out></td>
													</c:when>
													<c:otherwise>
														<c:out value="No GRN"></c:out>
													</c:otherwise>

												</c:choose> --%>

												<td class="col-md-1" style="text-align: center;"><c:out
														value="${grnConfList.autoGrnQty}"></c:out> <input
													type="hidden" name="grnqty${grnConfList.billDetailNo}"
													id="grnqty${grnConfList.billDetailNo}" size="3"
													readonly="readonly" value="${grnConfList.autoGrnQty}" /></td>

												<td class="col-md-1" style="text-align: center;"
													id="grn_rate${grnConfList.billDetailNo}"><c:out
														value="${grnConfList.rate}"></c:out></td>


												<td class="col-md-1" style="text-align: center;"><input
													type="text" name="grnqtyauto${grnConfList.billDetailNo}"
													value="${grnConfList.autoGrnQty}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													id='grnqtyauto${grnConfList.billDetailNo}' size="3"
													onkeyup="calcGrn(${grnConfList.grnType},${grnConfList.rate},${grnConfList.itemId},
																	${grnConfList.sgstPer},${grnConfList.cgstPer},${grnConfList.cessPer},${grnConfList.autoGrnQty},${grnConfList.billDetailNo},${grnConfList.discPer},this.value)" />


												</td>

												<%-- <td class="col-md-1" style="text-align: center;"
													id="tax_per${grnConfList.billDetailNo}"><c:out
														value="${grnConfList.taxPer+grnConfList.cessPer}"></c:out></td>

												<fmt:formatNumber var="taxableAmt" type="number"
													minFractionDigits="2" maxFractionDigits="2"
													value="${grnConfList.taxableAmt}" />

												<c:set var="taxableAmt" value="${taxableAmt}" />

												<td id='taxable_amt${grnConfList.billDetailNo}'
													style="text-align: center;" class="col-md-1">${taxableAmt}</td>


												<td style="text-align: center;"
													id='tax_amt${grnConfList.billDetailNo}' class="col-md-1">
													<fmt:formatNumber type="number" minFractionDigits="2"
														maxFractionDigits="2" value="${grnConfList.taxAmt}" />
												</td> --%>

												<fmt:formatNumber var="grnAmt" type="number"
													minFractionDigits="2" maxFractionDigits="2"
													value="${grnConfList.grnAmt}" />

												<c:set var="grnAmt" value="${grnAmt}" />

												<td style="text-align: center;" class="col-md-1"
													id="grn_amt${grnConfList.billDetailNo}"><c:out
														value="${grnAmt}"></c:out></td>

												<td id="grn_remark_other${grnConfList.billDetailNo}"
													style="text-align: center;" class="col-md-1"><select
													name="grn_remark${grnConfList.billDetailNo}"
													style="width: 200px" required="required"
													id="grn_remark${grnConfList.billDetailNo}"
													class="form-control"
													onchange="changeQty(${grnConfList.billDetailNo},${grnConfList.autoGrnQty},this.value)">
														<option value="0">Goods Expired</option>
														<c:forEach items="${remarkList}" var="remarkList">
																${remarkList.remark}
																<option value="${remarkList.remark}">${remarkList.remark}</option>
														</c:forEach>
												</select></td>

											</tr>
										</c:forEach>


									</tbody>

								</table>
							</div>
						</div>
					</div>

					<c:choose>
						<c:when test="${isOpen==1 || flag==0}">
							<input type="submit" class="btn btn-primary" id="submit"
								value="Save" disabled>

						</c:when>
						<c:otherwise>
							<input type="submit" class="btn btn-primary" id="submit"
								value="Save" onclick="setValue(1)"  >
								 <button class="addcust_open btn btn-primary" type="submit" onclick="setValue(0)"
						 >Preview 
				 
						</button>
						</c:otherwise>
					</c:choose>


					<input type="hidden" id="isSaveOrPreview" name="isSaveOrPreview" value="0">

				</form>
				
				<div id="addEmpModal" class="modal">
		<div id="overlay">
			<div class="clock"></div>
		</div>

		<div class="modal-content" style="width: 75%">
			<span class="close" onclick="closeNewCustPopUp()" style="opacity: 2;">&times;</span>

			<h3 class="pageTitle">Preview GRN Save</h3>
			
			<div>
				<div class="row">
						<div class="col-lg-12">
						
						<table id="table_grid_preview" class="responsive-table">
									<!-- class="main-table"> -->
									<thead>
										<tr class="bgpink">
											<th class="col-md-2" style="text-align: center;">Invoice
												Date</th>
											<th class="col-md-2" style="text-align: center;">Invoice
												No</th>
											<th class="col-md-2" style="text-align: center;">Name</th>
											<th class="col-md-2" style="text-align: center;">Type</th>
											<th class="col-md-1" style="text-align: center;">Rate</th>
											<!-- 	<th class="col-md-1">Grn Rate</th> -->
											<th class="col-md-1" style="text-align: center;">Edit
												Qty</th>
											
										</tr>

									</thead>
									<tbody>
									
									</tbody>
									</table>
									
						</div>
				</div>
			</div>

			<!-- <div class="pop_btns">
				<div class="close_l" style="text-align: center;">
					<input type="submit" class="btn additem_btn" id="saveCust" value="Save Cust" onclick="addCustomer()">
					<button class="btn additem_btn" onclick="closeNewCustPopUp()" id="cls_btn">Close</button>
				</div>				
				<div class="clr"></div>
			</div> -->

		</div>


	</div>
			</div>
			<!--table end-->


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
<script type="text/javascript">
function setValue(valueP){
	document.getElementById("isSaveOrPreview").value=valueP;
}
		$(document).ready(function (e) {
			 $("#vf").on('submit',(function(e) {
				 try{
				 e.preventDefault();
				  $('#loader').show();
				var valueP=  document.getElementById("isSaveOrPreview").value
				  
				  if(parseInt(valueP)==0){
					  destUrl="${pageContext.request.contextPath}/getGrnPreview";
					  openNewCustPopUp();
				  }else{
					  destUrl="${pageContext.request.contextPath}/insertGrnProcess";
					  document.getElementById("submit").setAttribute("disabled",true); 
				  }
				
			  $.ajax({
			         url:destUrl,// "${pageContext.request.contextPath}/getGrnPreview",
			   type: "POST",
			   data:  new FormData(this),
			   contentType: false,
			         cache: false,
			   processData:false,
			   beforeSend : function()
			   {
			   },
			   success: function(data)
			      {
			    if(data=='invalid')
			    {
			    }
			    else
			    {
			    	if(parseInt(valueP)==0){
			    		
			    	
			    	len=data.length;
					$('#table_grid_preview td').remove();
					for(var x=0; x<len;x++){
						if(parseFloat(data[x].enteredQty)>0){
					var tr = $('<tr ></tr>');
					tr .append($('<td class="col-md-1"></td>').html(data[x].billDate));
					tr .append($('<td class="col-md-1"></td>').html(data[x].invoiceNo));
					tr .append($('<td class="col-md-1"></td>').html(data[x].itemName));
					tr .append($('<td class="col-md-1"></td>').html(data[x].grnType));
					tr .append($('<td class="col-md-1"></td>').html(data[x].rate));
					tr .append($('<td class="col-md-1"></td>').html(data[x].enteredQty));
					$('#table_grid_preview tbody')
					.append(tr);
						}
					}
			    	}else{
			    		alert("GRN Saved Successfully")
			    		window.open("${pageContext.request.contextPath}/displayGrn","_self");
			    	}
					 $('#loader').hide();
			    }
			      },
			     error: function(e) 
			      {
			    	  $('#loader').hide();
			      }          
			    });
			 }catch (e) {
				alert(e);
				$('#loader').hide();
				  $('#loader').hide();
			}
			 }));
			});
		</script>
<script type="text/javascript">

function getGRNPreview(){
	try{
	openNewCustPopUp();
	 var fd=new FormData();
		fd.append('OKKKK',"lllL");
	$('#loader').show();
	$.ajax({
	url : '${pageContext.request.contextPath}/getGrnPreview',
	type : 'post',
	dataType : 'json',
	data : fd,
	contentType : false,
	processData : false,
	success: function(data, textStatus, jqXHR){
		len=data.length;
		$('#table_grid_preview td').remove();
		for(var x=0; x<len;x++){
			if(parseFloat(data[x].enteredQty)>0){
		var tr = $('<tr ></tr>');
		tr .append($('<td class="col-md-1"></td>').html(data[x].billDate));
		tr .append($('<td class="col-md-1"></td>').html(data[x].invoiceNo));
		tr .append($('<td class="col-md-1"></td>').html(data[x].itemName));
		tr .append($('<td class="col-md-1"></td>').html(data[x].grnType));
		tr .append($('<td class="col-md-1"></td>').html(data[x].rate));
		tr .append($('<td class="col-md-1"></td>').html(data[x].enteredQty));
		$('#table_grid_preview tbody')
		.append(tr);
			}
		}
	},
	})
	$('#loader').hide();
	}catch (e) {
		alert(e)
	}
}
function openNewCustPopUp() {

	var modal = document.getElementById("addEmpModal");
	modal.style.display = "block";

}

function closeNewCustPopUp() {

	var modal = document.getElementById("addEmpModal");
	modal.style.display = "none";	
}
	
	/*  function showEdit(id,itemId,autoGrnQty) {
		
		 var x=$("#is_edit"+itemId).val();
		 
		if(x == 1){
		 
			 $("#grnqtyauto"+itemId).removeAttr("readonly"); 
	    
		}
		if(x== 0)
			{
			$("#grnqtyauto"+itemId).html(autoGrnQty);

			 $("#grnqtyauto" +itemId).setAttr("readonly"); 
			// document.getElementById("grnqtyauto"+itemId).prop="disabled"; 
			
			}
	} */
	</script>

<script type="text/javascript">
	
	function changeQty(billDetailNo,autoQty,remark){
	
		
	//	var remark = document.getElementById("grn_remark"+billDetailNo).value;
    /* 	 if(remark=='Other'){
   		$("#grn_remark_other"+billDetailNo).append("<input type='text'  required id='grn_remark_text"+billDetailNo+"' name='grn_remark_text"+billDetailNo+"' >");
		  }
	  else{
		          $('#grn_remark_text'+billDetailNo).remove();
		  } */
		
	 //	alert(remark);
	 	if(remark==0){
			    document.getElementById("grnqtyauto"+billDetailNo).value=autoQty;
	 	}else{
			// $("#grnqtyauto"+billDetailNo).removeAttr("readonly"); //change
	 	}
		 
	}
	
	</script>

<script type="text/javascript">
	
	function calcGrn(grnType,rate,itemId,sgstPer,cgstPer,cessPer,autoQty,billDetailNo,discPer,grnQty){
		
	
		var baseRate=rate*100/(sgstPer+cgstPer+cessPer+100);
	
		var grnBaseRate;
		
		var grnRate;
		//var grnQty=$("#grnqtyauto"+billDetailNo).val();
		//alert(grnQty);
		if(parseInt(grnQty)>autoQty){
			alert("Edit Quantity can not be greater than Auto Quantity");
			document.getElementById("grnqtyauto"+billDetailNo).value=autoQty;
			//calcGrn(grnType,rate,itemId,sgstPer,cgstPer,autoQty)
		}else{
			var grnRate=$("#grn_rate"+billDetailNo).text();
			grnBaseRate = parseFloat(baseRate) *parseFloat(grnType) / 100;
			grnRate=(rate * grnType) / 100;
		/*if(grnType==0){
			
		
			
			
			var grnRate=$("#grn_rate"+billDetailNo).text();
		
			grnBaseRate = baseRate * 85 / 100;
			
			 grnRate=(rate * 85) / 100;
			
			//var grnAmt=parseFloat(grnQty)*parseFloat(grnRate);
			//grnAmt=grnAmt*85/100;	
			//$("#grn_amt"+itemId).html(grnAmt.toFixed(2));
		
		}
	 if(grnType==1){

		// var grnQty=$("#grnqtyauto"+itemId).val();
			
			
			var grnRate=$("#grn_rate"+billDetailNo).text();
			
			grnBaseRate = baseRate * 75 / 100;
			
			grnRate=(rate * 75) / 100;
			
			//var grnAmt=parseFloat(grnQty)*parseFloat(grnRate);
			//grnAmt=grnAmt*75/100;	
			//$("#grn_amt"+itemId).html(grnAmt.toFixed(2));
		
			}
			if(grnType==2){
			
			
			//var grnQty=$("#grnqtyauto"+itemId).val();
			
			
			
			var grnRate=$("#grn_rate"+billDetailNo).text();
			
			grnBaseRate=baseRate;
			grnRate=rate;
			
			   
			//var grnAmt=parseFloat(grnQty)*parseFloat(grnRate);
			
			//$("#grn_amt"+itemId).html(grnAmt.toFixed(2));
		
			}
			
			if(grnType==4){
				
				//var grnQty=$("#grnqtyauto"+itemId).val();
				var grnRate=$("#grn_rate"+billDetailNo).text();
				grnBaseRate=baseRate;
				grnRate=rate;
				
				}*/
			
		    var totTaxPer=parseFloat(sgstPer)+parseFloat(cgstPer)+parseFloat(cessPer);
			var taxableAmt=grnBaseRate*grnQty;
			var discAmt=(taxableAmt*discPer)/100;
			//alert("taxable " +taxableAmt + "discAmt " +discAmt);
			
			taxableAmt=taxableAmt-parseFloat(discAmt);
			//alert("taxable new " +taxableAmt);
			var totalTax=taxableAmt*(cgstPer+sgstPer+cessPer)/100;
			
			var grandTotal=taxableAmt+totalTax;
			
		//$("#grn_rate"+itemId).html(baseRate.toFixed(2));
		$("#grn_amt"+billDetailNo).html(grandTotal.toFixed(2));

		$("#tax_per"+billDetailNo).html(totTaxPer.toFixed(2));
		
		$("#taxable_amt"+billDetailNo).html(taxableAmt.toFixed(2));

		$("#tax_amt"+billDetailNo).html(totalTax.toFixed(2));

		/* var x=$("#grn_remark"+itemId).val();
		if(grnQty>0){
		
		if(x ==null ||x == ""){
			alert("Enter Remark");
			
		    document.getElementById("grn_remark"+itemId).focus();
		    
		}
		} */
		
		}//end of else
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

function getGrnData(id){
	
	
	var grnQty=$("#grnqtyauto"+id).val();
	var itemId=id;
	
	//alert(grnQty);
	//alert(itemId);
	
	$.getJSON('${getGrnData}',
			{
		
			qty:grnQty,
			id:itemId,
				 
				ajax : 'true',

           }
);
}
	
</script>




</body>
</html>
