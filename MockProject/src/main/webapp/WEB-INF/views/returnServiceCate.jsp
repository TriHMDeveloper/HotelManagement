<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="<c:url value="/decoration/fontawesome-free-5.15.2-web/css/all.css" />"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/decoration/css/style.css"/>">
<link rel="stylesheet"
	href="<c:url value="/decoration/css/datatable.min.css"/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value="/decoration/css/home.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/decoration/css/datatablecrudView.css"/>">
<style>
svg {
	border: 10px groove #B2620D;
}

.table-wrapper {
	opacity: 0.85;
}

.name a {
	font-family: 'New Tegomin', serif;
}
</style>
</head>

<body style="min-height: 100vh;">
	<jsp:include page="header.jsp" />
	<div class="content w-100 d-flex ">
		<jsp:include page="menu.jsp" />
		<div class="p-3 d-flex" id="child">
		<jsp:include page="servicecateView.jsp" />
		</div>
	</div>	
	<script src="<c:url value="/decoration/js/jquery.min.js" />"></script>
	<script src="<c:url value="/decoration/js/popper.min.js"/>"></script>
	<script src="<c:url value="/decoration/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/decoration/js/jquery.validate.min.js"/>"></script>
	<script src="<c:url value="/decoration/js/datatable.min.js"/>"></script>
	<script src="<c:url value="/decoration/js/loader.js"/>"></script>
	<script src="<c:url value="/decoration/js/loadAjax.js"/>"></script>
	<script type="text/javascript">
	$(document).on('click', '.menu-item a', function() {
	    $(this).parent().addClass('active').siblings().removeClass('active');
	})
	</script>
</body>

</html>