<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags"%>
<%@ include file="/common/taglib.jsp" %>
<l:MainLayout title="DOT Shop - Buy online, good price, good quality, fast shipping">
	<jsp:body>
		<div class="main-container">
			<div class="banners">
				<div class="row m-1">
	    			<div class="col-md-8 p-1">
	    				<div class="slides">
	    					<div class="automatic-slideshow">
			                    <div class="slide active">
			                        <img class="image"
										src="https://channel.mediacdn.vn/thumb_w/640/prupload/879/2018/11/img20181130185725670.jpg"
										alt="">
			                    </div>
			                    <div class="slide">
			                        <img class="image"
										src="https://image-us.eva.vn/upload/4-2018/images/2018-12-11/1-1544521514-549-width660height408.jpg"
										alt="">
			                    </div>
			                    <div class="slide">
			                        <img class="image"
										src="https://product.hstatic.net/1000238589/product/shopee-640x360_24e81237c35b4081a16ee257790400bb_e268971403d94e62a191a17e14a5c144.jpg"
										alt="">
			                    </div>
			                    <div class="slide">
			                        <img class="image"
										src="https://cc.1cdn.vn/thumbs/540x360/2020/05/13/media-cungcau-vn_tong-hop-cac-ma-giam-gia-khuyen-mai-tren-shopee-ngay-13-5-142223.jpg"
										alt="">
			                    </div>
			                    <div class="slide">
			                        <img class="image"
										src="https://cdn.123job.vn/123job//uploads/images/flash%20sale.jpg"
										alt="">
			                    </div>
			                    <div class="navigation">
			                        <div class="btn-prev">
										<i class="bi bi-chevron-left"></i>
									</div>
			                        <div class="btn-next">
										<i class="bi bi-chevron-right"></i>
									</div>
			                    </div>
			                    <div class="navigation-icon">
			                        <div class="slide-icon active"></div>
			                        <div class="slide-icon"></div>
			                        <div class="slide-icon"></div>
			                        <div class="slide-icon"></div>
			                        <div class="slide-icon"></div>
			                    </div>
			                </div>
	    				</div>
	    			</div>
	    			<div class="col-md-4 p-1">
	    				<div class="banner">
	    					<img class="image"
								src="https://doopage.com/assets/uploads/2019/05/dau-tu-hinh-anh-khi-ban-hang-tren-shopee.jpg"
								alt="" />
	    				</div>
	    			</div>
	  			</div>
	  			<div class="row m-1">
	    			<div class="col-md-6 p-1">
	    				<div class="mini-banner">
	    					<img class="image"
								src="https://daygiare.com/public/storage/photo/2019/10/16/shopee-20-10-flashsale-giam-toi-50-re-vo-dich-danh-cho-nang-0.jpeg"
								alt="" />
	    				</div>
	    			</div>
	    			<div class="col-md-6 p-1">
	    				<div class="mini-banner">
	    					<img class="image"
								src="http://shopeeplus.com//upload/images/ma-giam-gia-shopee-01-1559789397.jpg"
								alt="" />
	    				</div>
	    			</div>
	  			</div>
			</div>
			
			<c:set var="products" value="${topSold}" scope="request"/>
			<jsp:include page="/common/ProductSection.jsp">
				<jsp:param name="type" value="top_sold" />
				<jsp:param name="title" value="Hot selling products" />
			</jsp:include>
			
			<div class="row">
				<div class="categories">
					<span class="title">Categories</span>
					<div class="categories-wrapper">
						<c:forEach var="category" items="${categories}">
							<a href="<c:url value="/${category.getSlug()}/cid${category.getID()}" />" class="category-child">
				                <div class="category-image">
				                    <img class="image"
											src="${category.getImage()}"
											alt="${category.getTitle()}">
				                </div>
				                <div class="category-name">
				                    ${category.getTitle()}
				                </div>
				            </a>
						</c:forEach>
					</div>
					<div class="toggle-scrolldown-btn"><i class="bi bi-chevron-double-down"></i></div>
				</div>
			</div>
			
			<c:set var="products" value="${topSearched}" scope="request"/>
			<jsp:include page="/common/ProductSection.jsp">
				<jsp:param name="type" value="top_searched" />
				<jsp:param name="title" value="Most searching products" />
			</jsp:include>
			
			<c:set var="products" value="${topViewed}" scope="request"/>
			<jsp:include page="/common/ProductSection.jsp">
				<jsp:param name="type" value="top_viewed" />
				<jsp:param name="title" value="Top view products" />
			</jsp:include>
			
			<div>
				<span class="title">Suggestions for you</span>
				<jsp:include page="/common/ProductList.jsp" />
			</div>
		</div>
		
		<script src="<c:url value="/static/js/autoSlides.js" />"></script>
		<script>
			AutomaticSlideshow({
				parentSelector : '.automatic-slideshow',
				slideSelector : '.slide',
				iconBottom : true,
				iconSelector : '.slide-icon',
				autoPlay : true,
				delay : 4000
			});
			
			// categories toggle scroll down
		    const toggleScrolldownBtn = document.querySelector('.toggle-scrolldown-btn');
		    const categoriesWrapper = document.querySelector('.categories-wrapper');
		    if (categoriesWrapper.offsetHeight > 179) {
		    	toggleScrolldownBtn.addEventListener('click', () => {
		    		toggleScrolldownBtn.classList.toggle('active');
		            categoriesWrapper.classList.toggle('active');
		        });
		    }
		    else {
		    	toggleScrolldownBtn.style.display = 'none';
		    }
		</script>
	</jsp:body>
</l:MainLayout>