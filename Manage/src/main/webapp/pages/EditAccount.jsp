<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %>

<l:MainLayout title="Account | DOTShop - Administrator">
	<jsp:body>
		<h3 class="text-center">Edit Account</h3>

		<div class="table-reponsive">
			<table class="table table-bordered" >
			<tr>
	  			<td><h6>Họ và tên</h6></td>
	  			<td><input type="text" class="form-control" value="" name="tenkhachhang" required></td>
	  		</tr>
			</table>
		</div>
	</jsp:body>
</l:MainLayout>