<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<a href="<c:url value="/product/${requestScope.item.getSlug()}/pid-${requestScope.item.getID()}" />">
	<div class="product-card">
		<div class="image-wrapper">
			<img class="image card-image" src="${requestScope.item.getImage()}"
				alt="${requestScope.item.getName()}" />
		</div>
		<div class="card-content">
			<div class="product-name">
				<span>${requestScope.item.getName()}</span>
			</div>
			<div class="product-rating">
				<div class="in-row">
					<jsp:include page="/common/Stars.jsp">
						<jsp:param name="total" value="5" />
						<jsp:param name="rating" value="4" />
					</jsp:include>
					<c:choose>
						<c:when test="${requestScope.item.getSold() > 0}">
							<span class="sold">${requestScope.item.getSold()} Sold</span>
						</c:when>
					</c:choose>
				</div>
			</div>
			<div class="product-price">
				<div class="in-row">
					<c:choose>
						<c:when test="${requestScope.item.getDiscount() > 0}">
							<span class="price sale"><fmt:formatNumber value="${requestScope.item.getPrice() - requestScope.item.getPrice() * requestScope.item.getDiscount() / 100}"
									pattern="#,### ₫" type="currency" /></span>
							<div class="sale-tag">-${requestScope.item.getDiscount()}%</div>
						</c:when>
						<c:otherwise>
							<span class="price"><fmt:formatNumber value="${requestScope.item.getPrice()}"
									pattern="#,### ₫" type="currency" /></span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</a>