<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %>
<div class="container-fluid">
  	<form action=<c:url value="/account/login/1" /> method="POST">
		<input type="text" name="Phone" />
		<input type="password" name="Password"/>
		<p class="alert alert-info">${mess}</p> 	
		<button type="submit">OK</button>
	</form>
</div>

