<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="java.io.Console"%>
<%@page import="org.w3c.dom.html.HTMLDivElement"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords"
	content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<!-- Web Icon -->
<link rel="shortcut icon" href="${base}/img/WebIcon.png" />

<!-- adminKit core -->
<script src="https://unpkg.com/@adminkit/core@latest/dist/js/app.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/@adminkit/core@latest/dist/css/app.css">

<link rel='stylesheet' type='text/css' media='screen'
	href='${base}/css/adminCSS/app.css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<!-- common variables -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- jstl -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Ajax -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
	integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
	integrity="sha512-epf6HPShLQ8zgJD4pP+tSNkYQ9aVUwTeX2II3jlGQrC0Etb9MNeogMrZIgCo9/IAXEAyS8zjz+2nsUpX3/CYyg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
	integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- Import thư viện spring-form -->
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!-- include libraries(jQuery, bootstrap) -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
<script type="text/javascript"
	src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- include summernote css/js-->
<link href="summernote-bs5.css" rel="stylesheet">
<script src="summernote-bs5.js"></script>

<title>Sale Order Detail</title>

<!--font-->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">

<!-- simple Pagination -->
<link type="text/css" rel="stylesheet" media='screen'
	href='${pageContext.servletContext.contextPath}/css/adminCSS/simplePagination.css' />

<style>
.alert {
	max-width: 500px;
	margin: auto;
}
</style>


</head>
<body>

	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href=""> <span class="align-middle">Bepro</span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">Trang Quản Lý</li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${base }/administrator/dashBoard"> <i
							class="align-middle" data-feather="sliders"></i> <span
							class="align-middle">Dashboard</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${base }/administrator/profile"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">Trang
								Cá Nhân</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${base }/administrator/signUp"> <i class="align-middle"
							data-feather="user-plus"></i> <span class="align-middle">Đăng
								Ký</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${base }/administrator/product/"> <i
							class="align-middle" data-feather="user-plus"></i> <span
							class="align-middle">Thêm/ Sửa Sản Phẩm</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${base }/administrator/productList"> <i
							class="align-middle" data-feather="user-plus"></i> <span
							class="align-middle">Danh Mục Sản Phẩm</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${base }/administrator/userControl"> <i
							class="align-middle" data-feather="user-plus"></i> <span
							class="align-middle">Quản lý người dùng</span>
					</a></li>


					<li class="sidebar-item"><a class="sidebar-link"
						href="${base }/administrator/userList"> <i
							class="align-middle" data-feather="user-plus"></i> <span
							class="align-middle">Danh sách người dùng</span>
					</a></li>

					<li class="sidebar-item active"><a class="sidebar-link"
						href="${base }/administrator/saleOrderList"> <i
							class="align-middle" data-feather="user-plus"></i> <span
							class="align-middle">Danh sách đơn hàng</span>
					</a></li>
				</ul>
			</div>
		</nav>

		<main class="content" style="background-color: white;">
			<section class="py-5">
				<div class="container">
					<form
						action="${base }/administrator/saleOrderControl/${saleOrder.id}"
						method="get">
						<h2 style="text-align: center; margin-top: -40px">Thông tin
							đơn hàng</h2>
						<p>ID: ${sOInDatabase.id }</p>
						<p>Mã đơn hàng: ${sOInDatabase.code }</p>
						<p>Khách hàng: ${sOInDatabase.customerName }</p>
						<div class="row" style="display: flex;">
							<c:forEach var="product" items="${productBySOP }">
								<div class="col-4" style="margin-top: 40px;">
									<div class="card h-100" style="display: flex; width: 300px;">
										<!-- Sale badge-->
										<div class="badge bg-dark text-white position-absolute"
											style="top: 0.5rem; right: 0.5rem; margin-right: 20px">Sale</div>
										<!-- Product image-->
										<img class="card-img-top" id="proAvatar"
											src="${pageContext.servletContext.contextPath}/upload/${product.avatar }"
											alt="..."
											style="margin: auto; margin-top: 20px; width: 200px" />
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="text-center">
												<!-- Product name-->
												<h5 class="fw-bolder">${product.title }</h5>
												<!-- Product reviews-->
												<div
													class="d-flex justify-content-center small text-warning mb-2">
													<div class="bi-star-fill"></div>
													<div class="bi-star-fill"></div>
													<div class="bi-star-fill"></div>
													<div class="bi-star-fill"></div>
													<div class="bi-star-fill"></div>
												</div>
												<!-- Product price-->
												<fmt:setLocale value="vi_VN" />
												<span class="text-muted text-decoration-line-through">
													<fmt:formatNumber value="${product.price}" type="currency" />
												</span>
												<fmt:formatNumber value="${product.priceSale}"
													type="currency" />
											</div>
										</div>
										<!-- Product actions-->
										<div
											class="card-footer p-4 pt-0 border-top-0 bg-transparent d-flex"
											style="justify-content: center;">
											<div class="text-right">
												<a class="btn btn-outline-dark mt-auto"
													href="${base }/productDetail/${product.id }"> Chi tiết
												</a>
											</div>

										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<h3 style="float: right; margin-top: 50px">Tổng tiền:
							${sOInDatabase.total }</h3>
					</form>
				</div>
			</section>
		</main>
	</div>


	<script type="text/javascript">
	$( document ).ready(function() {
		
		//set giá trị category
		$("#categoryId").val(${productSearch.categoryId});
		
		$(function() {
		    $("#paging").pagination({
		        currentPage: ${prodList.currentPage},
		        items: ${prodList.totalItems},
		        itemsOnPage: ${prodList.sizeOfPage},
		        cssStyle: 'light-theme',
		        onPageClick: function(pageNumber, event) {
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				}
		    });
		});
		});

	</script>

	<script src="${base}/js/adminJS/app.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${base}/js/adminJS/jquery.simplePagination.js"></script>

</body>

</html>