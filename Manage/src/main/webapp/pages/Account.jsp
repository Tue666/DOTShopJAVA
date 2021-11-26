<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %>
<l:MainLayout title="Account | DOTShop - Administrator">
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
	<h1 style="text-align: center; margin-bottom: 10px">Account Manager</h1>
	<div class="table-reponsive mb-5">
	<table class="table table-bordered"  width="50%" >
		<form action=<c:url value="/account"/> method="POST">
			<tr>
				<td><h4>Phone</h4></td>
				<td>
					<input id="myphone" value="" type="text" class="form-control" placeholder="Phone..." name="Phone" required
					pattern="[0-9]{10}" 
					title="Phone numbers cannot enter characters and must be 10 digits long. Example: 0906708888"
					>
					<span id="availability"></span>
				</td>
			</tr>
			<tr>
				<td><h4>Password</h4></td>
				<td><input type="password" class="form-control" placeholder="Password..." name="Password" required></td>
			</tr>
			<tr>
				<td><h4>Name</h4></td>
				<td><input type="text" class="form-control" placeholder="Name..." name="Name" required></td>
			</tr>
			<tr>
				<td><h4>Gender</h4></td>
				<td>
					<select class="form-control" required name="Gender">
						<option value="Male" selected>Male</option>
						<option value="Female">Female</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><h4>Address</h4></td>
				<td><input type="text" class="form-control" placeholder="Address...." name="Address" required ></td>
			</tr>
			<tr>
				<td><h4>Email</h4></td>
				<td><input type="email" class="form-control" placeholder="Email..." name="Email" required ></td>
			</tr>
			<tr>
				<td><h4>Account Type</h4></td>
				<td>
					<select class="form-control" required name="typeaccount">
						<option value="Admin" selected>Admin</option>
						<option value="Guest">Guest</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><h4>Status</h4></td>
				<td>
					<select class="form-control" required name="status">
						<option value="Active" selected>Active Account</option>
						<option value="Block">Block Account</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button type="submit" class="btn btn-primary" title="Add Account" id="register" >
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
  							<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
  							<path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
						</svg>
					</button>
				</td>
			</tr>
		</form>
	</table>
</div>
	<div>
		<table id="table_id" class="table table-striped table-bordered display">
		    <thead class="thead-dark">
		        <tr>
		        	<th>ID</th>
		        	<th>Phone</th>
		            <th>Name</th>
		            <th>Gender</th>
		            <th>Address</th>
		        	<th>Email</th>
		        	<th>AccountType</th>
		        	<th>Status</th>
		            <th>Manager</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="account" items="${accounts}">
		        	<tr>
		            	<td><c:out value="${account.getID()}"/></td>
		            	<td><c:out value="${account.getPhone()}"/></td>
		            	<td><c:out value="${account.getName()}"/></td>
		            	<td><c:out value="${account.getGender()}"/></td>
		            	<td><c:out value="${account.getAddress()}"/></td>
		            	<td><c:out value="${account.getEmail()}"/></td>
		            	<td><c:out value="${account.getType()}"/></td>
		            	<td><c:out value="${account.getStatus()}"/></td>
		            	<td>
		            		<div class="manager-button" style="display: flex">
				            	<a href="<c:url value="/account/edit/${account.getID() }" />">
				            		<button class="btn btn-info btn-xs" style="margin-right:10px" title="Edit Account">    		
						            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  											<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
										</svg>
									</button>
								</a>
								<form action=<c:url value="/account/remove/${account.getID() }"/> method="POST">
									<button onclick="return confirm('Are you sure to Remove this account ?')" type="submit" class="btn btn-danger btn-xs" title="Remove Account">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-x" viewBox="0 0 16 16">
	  										<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
	 	 									<path fill-rule="evenodd" d="M12.146 5.146a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
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
	<script>
	const pathname = window.location.pathname;
	const appName = pathname.substr(0, window.location.pathname.indexOf("/", 2));
	const ajaxURL = window.location.origin + appName + '/ajax';
		$(document).ready(function(){
			$('#myphone').keyup(function(){
				var myphone = $(this).val();
				$.ajax({
					url:ajaxURL,
					type:'POST',
					data:{
						myphone:myphone,
						action:"Check_Phone"
					},
					success:function(result){
				    	if(result == "OK"){
				            $('#availability').html('<span class="text-danger"><b>Phone is existed !</b></span>');
				            document.getElementById("register").disabled = true;
				     	}
				        else{
				            $('#availability').html('<span class="text-danger"></span>');
				            document.getElementById("register").disabled = false;
				    	}
					}
				})
			});
		})
	</script>
	</jsp:body>
</l:MainLayout>