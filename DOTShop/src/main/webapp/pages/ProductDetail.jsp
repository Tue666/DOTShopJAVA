<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %>
<l:MainLayout title="${product.getName()} | DOT Shop">
	<jsp:body>
		<div class="main-container">
			<div class="bread-crumbs">
				<a href="<c:url value="/landing" />" class="bread-crumb-item"><span>Home</span></a>
				<i class="bi bi-chevron-right icon-next"></i>
				<a href="#" class="bread-crumb-item"><span>Balo và Vali</span></a>
				<i class="bi bi-chevron-right icon-next"></i>
				<a href="#" class="bread-crumb-item"><span>Balo nam</span></a>
				<i class="bi bi-chevron-right icon-next"></i>
				<a href="#" class="bread-crumb-item"><span>${product.getName()}</span></a>
			</div>
			<div class="information detail-wrapper p-0">
				<div class="image-wrapper">
					<div class="focus-image">
						<img class="image" src="${product.getImage()}"
							alt="${product.getName()}" />
					</div>
					<div class="review-images">
						<div class="review-image active">
							<img class="image" src="${product.getImage()}"
								alt="${product.getName()}" />
						</div>
						<div class="review-image">
							<img class="image" src="${product.getImage()}"
								alt="${product.getName()}" />
						</div>
					</div>
				</div>
				<div class="seperate"></div>
				<div class="information-wrapper">
					<div class="header-information">
						<h1 class="infor-name">${product.getName()}</h1>
						<div class="in-row justify-content-start">
							<jsp:include page="/common/Stars.jsp">
								<jsp:param name="total" value="5" />
								<jsp:param name="rating" value="4" />
							</jsp:include>
							<span class="infor-caption">(From 69 votes)</span>
							<c:choose>
								<c:when test="${product.getSold() > 0}">
									<span class="infor-seperate"></span>
									<span class="infor-caption">${product.getSold()} sold <i
										class="bi bi-truck"></i></span>
								</c:when>
							</c:choose>
						</div>
					</div>
					<div class="body-information">
						<div class="infor-price">
							<c:choose>
								<c:when test="${product.getDiscount() > 0}">
									<span class="new-price"><fmt:formatNumber
											value="${product.getPrice() - (product.getPrice() * product.getDiscount() / 100)}"
											pattern="#,### ₫" type="currency" /></span>
					                <div>
					                    <span class="old-price"><fmt:formatNumber
												value="${product.getPrice()}" pattern="#,### ₫"
												type="currency" /></span>
					                    <span class="discount">-${product.getDiscount()}%</span>
					                </div>
								</c:when>
								<c:otherwise>
									<span class="normal-price"><fmt:formatNumber
											value="${product.getPrice()}" pattern="#,### ₫"
											type="currency" /></span>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="infor-warranty my-2">
							<span class="sub-title">Warranty</span>
							<div>
								<span class="normal-text">Warranty period: </span>
								<span class="normal-text">18 tháng</span>
							</div>
							<div>
								<span class="normal-text">Warranty form: </span>
								<span class="normal-text">Bảo hành điện tử</span>
							</div>
							<div>
								<span class="normal-text">Warranty place: </span>
								<span class="normal-text">Trung tâm bảo hành</span>
							</div>
						</div>
						<div class="infor-quantity my-2">
							<span class="sub-title">Quantity</span>
							<div class="group-input">
			                    <button class="quantity-button sub-btn disabled">
			                    	<i class="bi bi-dash-lg"></i>
			                    </button>
			                    <input type="text" class="quantity-input detail-qty-input"
									value="1">
			                    <button class="quantity-button plus-btn">
			                    	<i class="bi bi-plus-lg"></i>
			                    </button>
			                </div>
						</div>
						<div class="actions my-3">
							<div id="add-cart-btn" class="add card-btn">ADD TO CARD</div>
						</div>
					</div>
				</div>
			</div>
			<div class="similar-products detail-wrapper">
				<c:set var="products" value="${similar}" scope="request"/>
				<jsp:include page="/common/ProductSection.jsp">
					<jsp:param name="type" value="similar" />
					<jsp:param name="title" value="Similar products" />
				</jsp:include>
			</div>
			<div class="more-information detail-wrapper">
				<span class="title">More information</span>
				<table class="infor-table">
		            <tbody>
		                <tr>
		                    <td class="title">Thương hiệu</td>
		                    <td class="text">Vua cua</td>
		                </tr>
		                <tr>
		                    <td class="title">Xuất xứ thương hiệu</td>
		                    <td class="text">Việt Nam</td>
		                </tr>
		                <tr>
		                    <td class="title">Xuất xứ</td>
		                    <td class="text">Việt Nam</td>
		                </tr>
		                <tr>
		                    <td class="title">Hướng dẫn bảo quản</td>
		                    <td class="text">Bảo quản đông lạnh : 90 ngày, tủ mát 15 ngày</td>
		                </tr>
		                <tr>
		                    <td class="title">Hướng dẫn sử dụng</td>
		                    <td class="text">Bánh mì có thể chiên lửa vừa trong vòng 2-3p với chảo dầu thật nóng (nên dùng giấy
		                        thấm dầu sau khi chiên) ,hấp 7-10 phút hoặc Chiên lại bằng nồi chiên không dầu: do bánh vào nồi
		                        chiên không dầu, chỉnh thời gian 30s và 180 độ C.</td>
		                </tr>
		            </tbody>
		        </table>
			</div>
			<div class="description detail-wrapper">
				<span class="title">Description</span>
				<div class="description-wrapper">
					Bánh mì có thể chiên lửa vừa trong vòng 2-3p với chảo dầu thật nóng (nên dùng giấy thấm dầu sau khi chiên)
		            ,hấp 7-10 phút hoặc Chiên lại bằng nồi chiên không dầu: do bánh vào nồi chiên không dầu, chỉnh thời gian 30s
		            và 180 độ C.
		            Bánh mì có thể chiên lửa vừa trong vòng 2-3p với chảo dầu thật nóng (nên dùng giấy thấm dầu sau khi chiên)
		            ,hấp 7-10 phút hoặc Chiên lại bằng nồi chiên không dầu: do bánh vào nồi chiên không dầu, chỉnh thời gian 30s
		            và 180 độ C.
		            Bánh mì có thể chiên lửa vừa trong vòng 2-3p với chảo dầu thật nóng (nên dùng giấy thấm dầu sau khi chiên)
		            ,hấp 7-10 phút hoặc Chiên lại bằng nồi chiên không dầu: do bánh vào nồi chiên không dầu, chỉnh thời gian 30s
		            và 180 độ C.
		            Bánh mì có thể chiên lửa vừa trong vòng 2-3p với chảo dầu thật nóng (nên dùng giấy thấm dầu sau khi chiên)
		            ,hấp 7-10 phút hoặc Chiên lại bằng nồi chiên không dầu: do bánh vào nồi chiên không dầu, chỉnh thời gian 30s
		            và 180 độ C.
		            Bánh mì có thể chiên lửa vừa trong vòng 2-3p với chảo dầu thật nóng (nên dùng giấy thấm dầu sau khi chiên)
		            ,hấp 7-10 phút hoặc Chiên lại bằng nồi chiên không dầu: do bánh vào nồi chiên không dầu, chỉnh thời gian 30s
		            và 180 độ C.
		            Bánh mì có thể chiên lửa vừa trong vòng 2-3p với chảo dầu thật nóng (nên dùng giấy thấm dầu sau khi chiên)
		            ,hấp 7-10 phút hoặc Chiên lại bằng nồi chiên không dầu: do bánh vào nồi chiên không dầu, chỉnh thời gian 30s
		            và 180 độ C.
		            Bánh mì có thể chiên lửa vừa trong vòng 2-3p với chảo dầu thật nóng (nên dùng giấy thấm dầu sau khi chiên)
		            ,hấp 7-10 phút hoặc Chiên lại bằng nồi chiên không dầu: do bánh vào nồi chiên không dầu, chỉnh thời gian 30s
		            và 180 độ C.
		            Bánh mì có thể chiên lửa vừa trong vòng 2-3p với chảo dầu thật nóng (nên dùng giấy thấm dầu sau khi chiên)
		            ,hấp 7-10 phút hoặc Chiên lại bằng nồi chiên không dầu: do bánh vào nồi chiên không dầu, chỉnh thời gian 30s
		            và 180 độ C.
		            Bánh mì có thể chiên lửa vừa trong vòng 2-3p với chảo dầu thật nóng (nên dùng giấy thấm dầu sau khi chiên)
		            ,hấp 7-10 phút hoặc Chiên lại bằng nồi chiên không dầu: do bánh vào nồi chiên không dầu, chỉnh thời gian 30s
		            và 180 độ C.
		            Bánh mì có thể chiên lửa vừa trong vòng 2-3p với chảo dầu thật nóng (nên dùng giấy thấm dầu sau khi chiên)
		            ,hấp 7-10 phút hoặc Chiên lại bằng nồi chiên không dầu: do bánh vào nồi chiên không dầu, chỉnh thời gian 30s
		            và 180 độ C.
		            Bánh mì có thể chiên lửa vừa trong vòng 2-3p với chảo dầu thật nóng (nên dùng giấy thấm dầu sau khi chiên)
		            ,hấp 7-10 phút hoặc Chiên lại bằng nồi chiên không dầu: do bánh vào nồi chiên không dầu, chỉnh thời gian 30s
		            và 180 độ C.
		            Bánh mì có thể chiên lửa vừa trong vòng 2-3p với chảo dầu thật nóng (nên dùng giấy thấm dầu sau khi chiên)
		            ,hấp 7-10 phút hoặc Chiên lại bằng nồi chiên không dầu: do bánh vào nồi chiên không dầu, chỉnh thời gian 30s
		            và 180 độ C.
		            Bánh mì có thể chiên lửa vừa trong vòng 2-3p với chảo dầu thật nóng (nên dùng giấy thấm dầu sau khi chiên)
		            ,hấp 7-10 phút hoặc Chiên lại bằng nồi chiên không dầu: do bánh vào nồi chiên không dầu, chỉnh thời gian 30s
		            và 180 độ C.
				</div>
				<div class="toggle-scrolldown-btn">
					<i class="bi bi-chevron-double-down"></i>
				</div>
			</div>
			<div class="review-rating detail-wrapper">
				<span class="title">Reviews - Comments from customers</span>
				<div class="in-column">
					<i class="bi bi-stars"
						style="font-size: 60px; color: rgb(253, 216, 54);"></i>
					<span class="title">There are no reviews for this product yet</span>
				</div>
			</div>
			<div class="suggestions">
				<div class="discover-more">Discover more for you</div>
				<jsp:include page="/common/ProductList.jsp" />
			</div>
		</div>
		
		<script>
		    // product description toggle scroll down
		    const toggleScrolldownBtn = document.querySelector('.toggle-scrolldown-btn');
		    const descriptionWrapper = document.querySelector('.description-wrapper');
		    if (descriptionWrapper.offsetHeight > 399) {
		    	toggleScrolldownBtn.addEventListener('click', () => {
		    		toggleScrolldownBtn.classList.toggle('active');
		            descriptionWrapper.classList.toggle('active');
		        });
		    }
		    else {
		    	toggleScrolldownBtn.style.display = 'none';
		    }
		</script>
	</jsp:body>
</l:MainLayout>