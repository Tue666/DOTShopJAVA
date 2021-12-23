<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %> 

<l:MainLayout title="Order | DOTShop - Administrator">
	<jsp:body>
		<h3 class="text-center">Edit Order</h3>

		<div class="table-reponsive">
			<table class="table table-bordered" >
				<form action=<c:url value="/order/edit/${order.getID()}"/> method="POST">
					<tr>
						<td><h4>Name</h4></td>
						<td><input type="text" class="form-control" value="${order.getCustomerName() }" name="Name" required></td>
					</tr>
					<tr>
						<td><h4>Phone</h4></td>
						<td><input type="text" class="form-control" value="${order.getCustomerPhone() }" name="Phone" required></td>
					</tr>
					<tr>
						<td><h4>Address</h4></td>
						<td><input type="text" class="form-control" value="${order.getCustomerAddress() }" name="Address" required ></td>
					</tr>
					<tr>
						<td><h4>Email</h4></td>
						<td><input type="email" class="form-control" value="${order.getCustomerEmail() }" name="Email" required ></td>
					</tr>
					<tr>
					<tr>
						<td><h4>Created Day</h4></td>
						<td>
							<input 
								type="text"
								value="${order.getCreatedDay() }"   
								placeholder="YYYY-MM-DD" 
								pattern="(?:19|20)(?:(?:[13579][26]|[02468][048])-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))|(?:[0-9]{2}-(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:29|30))|(?:(?:0[13578]|1[02])-31)))" class="form-control "  
								name="DateCreatedat" 
								id="" required autofocus autocomplete="nope"
								title="Please press correct format. Example: 2021-11-25"
							>
						</td>
					</tr>
					<tr>
						<td><h4>Status</h4></td>
						<td>
							<c:choose>
								<c:when test= "${order.getStatus() == 'active'}">
									<select class="form-control" required name="Status">
										<option value="active" selected>Active Order</option>
										<option value="lock" >Lock Order</option>
									</select>
								</c:when>
								<c:otherwise>
									<select class="form-control" required name="Status">
										<option value="lock" selected>Lock Order</option>
										<option value="active" >Active Order</option>
									</select>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				   	<tr>
				   	 	<td colspan="2" align="right">
				   	 		<input onclick="return confirm('Confirm Edit Order !!!')" type="submit" class="btn btn-primary btn-lg" name="" value="Edit Order">
				   	 	</td>
				  	</tr>
	  			</form>
			</table>
		</div>
	</jsp:body>
</l:MainLayout> 