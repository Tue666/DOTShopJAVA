<%@ page language="java" contentType="text/html; charset=UTF-8 "
    pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %>

<l:MainLayout title="Category | DOTShop - Administrator">
	<jsp:body>
		<!-- DataTable CSS -->
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
		
  		<!-- DataTable JS -->
		<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
		
		<script>
    		$(document).ready( function () {
        		$('#table_id').DataTable();
    		} );
    	</script>
		<div>
		<h1 style="text-align: center;">Category Manager</h1>
		<div class="table-reponsive mb-5">
			<table class="table table-bordered"  width="50%" >
				<form action=<c:url value="/category"/> method="POST">
					<tr>
						<td><h4>Title</h4></td>
						<td><input type="text" class="form-control" placeholder="Title..." name="Title" required></td>
					</tr>
					<tr>
						<td><h4>Slug</h4></td>
						<td><input type="text" class="form-control" placeholder="Slug..." name="Slug" required></td>
					</tr>
					<tr>
						<td><h4>URL Image</h4></td>
						<td><input type="url" class="form-control" placeholder="URL Image..." name="Image" required ></td>
					</tr>
					<tr>
						<td><h4>ParentID</h4></td>
						<td><input type="text" class="form-control" placeholder="ParentID...." name="ParentID" required ></td>
					</tr>
					<tr>
						<td><h4>DisplayOrder</h4></td>
						<td><input type="text" class="form-control" placeholder="DisplayOrder..." name="DisplayOrder" required ></td>
					</tr>
					<tr>
						<td><h4>URL Banner</h4></td>
						<td><input type="url" class="form-control" placeholder="URL Banner..." name="Banner" ></td>
					</tr>
					
					<tr>
						<td><h4>Status</h4></td>
						<td>
							<select class="form-control" required name="Status">
								<option value="active" selected>Active Category</option>
								<option value="lock">Lock Category</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><h4>Create At</h4></td>
						<td>
							<input 
								type="text"  
								placeholder="YYYY-MM-DD" 
								pattern="(?:19|20)(?:(?:[13579][26]|[02468][048])-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))|(?:[0-9]{2}-(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:29|30))|(?:(?:0[13578]|1[02])-31)))" class="form-control"  
								name="DateCreatedat" 
								id="" required autofocus autocomplete="nope"
								title="Please press correct format. Example: 2021-11-25"
							>
						</td>
					</tr>
					<tr>
						<td><h4>Created By</h4></td>
						<td><input type="text" class="form-control" placeholder="Created By..." name="Createdby" required></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="submit" class="btn btn-primary btn-lg" id="register" name="addcategory" value="Add Category">
						</td>
					</tr>
				</form>
			</table>
		</div>
		<div>		
			<table id="table_id" class="display">
			    <thead>
			        <tr>
			        	<th>ID</th>
			            <th>Title</th>
			            <th>Slug</th>
			            <th>Image</th>
			            <th>ParentID</th>
			            <th>DisplayOrder</th>
			            <th>Banner</th>
			            <th>Status</th>
			            <th>Created At</th>
			            <th>Created By</th>
			            <th>Manager</th>
			        </tr>
			    </thead>
			    <tbody>
			    	<c:forEach var="category" items="${categories}">
			        	<tr>
			            	<td>${category.getID()}</td>
			            	<td>${category.getTitle()}</td>
			            	<td>${category.getSlug()}</td>
			            	<td>
			            		<img src="${category.getImage()}" alt="" style="width: 100px; height: 100px;" />
			            	</td>
			            	<td>${category.getParentID()}</td>
			            	<td>${category.getDisplayOrder()}</td>
			            	<td>
			            		<c:choose>
									<c:when test="${category.getBanner() == null || category.getBanner().length() == 0}">
										<img
											src="https://bizflyportal.mediacdn.vn/bizflyportal/459/347/2020/06/02/17/37/70515910726734841.jpg"
					            			alt=""
					            			style="width: 200px; height: 100px;"
			            				/>
									</c:when>
									<c:otherwise>
										<img
					            			src="${category.getBanner()}"
					            			alt=""
					            			style="width: 200px; height: 100px;"
			            				/>
									</c:otherwise>
								</c:choose>
			            	</td>
			            	<td>
								<c:choose>
									<c:when test="${category.getStatus() != 'active'}">
										<input type="button" class="btn btn-danger" id="" name="lock" value="Lock" >
									</c:when>
									<c:otherwise>
										<input type="button" class="btn btn-success" id="" name="active" value="Active" >
									</c:otherwise>
								</c:choose>
							</td>
			            	<td>${category.getCreatedAt()}</td>
			            	<td>${category.getCreatedBy()}</td>
			            	<td>
					            <a href="<c:url value="/category/edit/${category.getID()}" />">
						            <svg  xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
										  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
										  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
									</svg>
								</a> 
	
								<form action=<c:url value="/category/remove/${category.getID()}"/> method="POST">
									<input style="padding: 2px 4px;" onclick="return confirm('Confirm remove category !!!')" type="submit" class="btn btn-danger" id="" name="" value="Remove">			
								</form>
							</td>
			       		</tr>	
			        </c:forEach>
			    </tbody>  
			</table>
		</div>
	</jsp:body>
</l:MainLayout>