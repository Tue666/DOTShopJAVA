<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %>
<l:LoginLayout title="Sign In | DOT Shop Manager">
	<jsp:body>
		<div class="main-page login-page ">
			<h2 class="title1">Login</h2>
			<div class="widget-shadow">
				<div class="login-body">
					<form action=<c:url value="/signIn" /> method="post">
						<input type="text" class="user" name="phone" placeholder="Enter Your Phone" required=""
						pattern="[0-9]{10}" 
						title="Phone numbers cannot enter characters and must be 10 digits long. Example: 0906708888"
						>
						<input type="password" name="password" class="lock" placeholder="Password" required=""
						pattern=".{6,}" 
						title="Password at least 6 characters"
						>
						<div class="forgot-grid">
							<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Remember me</label>
							<div class="forgot">
								<a href="#">forgot password?</a>
							</div>
							<div class="clearfix"> </div>
						</div>
						<input type="submit" name="Sign In" value="Sign In">
						<p style="margin-top:10px" class="text-danger"><strong>${mess}</strong></p> 	
						<p style="margin-top:10px; color:#FFC300 "><strong>${warning}</strong></p>  
						<div class="registration">
							Don't have an account ?
							<a class="" href="#">
								Create an account
							</a>
						</div>	
					</form>
				</div>
			</div>
		</div>
		<!--  
		<div class="container-fluid">
		  	<form action=<c:url value="/signIn" /> method="POST">
				<input type="text" name="phone" />
				<input type="password" name="password"/>
				<button type="submit">OK</button>
			</form>
		</div>
		-->
	</jsp:body>
</l:LoginLayout>
