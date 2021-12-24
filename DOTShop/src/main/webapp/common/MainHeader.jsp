<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="main-header">
	<!-- Header Top Start -->
	<div class="in-row justify-content-between">
		<div class="in-row">
			<div class="nav-child father">
				<a href="#"><i class="bi bi-file-arrow-down"></i> Download app</a>
			</div>
			<div class="nav-child father ">
				<a href="#"><i class="bi bi-code-slash"></i> Connect</a>
			</div>
		</div>
		<div class="in-row">
			<div class="nav-child father">
				<a href="#"><i class="bi bi-bell"></i> Notifications</a>
			</div>
			<div class="nav-child father">
				<a href="#"><i class="bi bi-question-circle"></i> Support</a>
			</div>
			<div class="nav-child">
				<c:choose>
					<c:when test= "${empty id}">
						<a class="themgachchan" href="<c:url value="/signIn" />"/>Sign In</a>
					</c:when>
					<c:otherwise>
						<nav class="navbar navbar-expand-lg">
						  <div class="container-fluid">
						    <a class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						      <span class="navbar-toggler-icon"></span>
						    </a>
						    <div class="collapse navbar-collapse" id="navbarSupportedContent">
						      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
						        <li class="nav dropdown mt-1 bogachchan">
						          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"  data-bs-toggle="dropdown" aria-expanded="false">
						           	${phone}
						          </a>
						          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						            <li><a class="themmau" href="<c:url value="/account" />">Edit Information</a></li>
						            <li><a class="themmau" href="<c:url value="/account/changePassword" />">Change Password</a></li>
						            <c:choose>
						            	<c:when test="${role == 'Admin' }">
						            	 	<li><a class="themmau" href="<c:url value="http://localhost:8080/Manage/signIn" />">Go to Manager</a></li>
						            	</c:when>
						            </c:choose>
						            <li><hr class="dropdown-divider"></li>
						            <li><a class="themmau" href="<c:url value="/signOut" />"/>Sign Out</a></li>
						          </ul>
						        </li>
						      </ul>
						    </div>
						  </div>
						</nav>
					</c:otherwise>
				</c:choose>
				
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