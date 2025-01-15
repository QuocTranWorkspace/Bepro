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

<!--font-->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">

<!-- simple Pagination -->
<link type="text/css" rel="stylesheet" media='screen'
	href='${pageContext.servletContext.contextPath}/css/adminCSS/simplePagination.css' />

<title>Product</title>

<!--font-->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">

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
					<li class="sidebar-header">Trang quản lý</li>

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

					<li class="sidebar-item active"><a class="sidebar-link"
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
						<h3 class="text-primary mt-3 mr-4 float-left">Quản lý sản
							phẩm</h3>
						<h4 class="text-danger mt-3 mr-4 float-right" name="useName">Xin
							chào, Quoc Tran</h4>
					</div>

					<div class="row">
						<div class="col-lg">
							<sf:form modelAttribute="addProductModel"
								class="form-horizontalw-100"
								action="${base}/administrator/product/addProduct" method="POST"
								id="form1" enctype="multipart/form-data">

								<div class="form-group">
									<label class="control-label col-sm-8" for=title>Id:</label>
									<sf:input path="id" type="text" class="form-control"
										id="idTitle" placeholder="Nhập id sản phẩm" name="title"></sf:input>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-8" for=category>Danh
										mục</label>
									<sf:select path="category.id" id="category"
										class="form-control">
										<sf:options items="${categories }" itemValue="id"
											itemLabel="name" />
									</sf:select>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-8" for=title>Tên sản
										phẩm:</label>
									<sf:input path="title" type="text" class="form-control"
										id="idTitle" placeholder="Nhập tên sản phẩm" name="title"
										required="required"></sf:input>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-8" for="price">Giá
										sản phẩm:</label>
									<sf:input path="price" type="text" class="form-control"
										id="idPrice" placeholder="Nhập giá thực" name="price"
										required="required"></sf:input>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-8" for="priceSale">Giá
										bán:</label>
									<sf:input path="priceSale" type="text" class="form-control"
										id="idPriceSale" placeholder="Nhập giá bán" name="priceSale"></sf:input>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-8" for="avatar">Avatar:</label>
									<input type="file" class="form-control" id="idAvatar"
										placeholder="Mô tả ngắn" name="productAvatar">
								</div>
								<div class="form-group">
									<c:if test="${addProductModel.avatar !=null}">
										<img alt="" style="width: 100px; height: 100px;"
											src="${base }/upload/${addProductModel.avatar}">
									</c:if>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-8" for="pictures">Ảnh:</label>
									<input type="file" class="form-control" id="idPictures"
										placeholder="Mô tả ngắn" name="productPictures"
										multiple="multiple">
								</div>
								<div class="form-group">
									<c:forEach items="${addProductModel.productList }"
										var="productImage">
										<img alt="" style="width: 100px; height: 100px;"
											src="${base }/upload/${productImage.path}">
									</c:forEach>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-8" for="shortDes">Mô
										tả ngắn:</label>
									<sf:input path="shortDes" type="text" class="form-control"
										id="idShortDes" placeholder="Mô tả ngắn" name="shortDes"></sf:input>
								</div>
								<div class="form-group">
									<label class="control-label" for="detailDes">Mô tả:</label>
									<div>
										<!-- <div id="summernote"></div>
									<div>
										<input value="" style="display: none" id="summerNoteValue">
									</div> -->
									</div>
									<sf:textarea path="detailDes" type="text" class="form-control"
										id="idDetailDes" placeholder="Mô tả chi tiết" name="detailDes"
										required="required"></sf:textarea>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-8" for="seo">SEO:</label>
									<sf:input path="seo" type="text" class="form-control"
										id="idSeo" placeholder="seo" name="seo"></sf:input>
								</div>
								<div class="form-group">
									<button type="submit" form="form1" value="Submit"
										style="border: 0; color: white; font-size: 15px; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; background-color: rgb(20, 208, 250); width: 370px; height: 30px; border-radius: 5px; margin-top: 20px;">
										Thêm/Sửa</button>
								</div>

							</sf:form>
							<!-- <div class="form-group">
									<button type="button" onclick=testBtn()>Add</button>
								</div>
							Spring-form
						</div> -->
							<!-- Col 1 -->
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	<!-- 	<script type="text/javascript">
	function testBtn() {
		var html = $('#summernote').summernote('code');
		alert(html);
	};
	$(document).ready(function() {
		  $('#summernote').summernote();
		});
	</script> -->

	<script src="${base}/js/adminJS/app.js"></script>
</body>
</html>