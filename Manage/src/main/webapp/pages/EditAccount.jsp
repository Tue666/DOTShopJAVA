<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %>

<l:MainLayout title="Account | DOTShop - Administrator">
	<jsp:body>
		<h1 style="text-align: center; margin-bottom: 10px" >Edit Account</h1>
		<div class="table-reponsive">
			<table class="table table-bordered" >
				<form action=<c:url value="/account/edit/${account.getID()}"/> method="POST">
					<tr>
	  					<td><h4>Phone</h4></td>
	  					<td><input type="text" class="form-control" value="${account.getPhone() }" placeholder="Phone..." name="Phone" required></td>
	  				</tr>
	 				<tr>
				    	<td><h4>Name</h4></td>
				    	<td><input type="text" class="form-control" value="${account.getName() }" placeholder="Name..." name="Name" required ></td>
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
						<td><input type="text" class="form-control" value="${account.getAddress() }" placeholder="Address..." name="Address" required ></td>
					</tr>
					<tr>
						<td><h4>Email</h4></td>
						<td><input type="email" class="form-control" value="${account.getEmail() }" placeholder="Email..." name="Email" required ></td>
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
						<td colspan="2" align="right">
							<div>		
								<button onclick="return confirm('Are you sure to Reset this account Password ?')" type="submit" class="btn btn-primary" value="1" name="ResetPassword" title="Reset Password">
									<div style="font-size: 20.2px;">
										<i class="fa fa-key "></i>
									</div>
								</button>
					   	 		<button type="submit" class="btn btn-info" title="Edit Account">
					   	 			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-person-check" viewBox="0 0 16 16">
  										<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
  										<path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
									</svg>
					   	 		</button>
					  		</div>
				  		</td>
				  	</tr>
	  			</form>
			</table>
		</div>
	</jsp:body>
</l:MainLayout>