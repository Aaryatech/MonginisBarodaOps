

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<!--topLeft-nav-->
<div class="sidebarOuter"></div>
<!--topLeft-nav-->

<!--wrapper-start-->
<div class="wrapper">

	<!--topHeader-->
	<c:url var="getOtherBillBetweenDate" value="/getOtherBillBetweenDate" />
	<c:url var="frSupplierList" value="/frSupplierList" />
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
			
				<div class="row">
					<div class="col-md-5"><h2 class="pageTitle"><i class="fa fa-file-pdf-o" ></i> Other Purchase Bills</h2></div>
					<div class="col-md-7 left_button_mob">
						<a href="${pageContext.request.contextPath}/showOtherBill"><input type="button" value="Purchase Bill" class="btn additem_btn"
						style="margin:0; ">
										</a>
					</div>
				</div>
			
				<div class="order-left">
					
					

				</div>
				<!-- <div class="col1title" align="right"> 
						
										</div> -->
				<form id="validation-form">

					<div class="colOuter">
						<!-- copy div kalpesh -->

						<div class="col-md-1" align="left" style="margin: 7px 0 0 0;">From:</div>
						<div class="col-md-2">
							<input id="datepicker" class="texboxitemcode texboxcal" autocomplete="off"
								value="${cDate}" name="from_Date" type="text">
						</div>
						
						 
						<div class="col-md-1" style="margin: 7px 0 0 0;">TO:</div>
						<div class="col-md-2">
							<input id="datepicker2" class="texboxitemcode texboxcal" autocomplete="off"
								value="${cDate}" name="to_Date" type="text">
						</div>
						
						<div class="col-md-1" style="margin: 7px 0 0 0;">Select Supplier: </div>
						<div class="col-md-2">
							<select class="form-control" data-live-search="true" title="Please Select Item" name="suppId" id="suppId"
																			data-rule-required="true">
																			<option value="0">All</option>
																				<c:forEach items="${supplierList}" var="supplierList"> 
																				<option value="${supplierList.suppId}">${supplierList.suppName}</option> 
																				</c:forEach>

																		</select>
						</div>
						
						<div class="col-md-1">
							<button type="button" class="btn additem_btn" style="margin: 0;"
								onclick="serchOtherBill()">Search</button>
						</div>
						
					 

					</div>
					
					




					<!--tabNavigation-->
					<div class="cd-tabs">
						
						<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align:center;">Sr No</th>
			<th style="text-align:center;">Invoice No</th>
			<th style="text-align:center;">Date</th>
			<th style="text-align:center;">Supplier</th>
			<th style="text-align:center;">Discount</th>
			<th style="text-align:center;">Taxable Amt</th>
			<th style="text-align:center;">Tax Amt</th>
			<th style="text-align:center;">Grand Total</th> 
			<th style="text-align:center;" >Action</th>
	
			</tr>
	</thead>
	
	<tbody>
	
	</tbody>
	</table>  
</div>


						



					</div>
					<!--tabNavigation-->


				</form>
			</div>

			<!--rightSidebar-->

		</div>
		<!--fullGrid-->
	</div>
	<!--rightContainer-->

</div>
<!--wrapper-end-->
 
  
<script type="text/javascript">
		function validate() {
		
			var fromDate =$("#datepicker").val();
			var toDate =$("#datepicker2").val();
			
			var headeIdText=$("#headeIdText").val();
			alert(headeIdText);
			
			var isValid = true;
			if(headeIdText =="" || headeIdText == null){
				 isValid = false;
			}
			else if (fromDate == "" || fromDate == null) {

				isValid = false;
				alert("Please select From Date");
			}
		 else if (toDate == "" || toDate == null) {

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

function serchOtherBill()
{
	var fromDate=document.getElementById("datepicker").value;
	var toDate=document.getElementById("datepicker2").value; 
	var suppId=document.getElementById("suppId").value;
	$
	.getJSON(
			'${getOtherBillBetweenDate}',

			{
				 
				fromDate : fromDate,
				toDate : toDate, 
				suppId : suppId,
			
				ajax : 'true'

			},
			function(data) {
				if (data == "") {					
					alert("No records found !");
				}
				$
				.getJSON(
						'${frSupplierList}',

						{
							  
							ajax : 'true'

						},
						function(supplierList) {
							 
							var len=supplierList.length; 
							var suppName;
				$('#table_grid td').remove(); 
				  
			  $.each(
							data,
							function(key, itemList) {
							

								var tr = $('<tr></tr>');
								 
							  	tr.append($('<td style="text-align:center;"></td>').html(key+1));
							  	tr.append($('<td style="text-align:left;"></td>').html(itemList.invoiceNo));
							  	tr.append($('<td style="text-align:right;"></td>').html(itemList.billDate)); 
							  	for(var i=0;i<len;i++)
							  		{
							  			if(supplierList[i].suppId==itemList.suppId)
							  				{
							  				suppName=supplierList[i].suppName;
							  				}
							  		}
							  	tr.append($('<td style="text-align:right;"></td>').html(suppName)); 
							  	tr.append($('<td style="text-align:right;"></td>').html(itemList.discAmt)); 
							  	tr.append($('<td style="text-align:right;"></td>').html(itemList.taxableAmt)); 
							  	tr.append($('<td style="text-align:right;"></td>').html(itemList.totalTax));
							  	tr.append($('<td style="text-align:right;"></td>').html(itemList.grandTotal));
							  	tr.append($('<td style="text-align:center;"></td>').html('<a href="${pageContext.request.contextPath}/viewOtherBillDetail/'+itemList.billNo+'" class="action_btn" '+
										'title="Detail"><i class="fa fa-list"></i></abbr></a>'));
							  	
							    $('#table_grid tbody').append(tr);

								 

							})  
						});
				
			});
	
	
}

	</script>
	
	<script>
	$(document).ready( function () {
		serchOtherBill();
		//alert(":Ok")
		});
	
	</script>




</body>
</html>