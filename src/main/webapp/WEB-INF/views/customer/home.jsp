<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel='stylesheet' type='text/css' media='screen'
	href='${base}/css/customerCSS/style.css'>
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
<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
<script type="text/javascript" src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- include summernote css/js-->
<link href="summernote-bs5.css" rel="stylesheet">
<script src="summernote-bs5.js"></script>

<title>Home</title>

<!-- Web Icon -->
<link rel="shortcut icon" href="${base}/img/WebIcon.png" />

<!--font-->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">

<!-- simple Pagination -->
<link type="text/css" rel="stylesheet" media='screen'
	href='${pageContext.servletContext.contextPath}/css/adminCSS/simplePagination.css' />
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
		<div class="logo">
			<a href="${base }/home">
				<p>Be.pro</p>
			</a>
		</div>
		<div class="navi">
			<div class="home">
				<a href="${base }/home">
					<h4>Trang chủ</h4>
				</a>
			</div>
			<div class="shop">
				<a href="">
					<h4>Cửa hàng</h4>
				</a>
			</div>
			<div class="port">
				<a href="">
					<h4>Portfolio</h4>
				</a>
			</div>
			<div class="blog">
				<a href="">
					<h4>Blog</h4>
				</a>
			</div>
			<div class="elements">
				<a href="">
					<h4>Khác</h4>
				</a>
			</div>
		</div>
		<div class="nav-right">
			<c:choose>
				<c:when test="${userLogined.username == null }">
					<div class="register">
						<div class="register1">
							<a href="${base }/register"> Đăng ký </a>
						</div>
						<div class="login">
							<a href="${base }/login"> Đăng nhập </a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="register">
						<div class="register1">
							<a href="${base }/logout">Đăng xuất</a>
						</div>
					</div>


				</c:otherwise>
			</c:choose>
			<div class="cart-icon">
				<a href="${base }/cart/checkout"> <i
					class="fa-sharp fa-solid fa-bag-shopping"> <span
						id="iconShowTotalItemsInCart">${totalItems }</span>
				</i>

				</a>
			</div>
			<div class="find-icon">
				<a href=""> <i class="fa-solid fa-magnifying-glass"></i>
				</a>
			</div>
		</div>
	</header>

	<div class="head-img">
		<div>
			<a href=""> <i class="fa-solid fa-chevron-left"></i>
			</a>
		</div>
		<div>
			<a href=""> <img src="${base}/img/customerIMG/Heading.png" alt="">
			</a>
		</div>
		<div>
			<a href=""> <i class="fa-solid fa-chevron-right"></i>
			</a>
		</div>
	</div>

	<nav>
		<div class="nav-content">
			<div>
				<i class="fa-solid fa-paper-plane"></i>
			</div>
			<div class="desc">
				<div>Free shipping</div>
				<div>Orders over: $99</div>
			</div>
		</div>
		<div class="nav-content">
			<div>
				<i class="fa-solid fa-arrows-rotate"></i>
			</div>
			<div class="desc">
				<div>30 days return</div>
				<div>If goods have problem</div>
			</div>
		</div>
		<div class="nav-content">
			<div>
				<i class="fa-solid fa-credit-card"></i>
			</div>
			<div class="desc">
				<div>Secure payment</div>
				<div>100% secure payment</div>
			</div>
		</div>
		<div class="nav-content">
			<div>
				<i class="fa-solid fa-user"></i>
			</div>
			<div class="desc">
				<div>24h support</div>
				<div>Dedicated support</div>
			</div>
		</div>
	</nav>

	<main>
		<section class="py-5">
			<div class="container">
			<form action="${base }/home" method="get">
						<!-- tìm kiếm sản phẩm trên danh sách -->
						<h4 style="text-align: center; margin-top: -60px">Tìm kiếm sản phẩm</h4>
						<div class="d-flex flex-row justify-content-center mt-4">
							
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
						</div>
				<div class="row" style="display: flex;">
					<input id="page" name="page" class="form-control"
						value="${productSearch.currentPage }" style="display: none;">
					<c:forEach var="product" items="${productList.data }">
						<div class="col-3" style="margin-top: 40px;">
							<div class="card h-100" style="display: flex; width: 300px;">
								<!-- Sale badge-->
								<div class="badge bg-dark text-white position-absolute"
									style="top: 0.5rem; right: 0.5rem; margin-right: 20px">Sale</div>
								<!-- Product image-->
								<img class="card-img-top" id="proAvatar"
									src="${pageContext.servletContext.contextPath}/upload/${product.avatar }"
									alt="..." style="margin: auto; margin-top: 20px" />
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
										<fmt:formatNumber value="${product.priceSale}" type="currency" />
									</div>
								</div>
								<!-- Product actions-->
								<div
									class="card-footer p-4 pt-0 border-top-0 bg-transparent d-flex"
									style="justify-content: center;">
									<div class="text-left">
										<a class="btn btn-outline-dark mt-auto" href="#"
											onclick="AddProductToCart('${base}', ${product.id }, 1, ${product.priceSale})">
											Add to cart </a>
									</div>
									<div class="text-right">
										<a class="btn btn-outline-dark mt-auto"
											href="${base }/productDetail/${product.id }"> View detail
										</a>
									</div>

								</div>
							</div>
						</div>
					</c:forEach>
					<!-- phân trang -->
					<div class="row">
						<div class="col-12 d-flex justify-content-center">
							<div id="paging" style="margin-top: 40px"></div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</section>
	</main>

	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>

	<script src="${base}/js/customerJS/scriptCart.js"></script>

	<script type="text/javascript">	
	$( document ).ready(function() {
		$("#paging").pagination({
	        currentPage: ${productList.currentPage},
	        items: ${productList.totalItems},
	        itemsOnPage: ${productList.sizeOfPage},
	        cssStyle: 'light-theme',
	        onPageClick: function(pageNumber, event) {
				$('#page').val(pageNumber);
				$('#btnSearch').trigger('click');
			}
	    });
	});
	</script>
	
		<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${base}/js/adminJS/jquery.simplePagination.js"></script>
</body>
</html>