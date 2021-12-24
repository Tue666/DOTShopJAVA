<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp"%>
<l:MainLayout title="Change Password | DOT Shop">
	<jsp:body>
	<div class="main-container">
	<main class="container">
		<header class="row">
			<div class="row">
				<div class="alert alert-success">
					<h1>Change Password</h1>
				</div>

			</div>
		</header>
		<section class="row">
			<div class="col-4">
				<div class="row">
					<div class="col">
						<form action=<c:url value="/account/changePassword" /> method="POST">
							
							<div class="form-group">
								<label for="phone"> Phone: </label> 
								<input type="text" id="phone" name="phone" class="form-control" value="${phone}" disabled>
							</div>
							
							<div class="form-group">
								<label for="name"> Old Password: </label> 
								<input type="password" id="oldpassword" name="oldpassword" class="form-control" placeholder="Enter old password"
								>
							</div>
							
							<div class="form-group">
								<label for="name"> New Password: </label> 
								<input type="password" id="password" name="password" class="form-control" placeholder="Enter new password"
								>
							</div>
							
							<div class="form-group">
								<label for="name"> Confirm New Password: </label> 
								<input type="password" id="confirmpassword" name="confirmpassword" class="form-control" placeholder="Enter new password again"
								>
							</div>
							
							<hr/>

							<button type="submit" class="btn btn-primary">OK</button>
							<p class="text-danger mt-2"><strong>${mess}</strong></p>
							<p class="text-success mt-2"><strong>${success}</strong></p>
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>
	</div>
</jsp:body>
</l:MainLayout>