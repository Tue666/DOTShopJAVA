<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="title"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="https://www.graphicsprings.com/filestorage/stencils/bdc5649fb67a5ab2fc8b4a0dc0eac951.png?width=500&height=500" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value="/static/css/auth-style.css" />?v=0.0.1">
    <script src="<c:url value="/static/js/jquery-1.11.1.min.js" />?v=0.0.1"></script>
    
</head>
<body>
    <div class="container w-100 h-100 d-flex justify-content-center align-items-center">
        <!-- Content Start -->
		<jsp:doBody />
		<!-- Content End -->
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <script src="<c:url value="/static/js/auth.js" />?v=0.0.1"></script>
    <script src="<c:url value="/static/js/main.js" />?v=0.0.1"></script>
    <script src="<c:url value="/static/js/ajax.js" />?v=0.0.1"></script>
    
</body>
</html>