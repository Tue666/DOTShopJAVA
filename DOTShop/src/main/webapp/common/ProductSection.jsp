<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="row">
	<div class="product-section">
		<div class="in-row justify-content-between">
			<span class="title"><c:out value="${param.title}" /></span> <span
				class="nav-link"><a class="view-more" href="#">View more
					<i class="bi bi-chevron-right"></i>
			</a></span>
		</div>
		<div class="product-wrapper">
			<c:forEach var="product" items="${requestScope.products}">
				<c:set var="item" value="${product}" scope="request"/>
				<jsp:include page="/common/ProductCard.jsp" />
			</c:forEach>
		</div>
	</div>
</div>