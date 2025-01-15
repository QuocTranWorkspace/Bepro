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

<title>Profile</title>

<!--font-->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
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

					<li class="sidebar-item active"><a class="sidebar-link"
						href="${base }/administrator/profile"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">Trang
								Cá Nhân</span>
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

					<li class="sidebar-item"><a class="sidebar-link"
						href="${base }/administrator/saleOrderList"> <i
							class="align-middle" data-feather="user-plus"></i> <span
							class="align-middle">Danh sách đơn hàng</span>
					</a></li>
				</ul>
			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle"> <i
					class="hamburger align-self-center"></i>
				</a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle" href="#" id="alertsDropdown"
							data-bs-toggle="dropdown">
								<div class="position-relative">
									<i class="align-middle" data-feather="bell"></i> <span
										class="indicator">4</span>
								</div>
						</a>
							<div
								class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
								aria-labelledby="alertsDropdown">
								<div class="dropdown-menu-header">4 Thông báo mới</div>
								<div class="list-group">
									<a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="text-danger" data-feather="alert-circle"></i>
											</div>
											<div class="col-10">
												<div class="text-dark">Cập nhật</div>
												<div class="text-muted small mt-1">Khởi động lại</div>
												<div class="text-muted small mt-1">30m ago</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="text-warning" data-feather="bell"></i>
											</div>

										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="text-primary" data-feather="home"></i>
											</div>
											<div class="col-10">
												<div class="text-dark">Đăng nhập từ 192.186.1.8</div>
												<div class="text-muted small mt-1">5h trước</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="text-success" data-feather="user-plus"></i>
											</div>
											<div class="col-10">
												<div class="text-dark">Kết nối mới</div>
												<div class="text-muted small mt-1">Lan đã chấp nhận</div>
												<div class="text-muted small mt-1">14h trước</div>
											</div>
										</div>
									</a>
								</div>
								<div class="dropdown-menu-footer">
									<a href="#" class="text-muted">Tất cả thông báo</a>
								</div>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle" href="#" id="messagesDropdown"
							data-bs-toggle="dropdown">
								<div class="position-relative">
									<i class="align-middle" data-feather="message-square"></i>
								</div>
						</a>
							<div
								class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
								aria-labelledby="messagesDropdown">
								<div class="dropdown-menu-header">
									<div class="position-relative">4 lời nhắn</div>
								</div>
								<div class="list-group">
									<a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="${base}/img/adminIMG/avatars/avatar-5.jpg"
													class="avatar img-fluid rounded-circle"
													alt="Vanessa Tucker">
											</div>
											<div class="col-10 ps-2">
												<div class="profile-header">&nbsp;</div>
												<div class="text-dark">Vân</div>
												<div class="text-muted small mt-1">Đồng ý lời mời</div>
												<div class="text-muted small mt-1">15p trước</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="${base}/img/adminIMG/avatars/avatar-2.jpg"
													class="avatar img-fluid rounded-circle"
													alt="William Harris">
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">Hà</div>
												<div class="text-muted small mt-1">Trả lười tin của
													bạn</div>
												<div class="text-muted small mt-1">2g ago</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="${base}/img/adminIMG/avatars/avatar-4.jpg"
													class="avatar img-fluid rounded-circle"
													alt="Christina Mason">
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="${base}/img/adminIMG/avatars/avatar-3.jpg"
													class="avatar img-fluid rounded-circle"
													alt="Sharon Lessman">
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">Mận</div>
												<div class="text-muted small mt-1">Mãi keo bạn nhé:)</div>
												<div class="text-muted small mt-1">5g trước</div>
											</div>
										</div>
									</a>
								</div>
								<div class="dropdown-menu-footer">
									<a href="#" class="text-muted">Xem Tất Cả</a>
								</div>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle d-inline-block d-sm-none"
							href="#" data-bs-toggle="dropdown"> <i class="align-middle"
								data-feather="settings"></i>
						</a> <a class="nav-link dropdown-toggle d-none d-sm-inline-block"
							href="#" data-bs-toggle="dropdown"> <img
								src="${base}/img/adminIMG/avatars/lol1.jpg"
								class="avatar img-fluid rounded me-1" alt="Quoc Tran" /> <span
								class="text-dark">${userLogined.username }</span>
						</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="pages-profile.html"><i
									class="align-middle me-1" data-feather="user"></i> Profile</a> <a
									class="dropdown-item" href="#"><i class="align-middle me-1"
									data-feather="pie-chart"></i> Phân tích</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="index.html"><i
									class="align-middle me-1" data-feather="settings"></i> Cài đặt
									& Privacy</a> <a class="dropdown-item" href="#"><i
									class="align-middle me-1" data-feather="help-circle"></i> Trung
									tâm hỗ trợ</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="${base }/logout">Log out</a>
							</div></li>
					</ul>
				</div>
			</nav>

			<main class="content">
				<div class="container-fluid p-0">

					<div class="mb-3">
						<h1 class="h3 d-inline align-middle">Trang cá nhân</h1>
					</div>
					<div class="row">
						<div class="col-md-4 col-xl-3">
							<div class="card mb-3">
								<div class="card-header">
									<h5 class="card-title mb-0">Thông tin chi tiết</h5>
								</div>
								<div class="card-body text-center">
									<img src="${base}/img/adminIMG/avatars/avatar-4.jpg"
										alt="Christina Mason" class="img-fluid rounded-circle mb-2"
										width="128" height="128" />
									<h5 class="card-title mb-0">${userLogined.username }</h5>
									<div class="text-muted mb-2">Lead Developer</div>

									<div>
										<a class="btn btn-primary btn-sm" href="#">Theo dõi</a> <a
											class="btn btn-primary btn-sm" href="#"><span
											data-feather="message-square"></span> Tin nhắn</a>
									</div>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">Skills</h5>
									<a href="#" class="badge bg-primary me-1 my-1">HTML</a> <a
										href="#" class="badge bg-primary me-1 my-1">JavaScript</a> <a
										href="#" class="badge bg-primary me-1 my-1">Sass</a> <a
										href="#" class="badge bg-primary me-1 my-1">Angular</a> <a
										href="#" class="badge bg-primary me-1 my-1">Vue</a> <a
										href="#" class="badge bg-primary me-1 my-1">React</a> <a
										href="#" class="badge bg-primary me-1 my-1">Redux</a> <a
										href="#" class="badge bg-primary me-1 my-1">UI</a> <a href="#"
										class="badge bg-primary me-1 my-1">UX</a>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">Về tôi</h5>
									<ul class="list-unstyled mb-0">
										<li class="mb-1"><span data-feather="home"
											class="feather-sm me-1"></span> Sống ở <a href="#">Hà
												Nội, VN</a></li>

										<li class="mb-1"><span data-feather="briefcase"
											class="feather-sm me-1"></span> Works at <a href="#">GitHub</a></li>
										<li class="mb-1"><span data-feather="map-pin"
											class="feather-sm me-1"></span> From <a href="#">Boston</a></li>
									</ul>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">Link MXH</h5>
									<ul class="list-unstyled mb-0">
										<li class="mb-1"><a href="#">staciehall.co</a></li>
										<li class="mb-1"><a href="#">Twitter</a></li>
										<li class="mb-1"><a href="#">Facebook</a></li>
										<li class="mb-1"><a href="#">Instagram</a></li>
										<li class="mb-1"><a href="#">LinkedIn</a></li>
									</ul>
								</div>
							</div>
						</div>

						<div class="col-md-8 col-xl-9">
							<div class="card">
								<div class="card-header">

									<h5 class="card-title mb-0">Hoạt động</h5>
								</div>
								<div class="card-body h-100">

									<div class="d-flex align-items-start">
										<img src="${base}/img/adminIMG/avatars/avatar-5.jpg"
											width="36" height="36" class="rounded-circle me-2"
											alt="Vanessa Tucker">
										<div class="flex-grow-1">
											<small class="float-end text-navy">5m ago</small> <strong>Vân</strong>
											Đã theo dõi <strong>Mận</strong><br /> <small
												class="text-muted">Hôm nay 7:51ápm</small><br />

										</div>
									</div>

									<hr />
									<div class="d-flex align-items-start">
										<img src="${base}/img/adminIMG/avatars/avatar.jpg" width="36"
											height="36" class="rounded-circle me-2" alt="Charles Hall">
										<div class="flex-grow-1">
											<small class="float-end text-navy">30p trước</small> <strong>Chánh
											</strong> Đăng lên tường của <strong>Mận</strong><br /> <small
												class="text-muted">Hôm nay 7:21 pm</small>

											<div class="border text-sm text-muted p-2 mt-1">Chiều
												đến, 3 cháu gồm H.T.N (14 tuổi), H.T.Đ (10 tuổi) và H.T.K.V
												(8 tuổi) cùng chở nhau bằng xe đạp lên nhà anh em để ăn cỗ.
												Khi đi đến trước gara ô tô Lê Hiển (ở xóm 9, xã Quỳnh Tân,
												huyện Quỳnh Lưu, Nghệ An) thì đúng lúc xảy ra vụ nổ, khiến
												cả 3 cháu bị thương nặng.</div>

											<a href="#" class="btn btn-sm btn-danger mt-1"><i
												class="feather-sm" data-feather="heart"></i> Thích</a>
										</div>
									</div>

									<hr />
									<div class="d-flex align-items-start">
										<img src="${base}/img/adminIMG/avatars/avatar-4.jpg"
											width="36" height="36" class="rounded-circle me-2"
											alt="Christina Mason">
										<div class="flex-grow-1">
											<small class="float-end text-navy">1g trước</small> <strong>Mận
											</strong> Đăng blog mới<br /> <small class="text-muted">Hôm
												nay 6:35 pm</small>
										</div>
									</div>

									<hr />
									<div class="d-flex align-items-start">
										<img src="${base}/img/adminIMG/avatars/avatar-2.jpg"
											width="36" height="36" class="rounded-circle me-2"
											alt="William Harris">
										<div class="flex-grow-1">
											<small class="float-end text-navy">3g trước</small> <strong>Hải
											</strong> Đăng 2 ảnh lên dòng thời gian của <strong>Mận</strong><br />
											<small class="text-muted">Hôm nay 5:12 pm</small>

											<div class="row g-0 mt-1">
												<div class="col-6 col-md-4 col-lg-4 col-xl-3">
													<img src="${base}/img/adminIMG/photos/unsplash-1.jpg"
														class="img-fluid pe-2" alt="Unsplash">
												</div>
												<div class="col-6 col-md-4 col-lg-4 col-xl-3">
													<img src="${base}/img/adminIMG/photos/unsplash-2.jpg"
														class="img-fluid pe-2" alt="Unsplash">
												</div>
											</div>

											<a href="#" class="btn btn-sm btn-danger mt-1"><i
												class="feather-sm" data-feather="heart"></i> Thích</a>
										</div>
									</div>

									<hr />
									<div class="d-flex align-items-start">
										<img src="${base}/img/adminIMG/avatars/avatar-2.jpg"
											width="36" height="36" class="rounded-circle me-2"
											alt="William Harris">
										<div class="flex-grow-1">
											<small class="float-end text-navy">1ng trước</small> <strong>Hải</strong>
											Đang theo dõi <strong>Mận</strong><br /> <small
												class="text-muted">Hôm qua 3:12 pm</small>

											<div class="d-flex align-items-start mt-1">
												<a class="pe-3" href="#"> <img
													src="${base}/img/adminIMG/avatars/avatar-4.jpg" width="36"
													height="36" class="rounded-circle me-2"
													alt="Christina Mason">
												</a>
												<div class="flex-grow-1">
													<div class="border text-sm text-muted p-2 mt-1">Chiều
														đến, 3 cháu gồm H.T.N (14 tuổi), H.T.Đ (10 tuổi) và
														H.T.K.V (8 tuổi) cùng chở nhau bằng xe đạp lên nhà anh em
														để ăn cỗ.</div>
												</div>
											</div>
										</div>
									</div>

									<hr />
									<div class="d-flex align-items-start">
										<img src="${base}/img/adminIMG/avatars/avatar-4.jpg"
											width="36" height="36" class="rounded-circle me-2"
											alt="Christina Mason">
										<div class="flex-grow-1">
											<small class="float-end text-navy">1d ago</small> <strong>Mận
											</strong> Đăng blog mới<br /> <small class="text-muted">Hôm
												qua 2:43 pm</small>
										</div>
									</div>

									<hr />
									<div class="d-flex align-items-start">
										<img src="${base}/img/adminIMG/avatars/avatar.jpg" width="36"
											height="36" class="rounded-circle me-2" alt="Charles Hall">
										<div class="flex-grow-1">
											<small class="float-end text-navy">1d ago</small> <strong>Hậu
											</strong> Đang theo dõi <strong>Mận</strong><br /> <small
												class="text-muted">Hôm qua 1:51 pm</small>
										</div>
									</div>

									<hr />
									<div class="d-grid">
										<a href="#" class="btn btn-primary">Tải thêm</a>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a class="text-muted" href="https://adminkit.io/"
									target="_blank"><strong>AdminKit</strong></a> - <a
									class="text-muted" href="https://adminkit.io/" target="_blank"><strong>Bootstrap
										Admin</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-end">
							<ul class="list-inline">
								<li class="list-inline-item"><a class="text-muted"
									href="https://adminkit.io/" target="_blank">Hỗ trợ</a></li>
								<li class="list-inline-item"><a class="text-muted"
									href="https://adminkit.io/" target="_blank">Trung tâm khách
										hàng</a></li>
								<li class="list-inline-item"><a class="text-muted"
									href="https://adminkit.io/" target="_blank">Điều khoản</a></li>
								<li class="list-inline-item"><a class="text-muted"
									href="https://adminkit.io/" target="_blank">Dịch vụ</a></li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="${base}/js/adminJS/app.js"></script>

</body>

</html>