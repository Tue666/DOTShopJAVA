<%@ page language="java" contentType="text/html; charset=UTF-8 " pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %>

<l:MainLayout title="Order | DOTShop - Administrator">
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
			<h1 style="text-align: center;">Order Manager</h1>
			<table id="table_id" class="display">
			    <thead style="background-color: #163A5F; color: white">
			        <tr>
			        	<th>ID</th>
			            <th>Name</th>
			            <th>Phone</th>
			            <th>Address</th>
			            <th>Email</th>
			            <th>CreatedAt</th>
			            <th>Status</th>
			            <th>Manager</th>
			        </tr>
			    </thead>
			    <tbody>
			    	<c:forEach var="order" items="${orders}">
			        	<tr>
			            	<td>${order.getID()}</td>
			            	<td>${order.getCustomerName()}</td>
			            	<td>${order.getCustomerPhone()}</td>
			            	<td>${order.getCustomerAddress()}</td>
			            	<td>${order.getCustomerEmail()}</td>
			            	<td>${order.getCreatedAt()}</td>
			            	<td>
			            		<div>
									<c:choose>
										<c:when test="${order.getStatus() == 'Accepted'}">
											<a id="category-active" name="Accepted" value="Accepted" style="color: green; font-weight: bold;">Accepted</a>
										</c:when>
										<c:otherwise>
											<a id="category-lock" name="Processing" value="Processing" style="color: red; font-weight: bold;">Processing</a>
										</c:otherwise>
									</c:choose>
								</div>
							</td>
			            	<td>
			            		<div style="display:inline-flex">
			            		<a href="<c:url value="/order/view/${order.getID()}" />">
			            			<button class="btn btn-light" style="margin-right:10px" title="View order" >
					            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-printer" viewBox="0 0 16 16">
											<path d="M2.5 8a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z"/>
											<path d="M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2H5zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4V3zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2H5zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1z"/>
										</svg>
									</button>
								</a>
								<form action=<c:url value="/order/edit/${order.getID()}"/> method="POST">
									<button class="btn btn-primary" style="margin-right:10px" title="Edit order">
							            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2-all" viewBox="0 0 16 16">
											<path d="M12.354 4.354a.5.5 0 0 0-.708-.708L5 10.293 1.854 7.146a.5.5 0 1 0-.708.708l3.5 3.5a.5.5 0 0 0 .708 0l7-7zm-4.208 7-.896-.897.707-.707.543.543 6.646-6.647a.5.5 0 0 1 .708.708l-7 7a.5.5 0 0 1-.708 0z"/>
											<path d="m5.354 7.146.896.897-.707.707-.897-.896a.5.5 0 1 1 .708-.708z"/>
										</svg>
									</button>
								</form> 
								</div>
							</td>
			       		</tr>
			        </c:forEach>
			   	</tbody>  
			</table>
		</div>
	</jsp:body>
</l:MainLayout>