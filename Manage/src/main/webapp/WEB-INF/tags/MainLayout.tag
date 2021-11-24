<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ attribute name="title"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${title}</title>
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	
	<!-- Bootstrap Core CSS -->
	<link rel="stylesheet" href="<c:url value="/static/css/bootstrap.css" />?v=0.0.1">
	
	<!-- Custom CSS -->
	<link rel="stylesheet" href="<c:url value="/static/css/style.css" />?v=0.0.1">
	
	<!-- font-awesome icons CSS -->
	<link rel="stylesheet" href="<c:url value="/static/css/font-awesome.css"/>?v=0.0.1"> 
	<!-- //font-awesome icons CSS-->

	<!--webfonts-->
	<link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,latin-ext" rel="stylesheet">
	<!--//webfonts--> 
	
	<!-- side nav css file -->
	<link  media='all' rel="stylesheet" href="<c:url value='/static/css/SidebarNav.min.css'/>?v=0.0.1">
	<!-- //side nav css file --> 

	<script src="<c:url value="/static/js/jquery-1.11.1.min.js" />?v=0.0.1"></script>
	<script src="<c:url value="/static/js/modernizr.custom.js" />?v=0.0.1"></script>
	
	<!-- chart -->
	<script src="<c:url value="/static/js/Chart.js" />?v=0.0.1"></script>
	<!-- //chart -->
	
	<!-- Metis Menu -->
	<script src="<c:url value="/static/js/metisMenu.min.js" />?v=0.0.1"></script>
	<script src="<c:url value="/static/js/custom.js" />?v=0.0.1"></script>
	<link rel="stylesheet" href="<c:url value="/static/css/custom.css" />?v=0.0.1">
	<!--//Metis Menu -->
	
	<style>
	#chartdiv {
  		width: 100%;
  		height: 295px;
	}
	</style>
	<!--pie-chart --><!-- index page sales reviews visitors pie chart -->
	<script src="<c:url value="/static/js/pie-chart.js" />?v=0.0.1"></script>
	
	<script type="text/javascript">

        $(document).ready(function () {
            $('#demo-pie-1').pieChart({
                barColor: '#2dde98',
                trackColor: '#eee',
                lineCap: 'round',
                lineWidth: 8,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

            $('#demo-pie-2').pieChart({
                barColor: '#8e43e7',
                trackColor: '#eee',
                lineCap: 'butt',
                lineWidth: 8,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

            $('#demo-pie-3').pieChart({
                barColor: '#ffc168',
                trackColor: '#eee',
                lineCap: 'square',
                lineWidth: 8,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

           
        });

    </script>
	<!-- //pie-chart --><!-- index page sales reviews visitors pie chart -->
	
	<!-- requried-jsfiles-for owl -->
	<link rel="stylesheet" href="<c:url value="/static/css/owl.carousel.css" />?v=0.0.1">
	<script src="<c:url value="/static/js/owl.carousel.js" />?v=0.0.1"></script>
	<script>
			$(document).ready(function() {
			$("#owl-demo").owlCarousel({
				items : 3,
				lazyLoad : true,
				autoPlay : true,
				pagination : true,
				nav:true,
			});
		});
	</script>
	<!-- //requried-jsfiles-for owl -->
</head>
<body class="cbp-spmenu-push">
	<div class="main-content">

	<!-- Header Start -->
	<jsp:include page="/common/MainHeader.jsp" />
	<!-- Header End -->
	
	<!-- Sidebar Start -->
	<jsp:include page="/common/Sidebar.jsp" />
	<!-- Sidebar End -->
	
	
	<!-- Content Start -->
	<div id="page-wrapper">
		<jsp:doBody />
	</div>
	<!-- Content End -->
	
	<!-- Footer Start -->
	<jsp:include page="/common/MainFooter.jsp" />
	<!-- Footer End -->
	
	<!-- Classie --><!-- for toggle left push menu script -->
		<script src="<c:url value="/static/js/classie.js" />?v=0.0.1"></script>
		<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				body = document.body;
				
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			

			function disableOther( button ) {
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
			}
		</script>
	<!-- //Classie --><!-- //for toggle left push menu script -->
	
	<!--scrolling js-->
	<script src="<c:url value="/static/js/jquery.nicescroll.js" />?v=0.0.1"></script>
	<script src="<c:url value="/static/js/scripts.js" />?v=0.0.1"></script>
	<!--//scrolling js-->
	
	<!-- side nav js -->
	<script src="<c:url value="/static/js/SidebarNav.min.js" />?v=0.0.1"></script>
	<script>
      $('.sidebar-menu').SidebarNav()
    </script>
	<!-- //side nav js -->
	
	<!-- Bootstrap Core JavaScript -->
   	<script src="<c:url value="/static/js/bootstrap.js" />?v=0.0.1"></script>
	<!-- //Bootstrap Core JavaScript -->
	
	</div>

</body>
</html>