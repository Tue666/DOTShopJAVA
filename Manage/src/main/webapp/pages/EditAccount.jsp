<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %>

<l:MainLayout title="Account | DOTShop - Administrator">
	<jsp:body>
		<h3 class="text-center">Edit Account</h3>

		<div class="table-reponsive">
			<table class="table table-bordered" >
				<form action=<c:url value="/account/edit/${account.getID()}"/> method="POST">
					<tr>
	  					<td><h6>Phone</h6></td>
	  					<td><input type="text" class="form-control" value="${account.getPhone() }" name="Phone" required></td>
	  				</tr>
	 				<tr>
				    	<td><h6>Name</h6></td>
				    	<td><input type="text" class="form-control" value="${account.getName() }" name="Name" required ></td>
				  	</tr>
				  	<tr>
				    	<td><h4>Gender</h4></td>
						<td>
							<c:choose>
								<c:when test= "${account.getGender() == 'Male'}">
									<select class="form-control" required name="Gender">
										<option value="Male" selected>Male</option>
										<option value="Female">Female</option>
									</select>
								</c:when>
								<c:otherwise>
									<select class="form-control" required name="Gender">
										<option value="Male" >Male</option>
										<option value="Female"selected>Female</option>
									</select>
								</c:otherwise>
							</c:choose>
						</td>
				  	</tr>
				  	<tr>
						<td><h4>Address</h4></td>
						<td><input type="text" class="form-control" value="${account.getAddress() }" name="Address" required ></td>
					</tr>
					<tr>
						<td><h4>Email</h4></td>
						<td><input type="email" class="form-control" value="${account.getEmail() }" name="Email" required ></td>
					</tr>
					<tr>
						<td><h4>Account Type</h4></td>
						<td>
							<c:choose>
								<c:when test= "${account.getType() == 'Admin'}">
									<select class="form-control" required name="typeaccount">
										<option value="Admin" selected>Admin</option>
										<option value="Guest">Guest</option>
									</select>
								</c:when>
								<c:otherwise>
									<select class="form-control" required name="typeaccount">
										<option value="Admin">Admin</option>
										<option value="Guest" selected>Guest</option>
									</select>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td><h4>Status</h4></td>
						<td>							
							<c:choose>
								<c:when test= "${account.getStatus() == 'Active'}">
									<select class="form-control" required name="status">
										<option value="Active" selected>Active Account</option>
										<option value="Block">Block Account</option>
									</select>
								</c:when>
								<c:otherwise>
									<select class="form-control" required name="status">
										<option value="Active">Active Account</option>
										<option value="Block" selected>Block Account</option>
									</select>
								</c:otherwise>
							</c:choose>							
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right"><button onclick="return confirm('Are you sure to Reset this account Password ?')" type="submit" class="btn btn-primary" value="1" name="ResetPassword" required >Reset Password</button></td>
				  	</tr>
				   	<tr>
				   	 	<td colspan="2" align="right"><input type="submit" class="btn btn-danger" name="" value="Edit Account"></td>
				  	</tr>
	  			</form>
			</table>
		</div>
	</jsp:body>
</l:MainLayout>