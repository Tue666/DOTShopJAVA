<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp"%>
<l:MainLayout title="Account | DOT Shop">
	<jsp:body>
	<div class="main-container">
	<main class="container">
		<header class="row">
			<div class="row">
				<div class="alert alert-success">
					<h1>Thông tin tài khoản</h1>
				</div>

			</div>
		</header>
		<section class="row">
			<div class="col-5">
				<div class="row">
					<div class="col">
						<form action="/DOTShop/account" method="POST">
							<div class="form-group">
								<label for="name"> Tên: </label> <input type="text" id="name"
											name="name" class="form-control" value=${account.getName()} >
							</div>

							<div class="form-group">
								<label for="phone">Số điện thoại: </label> <input type="text"
											id="phone" name="phone" class="form-control"
											value=${account.getPhone()} >
							</div>
	
							<div class="form-group">
								<label for="gender">Giới tính: </label>
								<div class="form-check form-check-inline">
									<input type="radio" class="form-check-input"value="Male" id="male"
												name="gender" ${account.getGender() == "Male" ? "checked" : ""} /> <label
												for="male">Nam</label>
								</div>
								<div class="form-check form-check-inline">
									<input type="radio" class="form-check-input" value="Female" id="female"
												name="gender" ${account.getGender() == "Female" ? "checked" : ""} /> <label
												for="female">Nữ</label>
								</div>
								<div class="form-check form-check-inline">
									<input type="radio" class="form-check-input" value="Other" id="other"
												name="gender" ${account.getGender() != "Female" && account.getGender() != "Male" ? "checked" : ""} /> <label
												for="other">Khác</label>
								</div>
							</div>
	
							<div class="form-group">
								<label for="address">Địa chỉ: </label> <input type="text"
											name="address" class="form-control" id="address"
											value=${account.getAddress()} >
							</div>
	
							<div class="form-group">
								<label for="email">Email: </label> <input class="form-control"
											type="text" id="email" name="email"
											value=${account.getEmail()} >
							</div>
							<hr />
							<button type="submit" class="btn btn-primary">Cập nhật</button>
							
						</form>
					</div>
				</div>
			</div>
		  	<!--  <div class="col-5">
				<h3>Thông tin đã được đăng ký</h3>
				<ul>
					<li>Tên: ${name }</li>
					<li>Số điện thoại: ${phone }</li>
					<li>Giới tính: ${gender }</li>
					<li>Địa chỉ: ${address }</li>
					<li>Email: ${email }</li>
				</ul>
			</div>
			-->
			
		</section>
	</main>
	</div>
</jsp:body>
</l:MainLayout>