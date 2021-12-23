<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %> 

<l:MainLayout title="Order Detail | DOTShop - Administrator">
	<jsp:body>
		<a href="<c:url value="/order" />" class="btn btn-warning" data-abc="true"> <i class="fa fa-chevron-left"></i> Back to orders</a>
		<a href="<c:url value="/order" />" class="btn btn-warning" data-abc="true"> <i class="fa fa-print"></i></i>  Print To PDF</a>
		<div class="table-reponsive">
			<table class="table table-bordered" >
				<form action=<c:url value="/order/view/${order.getID()}"/> method="POST">
					<tr>
						<td><h4>Order ID</h4></td>
						<td> ${order.getID() }</td>
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
						<td><h4>Created Day</h4></td>
						<td>${order.getCreatedDay() }</td>
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
									<c:when test="${order.getStatus() == 'active'}">
										<a id="category-active" name="active" value="Active" style="color: green; font-weight: bold;">Active</a>
									</c:when>
									<c:otherwise>
										<a id="category-lock" name="lock" value="Lock" style="color: red; font-weight: bold;">Lock</a>
									</c:otherwise>
								</c:choose>
							</div>
						</td>
					</tr>
	  			</form>
			</table>
			<div>
				<hr>
		            <ul class="row">
		                <li class="col-md-4">
		                    <figure class="itemside mb-3">
		                        <div class="aside"><img width="16" height="16" src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1571751108/Ecommerce/laptop-dell-xps-15-computer-monitors-laptops.jpg" class="img-sm border"></div>
		                        <figcaption class="info align-self-center">
		                            <p class="title">Dell Laptop with 500GB HDD <br> 8GB RAM</p> <span class="text-muted">$950 </span>
		                        </figcaption>
		                    </figure>
		                </li>
		                <li class="col-md-4">
		                    <figure class="itemside mb-3">
		                        <div class="aside"><img width="16" height="16" src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1571750967/Ecommerce/ef192a21ec96.jpg" class="img-sm border"></div>
		                        <figcaption class="info align-self-center">
		                            <p class="title">HP Laptop with 500GB HDD <br> 8GB RAM</p> <span class="text-muted">$850 </span>
		                        </figcaption>
		                    </figure>
		                </li>
		                <li class="col-md-4">
		                    <figure class="itemside mb-3">
		                        <div class="aside"><img width="16" height="16" src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1571750722/Ecommerce/acer-v-17-nitro-realsense.jpg" class="img-sm border"></div>
		                        <figcaption class="info align-self-center">
		                            <p class="title">ACER Laptop with 500GB HDD <br> 8GB RAM</p> <span class="text-muted">$650 </span>
		                        </figcaption>
		                    </figure>
		                </li>
		            </ul>
	            <hr>
            </div>
		</div>
	</jsp:body>
</l:MainLayout> 