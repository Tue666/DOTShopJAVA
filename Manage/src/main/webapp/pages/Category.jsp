<%@ page language="java" contentType="text/html; charset=UTF-8 "
    pageEncoding="ISO-8859-1"%>
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
		<table id="table_id" class="display">
		    <thead>
		        <tr>
		        	<th>ID</th>
		            <th>Title</th>
		            <th>Image</th>
		            <th>ParentID</th>
		            <th>DisplayOrder</th>
		            <th>Banner</th>
		            <th>Status</th>
		            <th>CreatedAt</th>
		            <th>Manager</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="category" items="${categories}">
		        	<tr>
		            	<td>${category.getID()}</td>
		            	<td>${category.getTitle()}</td>
		            	
		            	<td>
		            		<img
		            			src="${category.getImage()}"
		            			alt=""
		            			style="width: 100px; height: 100px;"
		            		/>
		            	</td>
		            	<td>${category.getParentID()}</td>
		            	<td>${category.getDisplayOrder()}</td>
		            	
		            	<td>
		            		<img
		            			src="${category.getBanner()}"
		            			alt=""
		            			style="width: 200px; height: 100px;"
		            		/>
		            	</td>
		            	<td>${category.getStatus()}</td>
		            	<td>${category.getCreatedAt()}</td>
		            	<td>
			            <a href="<c:url value="/landing" />">
			            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
							  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
							  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
						</svg>
						</a> <span style="font-size: 25px;">|</span> 
						<a href="<c:url value="/category" />">	 
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
							  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
							  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
							</svg>
						</a>
						</td>
		       		</tr>
		       		
		        </c:forEach>
		        	
		    </tbody>  
		</table>
	</div>
	</jsp:body>
</l:MainLayout>