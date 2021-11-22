<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="main-header">
	<!-- Header Top Start -->
	<div class="in-row justify-content-between">
		<div class="in-row">
			<div class="nav-child">
				<a href="#"><i class="bi bi-file-arrow-down"></i> Download app</a>
			</div>
			<div class="nav-child">
				<a href="#"><i class="bi bi-code-slash"></i> Connect</a>
			</div>
		</div>
		<div class="in-row">
			<div class="nav-child">
				<a href="#"><i class="bi bi-bell"></i> Notifications</a>
			</div>
			<div class="nav-child">
				<a href="#"><i class="bi bi-question-circle"></i> Support</a>
			</div>
			<div class="mx-2"></div>
			<div class="nav-child">
				<a href="#">Sign in</a>
			</div>
			<span>|</span>
			<div class="nav-child">
				<a href="#">Sign up</a>
			</div>
		</div>
	</div>
	<!-- Header Top End -->

	<!-- Header Bottom Start -->
	<div class="in-row justify-content-between">
		<div class="logo">
			<a href="<c:url value="/landing" />"> <img class="image"
				src="https://www.graphicsprings.com/filestorage/stencils/bdc5649fb67a5ab2fc8b4a0dc0eac951.png?width=500&height=500"
				alt="DOT Shop logo">
			</a>
		</div>
		<div class="search">
			<form>
				<input class="search-input" type="text"
					placeholder="Enter what you are looking for here ...">
				<button class="search-button">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<div class="in-row">
			<div class="in-row stored-cart mx-3">
				<a href="<c:url value="/cart" />">
					<i class="bi bi-cart3"></i>
				</a>
				 <span class="in-row badge cart-badge"></span>
			</div>
			<div id="toggle-btn" class="in-row switch-theme">
				<div class="dark">
					<span>🌜</span>
				</div>
				<div class="light">
					<span>🌞</span>
				</div>
				<div class="toggle-thumb"></div>
			</div>
		</div>
	</div>
	<!-- Header Bottom End -->
</div>