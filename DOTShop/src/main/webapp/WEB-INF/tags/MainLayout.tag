<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="title"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en" data-theme=light>
<head>
	<meta charset="UTF-8">
	<link rel="icon" href="https://www.graphicsprings.com/filestorage/stencils/bdc5649fb67a5ab2fc8b4a0dc0eac951.png?width=500&height=500" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>${title}</title>
	<!-- Style -->
	<!-- Bootstrap Icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <!-- Toastr CSS -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <!-- Slick Slider CSS -->
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<!-- Custom Styled -->
	<link rel="stylesheet" href="<c:url value="/static/css/style.css" />?v=0.0.1">
	<link rel="stylesheet" href="<c:url value="/static/css/autoSlides.css" />?v=0.0.1">
</head>
<body>
	<!-- Header Start -->
	<jsp:include page="/common/MainHeader.jsp" />
	<!-- Header End -->
	
	<!-- Content Start -->
	<jsp:doBody />
	<!-- Content End -->
	
	<!-- Footer Start -->
	<jsp:include page="/common/MainFooter.jsp" />
	<!-- Footer End -->
	
	<!-- CDN JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <!-- Sweetalert JS -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- Toastr JS -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <!-- Slick slider JS -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- Custom JS -->
    <script src="<c:url value="/static/js/toastr.js" />?v=0.0.1"></script>
	<script src="<c:url value="/static/js/main.js" />?v=0.0.1"></script>
	<script src="<c:url value="/static/js/ajax.js" />?v=0.0.1"></script>
	<script src="<c:url value="/static/js/dialog.js" />?v=0.0.1"></script>
	
	<script>
		// Slick Product Section
        var slicker = $('.product-wrapper');
        if (slicker) {
            slicker.slick({
                slidesToShow: 5,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 3000,
                variableWidth: true,
                prevArrow: '<i class="bi bi-chevron-left slick-prev-btn"></i>',
                nextArrow: '<i class="bi bi-chevron-right slick-next-btn"></i>'
            });
        }
    </script>
</body>
</html>