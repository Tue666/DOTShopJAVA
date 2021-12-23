<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp"%>
<l:auth title="SIGN | DOT Shop">
	<jsp:body>
		<div class="auth-wrapper">
			<form action=<c:url value="/signIn" /> method="POST" class="login-form">
			 	<div class="form-group d-flex justify-content-center align-items-center">
			            <h1 style="font-family:'Big Shoulders Stencil Text', cursive;">SIGN IN</h1>
			        </div>
			        <div class="form-group">
			            <label for="login-user-name" class="form-label">Phone</label>
			            <input type="text" name="phone" rules="required" class="form-control shadow-none" id="login-user-name" autocomplete="off">
			            <div class="form-message form-text text-danger"></div>
			        </div>
			        <div class="form-group">
			            <label for="login-password" class="form-label">Password</label>
			            <input type="password" name="password" rules="required|minLength:6" class="form-control shadow-none" id="login-password">
			            <div class="form-message form-text text-danger"></div>
			        </div>
			        <button type="submit" class="btn col-md-12 mt-4 shadow-none"><span>Sign in</span></button>
			        <p class="text-danger"><strong>${mess}</strong></p>
			        <p class="text-success"><strong>${success}</strong></p>
			        <p class="text-warning"><strong>${warning}</strong></p>
			        <div class="form-text d-flex justify-content-center align-item-center">
			            Have no account?
			            <a class="btn-toggle" href="#" style="margin-left:5px;">Sign up</a>
			        </div>
			    </form>
			    <form action=<c:url value="/account/signUp" /> method="POST" class="register-form" >
			        <div class="form-group d-flex justify-content-center align-items-center">
			            <h1 style="font-family:'Big Shoulders Stencil Text', cursive;">SIGN UP</h1>
			        </div>
			        <div class="form-group">
			            <label for="register-user-name" class="form-label" id="myphone">Phone</label>
			            <input type="text" name="phone" rules="required" class="form-control shadow-none" id="myphone">
			            <div class="form-message form-text text-danger"></div>
			        </div>
			        <div class="form-group">
			            <label for="register-password" class="form-label">Password</label>
			            <input type="password" name="password" rules="required|minLength:6" class="form-control shadow-none" id="register-password">
			            <div class="form-message form-text text-danger"></div>
			        </div>
			        <div class="form-group">
			            <label for="register-confirm-password" class="form-label">Confirm Password</label>
			            <input type="password" name="confirmpassword" rules="required|minLength:6|same:registerPassword" class="form-control shadow-none" id="register-confirm-password">
			            <div class="form-message form-text text-danger"></div>
			        </div>
			        <button type="submit" class="btn col-md-12 mt-4 shadow-none"><span>Sign up</span></button>
			        <div class="form-text d-flex justify-content-center align-item-center">
			            Already have account
			            <a class="btn-toggle" href="#" style="margin-left:5px;">Sign in</a>
			        </div>
			    </form>
			</div>
		<script src="<c:url value="/static/js/validator.js" />"></script>
		<script>
	    Validator({
	        selector: '.login-form',
	        parentNodeClass: 'form-group',
	        messageNodeClass: '.form-message',
	        requiredCheckbox: true,
		});
		</script>
	</jsp:body>
</l:auth>