<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %> 
   
<l:MainLayout title="Category | DOTShop - Administrator">
	<jsp:body>
		<h3 class="text-center">Edit Category</h3>
		
		<div class="table-reponsive">
			<table class="table table-bordered" >
				<form action=<c:url value="/category/edit/${category.getID()}"/> method="POST">
					<tr>
						<td><h4>Title</h4></td>
						<td><input type="text" class="form-control" value="${category.getTitle() }" name="Title" required></td>
					</tr>
					<tr>
						<td><h4>Slug</h4></td>
						<td><input type="text" class="form-control" value="${category.getSlug() }" name="Slug" required></td>
					</tr>
					<tr>
						<td><h4>URL Image</h4></td>
						<td><input type="url" class="form-control" value="${category.getImage() }" name="Image" required ></td>
					</tr>
					<tr>
						<td><h4>ParentID</h4></td>
						<td><input type="text" class="form-control" value="${category.getParentID() }" name="ParentID" required ></td>
					</tr>
					<tr>
						<td><h4>DisplayOrder</h4></td>
						<td><input type="text" class="form-control" value="${category.getDisplayOrder() }" name="DisplayOrder" required ></td>
					</tr>
					<tr>
						<td><h4>URL Banner</h4></td>
						<td><input type="url" class="form-control" value="${category.getBanner() }" name="Banner" ></td>
					</tr>
					<tr>
						<td><h4>Status</h4></td>
						<td>
							<c:choose>
								<c:when test= "${category.getStatus() == 'active'}">
									<select class="form-control" required name="Status">
										<option value="active" selected>Active Category</option>
										<option value="lock" >Lock Category</option>
									</select>
								</c:when>
								<c:otherwise>
									<select class="form-control" required name="Status">
										<option value="lock" selected>Lock Category</option>
										<option value="active" >Active Category</option>
									</select>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td><h4>Created At</h4></td>
						<td>
							<input 
								type="text"
								value="${category.getCreatedAt() }"   
								placeholder="YYYY-MM-DD" 
								pattern="(?:19|20)(?:(?:[13579][26]|[02468][048])-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))|(?:[0-9]{2}-(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:29|30))|(?:(?:0[13578]|1[02])-31)))" class="form-control "  
								name="DateCreatedat" 
								id="" required autofocus autocomplete="nope"
								title="Please press correct format. Example: 2021-11-25"
							>
						</td>
					</tr>
					<tr>
						<td><h4>Created By</h4></td>
						<td><input type="text" class="form-control" value="${category.getCreatedBy() }"  name="Createdby" required></td>
					</tr>
				   	<tr>
				   	 	<td colspan="2" align="right">
				   	 		<input onclick="return confirm('Confirm Edit Category !!!')" type="submit" class="btn btn-primary btn-lg" name="" value="Edit Category">
				   	 	</td>
				  	</tr>
	  			</form>
			</table>
		</div>
	</jsp:body>
</l:MainLayout>