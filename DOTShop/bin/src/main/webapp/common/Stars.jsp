<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="in-row">
	<c:forEach var="i" begin="1" end="${param.total}">
		<c:choose>
			<c:when test="${i<=param.rating}">
				<i class="bi bi-star-fill"
					style="font-size: 11px; color: rgb(253, 216, 54); margin: 0 1px;"></i>
			</c:when>
			<c:otherwise>
				<i class="bi bi-star-fill"
					style="font-size: 11px; color: rgb(199, 199, 199); margin: 0 1px"></i>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>