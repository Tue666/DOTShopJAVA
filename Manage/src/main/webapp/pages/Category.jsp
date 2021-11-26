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
							<button type="submit" class="btn btn-primary btn-lg" id="register" name="addcategory" value="Add Category" >
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder-plus" viewBox="0 0 16 16">
								 	<path d="m.5 3 .04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.683.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"/>
								 	<path d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 1 1 0 1H14v1.5a.5.5 0 1 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
								</svg>
							</button>
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
			            		<div class="manager-button" style="display: flex">
					            	<a href="<c:url value="/category/edit/${category.getID()}" />">
					            		<button class="btn btn-info btn-xs" style="margin-right:10px" title="Edit Category">    		
							            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
	  											<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
											</svg>
										</button>
									</a>
									<form action=<c:url value="/category/remove/${category.getID()}"/> method="POST">
										<button onclick="return confirm('Are you sure to Remove this category ?')" type="submit" class="btn btn-danger btn-xs" title="Remove Category">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
												 <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
												 <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
											</svg>
										</button>			
									</form>
								</div>
					   
							</td>
			       		</tr>	
			        </c:forEach>
			    </tbody>  
			</table>
		</div>
	</jsp:body>
</l:MainLayout>