<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %>
<l:MainLayout title="Cart | DOT Shop">
	<jsp:body>
		<div class="main-container">
			<div class="bread-crumbs">
				<a href="<c:url value="/landing" />" class="bread-crumb-item"><span>Home</span></a>
				<i class="bi bi-chevron-right icon-next"></i>
				<a href="#" class="bread-crumb-item"><span>Cart</span></a>
			</div>
			<div class="cart">
				<c:choose>
					<c:when test="${cart.size() > 0}">
						<div class="cart-inner">
							<span class="title mb-2">Cart</span>
							<div class="cart-heading">
								<div class="cart-childs-heading">
									<div class="col-1">
				                        <input class="form-check-input" type="checkbox" id="cart-checkbox-all" data-id="0"
				                        	${isCheckedAll ? "checked" : ""}>
				                        <span class="label">Tất cả (1 sản phẩm)</span>
				                    </div>
				                    <div class="col-2">
										<span class="label">Đơn giá</span>
									</div>
				                    <div class="col-3">
										<span class="label">Số lượng</span>
									</div>
				                    <div class="col-4">
										<span class="label">Thành tiền</span>
									</div>
				                    <div class="col-5" id="cart-remove-all">
										<i class="bi bi-trash"></i>
									</div>
								</div>
							</div>
							<div class="cart-content">
								<c:forEach var="item" items="${cart}">
									<div class="cart-child" data-item="${item.getProductID()}">
					                    <div class="col-1">
					                        <div class="intended-image">
					                            <input type="checkbox" class="cart-checkbox-item form-check-input" data-vat="${item.getVATFee()}"
													${item.getCartChecked() ? "checked" : ""}>
					                            <div class="cart-child-image">
					                                <a
														href="<c:url value="/product/${item.getProductSlug()}/pid-${item.getProductID()}" />"><img
														class="image" src="${item.getProductImage()}"
														alt="${item.getProductName()}"></a>
					                            </div>
					                            <a class="name"
													href="<c:url value="/product/${item.getProductSlug()}/pid-${item.getProductID()}" />">
					                            	${item.getProductName()}
					                            </a>
					                        </div>
					                    </div>
					                    <div class="col-2">
					                    	<c:choose>
												<c:when test="${item.getProductDiscount() > 0}">
													<span class="title single-price"><fmt:formatNumber
															value="${item.getProductPrice() - (item.getProductPrice() * item.getProductDiscount() / 100)}"
															pattern="#,### ₫" type="currency" /></span>
							                        <div class="d-flex">
							                        	<span class="caption"
															style="text-decoration: line-through;"><fmt:formatNumber
																value="${item.getProductPrice()}" pattern="#,### ₫"
																type="currency" /></span>
							                        	<div class="sale-tag">-${item.getProductDiscount()}%</div>
							                        </div>
												</c:when>
												<c:otherwise>
													<span class="title single-price"><fmt:formatNumber
															value="${item.getProductPrice()}" pattern="#,### ₫"
															type="currency" /></span>
												</c:otherwise>
											</c:choose>
					                    </div>
					                    <div class="col-3">
					                        <div class="group-input">
					                            <button class="quantity-button cart-qty-dec">-</button>
					                            <input type="text" class="quantity-input cart-qty-input"
													value="${item.getCartQuantity()}">
					                            <button class="quantity-button cart-qty-inc">+</button>
					                        </div>
					                    </div>
					                    <div class="col-4">
											<span class="title total-single-price" style="color: var(--color-red-main);"><fmt:formatNumber
													value="${item.getCartQuantity() * (item.getProductPrice() - (item.getProductPrice() * item.getProductDiscount() / 100))}"
													pattern="#,### ₫" type="currency" /></span>
										</div>
					                    <div class="col-5 cart-remove-btn">
											<i class="bi bi-trash"></i>
										</div>
					                </div>
								</c:forEach>
							</div>
						</div>
						<div class="cart-total-price">
							<div class="total-price-inner">
								<div class="ship-address total-price-wrapper">
									<div class="heading">
				                        <span class="title">Ship address</span>
				                        <span class="link">Change</span>
				                    </div>
				                    <div>
				                        <span class="title">Pihe</span>
				                        <span> | </span>
				                        <span class="title">0968366601</span>
				                    </div>
				                    <div>
				                        <span class="label">Chùa liên trì, Xã Suối Cao, Huyện Xuân Lộc, Đồng Nai</span>
				                    </div>
								</div>
								<div class="coupons total-price-wrapper">
									<div class="heading">
				                        <span class="title">Coupon tickets</span>
				                    </div>
				                    <div class="link">
				                        <i class="bi bi-ticket-detailed"></i>
				                        <span>Select or enter coupon code</span>
				                    </div>
								</div>
								<div class="total-price total-price-wrapper">
									<div class="heading">
				                        <span class="label">Guess</span>
				                        <span class="title guess"><fmt:formatNumber
												value="${guess}" pattern="#,### ₫" type="currency" /></span>
				                    </div>
				                    <div class="heading">
				                        <span class="label">Coupon</span>
				                        <span class="title coupon">- <fmt:formatNumber
												value="${coupon}" pattern="#,### ₫" type="currency" /></span>
				                    </div>
				                    <div class="heading">
				                        <span class="label">Ship Fee</span>
				                        <span class="title ship-fee">+ <fmt:formatNumber
												value="${shipFee}" pattern="#,### ₫" type="currency" /></span>
				                    </div>
				                    <div class="heading">
				                        <span class="label">Freeship</span>
				                        <span class="title free-ship">- <fmt:formatNumber
												value="${freeShip}" pattern="#,### ₫" type="currency" /></span>
				                    </div>
				                    <div class="divider"></div>
				                    <div class="heading">
				                        <span class="title">Total</span>
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
								<div class="row">
									<div class="col-md-12">
										<div class="btn btn-danger w-100" style="font-size: 14px;">Check out</div>
									</div>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="in-column w-100">
							<img src="https://salt.tikicdn.com/desktop/img/mascot@2x.png" alt="" />
							<span class="title my-3">There are no products in your cart.</span>
							<a href="<c:url value="/landing" />" class="btn btn-success">BUY NOW</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</jsp:body>
</l:MainLayout>