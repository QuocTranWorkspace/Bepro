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

<title>Product</title>

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
				<a class="sidebar-brand" href="index.html"> <span
					class="align-middle">Bepro</span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">Pages</li>

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
						href="${base }/administrator/product/"> <i
							class="align-middle" data-feather="user-plus"></i> <span
							class="align-middle">Thêm/ Sửa Sản Phẩm</span>
					</a></li>

					<li class="sidebar-item active"><a class="sidebar-link"
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

					<li class="sidebar-item"><a class="sidebar-link"
						href="${base }/administrator/saleOrderList"> <i
							class="align-middle" data-feather="user-plus"></i> <span
							class="align-middle">Danh sách đơn hàng</span>
					</a></li>

				</ul>
			</div>
		</nav>

		<main class="content" style="background-color: white;">
			<div class="container-fluid p-0">

				<div class="container">

					<div class="d-flex p-8 justify-content-between">
						<h3 class="text-primary mt-3 mr-4 float-left">Product
							Management</h3>
						<h4 class="text-danger mt-3 mr-4 float-right">Hello,
							${userLogined.username }</h4>
					</div>

					<form action="${base }/administrator/productList" method="get">
						<!-- tìm kiếm sản phẩm trên danh sách -->
						<div class="d-flex flex-row justify-content-between mt-4">
							<div class="d-flex flex-row">

								<input id="page" name="page" class="form-control"
									value="${productSearch.currentPage }" style="display: none;">

								<!-- tìm kiếm theo tên sản phẩm -->
								<input type="text" id="keyword" name="keyword"
									class="form-control" placeholder="Search" autocomplete="off"
									style="margin-right: 5px;" value="${productSearch.keyword }">

								<!-- tìm kiếm theo danh mục sản phẩm -->
								<select class="form-control" name="categoryId" id="categoryId"
									style="margin-right: 5px;">
									<option value="0">All</option>
									<c:forEach items="${categories }" var="category">
										<option value="${category.id }">${category.name }</option>
									</c:forEach>
								</select>

								<button type="submit" id="btnSearch" name="btnSearch"
									value="Search" class="btn btn-primary">Search</button>
							</div>
							<div>
								<a class="btn btn-outline-primary"
									href="${base }/administrator/product" role="button"> Add
									New </a>
							</div>
						</div>

						<div class="col-md-12 mt-2" style="margin-left: 30px">
							<table class="table table-hover mt-4">
								<thead>
									<tr>
										<th>ID</th>
										<th>Avatar</th>
										<th>Tên sản phẩm</th>
										<th>Danh mục</th>
										<th>Giá thực</th>
										<th>Giá bán</th>
										<th style="width: 200px">Mô tả ngắn</th>
										<th>Trạng thái</th>
										<th>Thao tác</th>
									</tr>
								</thead>
								<tbody id="table-body">
									<c:forEach items="${prodList.data }" var="product"
										varStatus="loop">
										<tr>
											<td>${product.id }</td>
											<td><img alt="" src="${base }/upload/${product.avatar }"
												style="max-width: 50px"></td>
											<td>${product.title }</td>
											<td>${product.category.name }</td>
											<td>${product.price }</td>
											<td>${product.priceSale }</td>
											<td style="height: 50px; flex-wrap: nowrap;">${product.shortDes }</td>
											<td><span id="_product_status_${product.id} }"> <c:choose>
														<c:when test="${product.status }">
															<input type="checkbox" checked="checked"
																readonly="readonly">
														</c:when>
														<c:otherwise>
															<input type="checkbox" readonly="readonly">
														</c:otherwise>
													</c:choose>
											</span></td>
											<td><a class="btn btn-sm btn-primary"
												href="${base }/administrator/product/${product.id }">Edit</a>
												<a class="btn btn-sm btn-primary"
												href="${base }/administrator/commentControl/${product.id}">View
													all comment</a> <a class="btn btn-sm btn-danger"
												href="${base }/administrator/productList/deleteProduct/${product.id }">Delete</a>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<!-- phân trang -->
							<div class="row">
								<div class="col-12 d-flex justify-content-center">
									<div id="paging"></div>
								</div>
							</div>
						</div>

					</form>
					<!-- Spring-form -->
				</div>
				<!-- Col 1 -->
			</div>
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