<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %> 

<l:MainLayout title="Order Detail | DOTShop - Administrator">
	<jsp:body>
		<h1 style="text-align: center;">Order Detail</h1>
		<div style="text-align: right;">
			<a href="<c:url value="/order" />" class="btn btn-warning" data-abc="true"> <i class="fa fa-chevron-left"></i> Back to orders</a>
			<a href="<c:url value="#" />" class="btn btn-warning" data-abc="true"> <i class="fa fa-print"></i></i>  Print To PDF</a>
		</div>
		<div class="table-reponsive">
			<table class="table table-bordered" >
				<form action=<c:url value="/order/view/${order.getID()}"/> method="POST">
					<tr>
						<td><h4>Order ID</h4></td>
						<td>${order.getID() }</td>
					</tr>
					<tr>
						<td><h4>Name</h4></td>
						<td>${order.getCustomerName() }</td>
					</tr>
					<tr>
						<td><h4>Phone</h4></td>
						<td>${order.getCustomerPhone() }</td>
					</tr>
					<tr>
						<td><h4>Address</h4></td>
						<td>${order.getCustomerAddress() }</td>
					</tr>
					<tr>
						<td><h4>Email</h4></td>
						<td>${order.getCustomerEmail() }</td>
					</tr>
					<tr>
					<tr>
						<td><h4>Created At</h4></td>
						<td>${order.getCreatedAt() }</td>
					</tr>
					<tr>
						<td><h4>Total price</h4></td>
						<td>XXX.XXX.XXX VND</td>
					</tr>
					<tr>
						<td><h4>Status</h4></td>
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
					</tr>
	  			</form>
			</table>
			<h3 style="text-align: center;">List Product</h3>
			<table id="table_id" class="table table-striped table-bordered display">
			    <thead style="background-color: #163A5F; color: white">
			        <tr>
			        	<th>ID</th>
			        	<th>Image</th>
			            <th>Product Name</th>
			            <th>Quantity</th>
			            <th>Price</th>
			        </tr>
			    </thead>
			    <tbody>
			    	<c:forEach var="order" items="${orders}">
			        	<tr>
			        		<p>Chi tiết sản phẩm nha hehe</p>
			            	<td>1</td>
			            	<td>1</td>
			            	<td>Nokia</td>
			            	<td>100%</td>
			            	<td>1 tỷ VND</td>
			       		</tr>
			        </c:forEach>
			   	</tbody>
		   	</table>
		</div>
	</jsp:body>
</l:MainLayout> 