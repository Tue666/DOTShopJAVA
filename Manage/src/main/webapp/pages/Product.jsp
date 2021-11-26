<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %>
<l:MainLayout title="Product | DOTShop - Administrator">
	<jsp:body>
		<!-- DataTable CSS -->
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
		
  		<!-- DataTable JS -->
		<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
		
		<script>
    		$(document).ready( function () {
        		$('#table_id').DataTable();
    		} );
    	</script>
	<div>
		<h1 style="text-align: center;"> Product Management </h1>
		<h5 style="text-aligin: center;"> You can management product in here </h5>
			<table id="table_id" class="display">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Slug</th>
						<th>Image</th>
						<th>Description</th>
						<th>Price</th>
						<th>Discount</th>
						<th>Quantity</th>
						<th>Viewed</th>
						<th>Searched</th>
						<th>Sold</th>
						<th>VATFee</th>
						<th>_Limit</th>
						<th>Tag</th>
						<th>Status</th>
					</tr>
				</thead>	
			<tbody>
		    	<c:forEach var="product" items="${producties}">
		        	<tr>
		            	<td>${product.getID()}</td>
		            	<td>${product.getSlug()}</td>
		            	<td>
		            		<img
		            			src="${product.getImage()}"
		            			alt=""
		            			style="width: 100px; height: 100px;"
		            		/>
		            	</td>
		            	<td>${product.getDescription()}</td>
		            	<td>${product.getName()}</td>
		            	<td>${product.getPrice()}</td>
		            	<td>${product.getDiscount()}</td>
		            	<td>${product.getQuantity()}</td>
		            	<td>${product.getViewed()}</td>
		            	<td>${product.getSearched()}</td>
		            	<td>${product.getSold()}</td>
		            	<td>${product.getVATFee()}</td>
		            	<td>${product.get_Limit()}</td>
		            	<td>${product.getTag()}</td>
		            	<td>${product.getStatus()}</td>
		            	<td>
			            <a href="<c:url value="/landing" />">
			            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
							  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
							  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
						</svg>
						</a> <span style="font-size: 25px;">|</span> 
						<a href="<c:url value="/product" />">	 
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
							  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
							  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
							</svg>
						</a>
						</td>
		       		</tr>
		       		
		        </c:forEach>
		        	
		    </tbody>
			
		  </table> 
	</div>
	</jsp:body>
</l:MainLayout>