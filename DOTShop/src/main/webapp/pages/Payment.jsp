<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp"%>
<l:MainLayout title="Payment | DOT Shop">
	<jsp:body>
		<div class="main-container">
			<div class="d-flex justify-content-between my-3">
				<div class="checkout-section">
					<div class="delivery mb-3">
						<span class="title">1. Delivery</span>
						<div class="section-wrapper">
							<c:forEach var="item" items="${cartSelected}">
								<div class="delivery-item">
									<c:choose>
									    <c:when test="${item.getVATFee() > 0}">
											<span class="delivery-VAT"><fmt:formatNumber
													value="${item.getVATFee()}" pattern="#,### ₫"
													type="currency" /></span>
										</c:when>   
									    <c:otherwise>
									        <span class="delivery-VAT">Free</span>
									    </c:otherwise>
									</c:choose>
									<div class="delivery-image">
										<img class="image" alt="${item.getProductName()}"
											src="${item.getProductImage()}" />
									</div>
									<div style="width: calc(100% - 95px);">
										<div class="delivery-name">${item.getProductName()}</div>
										<span class="normal-text"><fmt:formatNumber
												value="${item.getProductPrice()}" pattern="#,### ₫"
												type="currency" /> | x${item.getCartQuantity()}</span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div>
						<div class="order-btn">
						 	ORDER
						</div>
						<span class="caption">(Check the cart and the <strong>necessary information</strong> to place an order)</span>
					</div>
				</div>
				<div class="checkout-infor">
					<div class="infor-wrapper">
						<div class="heading-infor">
							<span class="sub-title">Ship Address</span>
							<span class="link">Change</span>
						</div>
						<p class="title m-0">Pihe</p>
						<p class="normal-text m-0">Chùa liên trì, Xã Suối Cao, Huyện Xuân Lộc, Đồng Nai Việt Nam</p>
						<p class="normal-text m-0">Phone: 0586181641</p>
					</div>
					<div class="infor-wrapper">
						<div class="heading-infor">
							<span class="sub-title">Order</span>
							<a href="<c:url value="/cart" />" class="link">Change</a>
						</div>
						<div>
							<div class="in-row justify-content-between my-1">
								<span class="label">Guess</span>
				               	<span class="title"><fmt:formatNumber
										value="${guess}" pattern="#,### ₫" type="currency" /></span>
							</div>
							<div class="in-row justify-content-between my-1">
								<span class="label">Coupon</span>
				               	<span class="title">- <fmt:formatNumber
										value="${coupon}" pattern="#,### ₫" type="currency" /></span>
							</div>
							<div class="in-row justify-content-between my-1">
								<span class="label">Ship Fee</span>
				               	<span class="title">+ <fmt:formatNumber
										value="${shipFee}" pattern="#,### ₫" type="currency" /></span>
							</div>
							<div class="in-row justify-content-between my-1">
								<span class="label">Freeship</span>
				               	<span class="title">- <fmt:formatNumber
										value="${freeShip}" pattern="#,### ₫" type="currency" /></span>
							</div>
							<div class="in-row justify-content-between my-1">
								<span class="label">Total</span>
								<div class="in-column">
				               		<span class="title total"
										style="color: var(--color-red-main);">
										<c:choose>
											<c:when test="${guess == 0}">
												Please choose a product
											</c:when>
											<c:otherwise>
												<fmt:formatNumber value="${total}" pattern="#,### ₫"
													type="currency" />
											</c:otherwise>
										</c:choose>
				               		</span>
				             		<span class="caption">(VAT included if any)</span>
				    			</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</jsp:body>
</l:MainLayout>