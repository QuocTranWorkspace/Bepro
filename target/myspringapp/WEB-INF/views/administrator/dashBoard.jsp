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

<title>DashBoard</title>
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

					<li class="sidebar-item active"><a class="sidebar-link"
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
							class="nav-icon dropdown-toggle d-inline-block d-sm-none"
							href="#" data-bs-toggle="dropdown"> <i class="align-middle"
								data-feather="settings"></i>
						</a> <a class="nav-link dropdown-toggle d-none d-sm-inline-block"
							href="#" data-bs-toggle="dropdown"> <img
								src="${base}/img/adminIMG/avatars/lol1.jpg"
								class="avatar img-fluid rounded me-1" alt="Quoc Tran" /> <span
								class="text-dark">Quoc Tran</span>
						</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="pages-profile.html"><i
									class="align-middle me-1" data-feather="user"></i> Profile</a> <a
									class="dropdown-item" href="#"><i class="align-middle me-1"
									data-feather="pie-chart"></i>${userLogined.email }</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="index.html"><i
									class="align-middle me-1" data-feather="settings"></i> Cài đặt
								</a> <a class="dropdown-item" href="#"><i
									class="align-middle me-1" data-feather="help-circle"></i> Trợ
									giúp</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Đăng xuất</a>
							</div></li>
					</ul>
				</div>
			</nav>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3">
						<strong>Bản thống kê</strong>
					</h1>

					<div class="row">
						<div class="col-xl-7 col-md-7">
							<div class="card flex-fill w-100">
								<div class="card-header">

									<h5 class="card-title mb-0">Sơ Đồ Doanh Thu</h5>
								</div>
								<div class="card-body py-3">
									<div class="chart chart-sm">
										<canvas id="chartjs-dashboard-line"></canvas>
									</div>
								</div>
							</div>
						</div>


						<div class="col-xl-6 col-xxl-5 d-flex">
							<div class="w-100">
								<div class="row">
									<div class="col-sm-6">
										<div class="card" style="height: 145px">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Đơn hàng</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<i class="align-middle" data-feather="shopping-bag"></i>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">${totalSO }</h1>
												<!-- <div class="mb-0">
													<span class="text-danger"> <i
														class="mdi mdi-arrow-bottom-right"></i> -3.65%
													</span> <span class="text-muted">Since last week</span>
												</div> -->
											</div>
										</div>
										<div class="card" style="height: 145px">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Sản phẩm</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<i class="align-middle" data-feather="users"></i>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">${productSold }</h1>
												<!-- <div class="mb-0">
													<span class="text-success"> <i
														class="mdi mdi-arrow-bottom-right"></i> +5.25%
													</span> <span class="text-muted">Since last week</span>
												</div> -->
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="card" style="height: 145px">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Doanh Thu</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<i class="align-middle" data-feather="dollar-sign"></i>
														</div>
													</div>
												</div>

												<h3 class="mt-1 mb-3" id="idTolPrice"
													style="font-size: 30px">${tolPrice }</h3>
												<!-- <div class="mb-0">
													<span class="text-success"> <i
														class="mdi mdi-arrow-bottom-right"></i> +6.65%
													</span> <span class="text-muted">Since last week</span>
												</div> -->
											</div>
										</div>
										<div class="card" style="height: 145px">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Khách hàng</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<i class="align-middle" data-feather="user-plus"></i>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">${tolUser }</h1>
												<!-- <div class="mb-0">
													<span class="text-success"> <i
														class="mdi mdi-arrow-bottom-right"></i> +2.25%
													</span> <span class="text-muted">Since last week</span>
												</div> -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>


					</div>

					<div class="row">
						<div class="col-12 col-md-6 col-xxl-3 d-flex order-2 order-xxl-3">
							<div class="card flex-fill w-100">
								<div class="card-header">

									<h5 class="card-title mb-0">Số lượng ghé thăm</h5>
								</div>
								<div class="card-body d-flex">
									<div class="align-self-center w-100">
										<div class="py-3">
											<div class="chart chart-xs">
												<canvas id="chartjs-dashboard-pie"></canvas>
											</div>
										</div>

										<table class="table mb-0">
											<tbody>
												<tr>
													<td>Chrome</td>
													<td class="text-end">4210</td>
												</tr>
												<tr>
													<td>Firefox</td>
													<td class="text-end">3901</td>
												</tr>
												<tr>
													<td>IE</td>
													<td class="text-end">1669</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 col-md-12 col-xxl-6 d-flex order-3 order-xxl-2">
							<div class="card flex-fill w-100">
								<div class="card-header">

									<h5 class="card-title mb-0">Đơn Hàng Gần Nhất</h5>
								</div>
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>Tên Hàng</th>
											<th class="d-none d-xl-table-cell">Ngày Đặt</th>
											<th class="d-none d-xl-table-cell">Ngày Giao</th>
											<th>Trạng Thái</th>
											<th class="d-none d-md-table-cell">Nhà Phân Phối</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Bánh chocopain</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Xong</span></td>
											<td class="d-none d-md-table-cell">La Phù</td>
										</tr>
										<tr>
											<td>Bánh chocopain</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Xong</span></td>
											<td class="d-none d-md-table-cell">La Phù</td>
										</tr>
										<tr>
											<td>Bánh chocopain</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Xong</span></td>
											<td class="d-none d-md-table-cell">La Phù</td>
										</tr>
										<tr>
											<td>Bánh chocopain</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-warning">Đang Đợi</span></td>
											<td class="d-none d-md-table-cell">La Phù</td>
										</tr>
										<tr>
											<td>Bánh chocopain</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Xong</span></td>
											<td class="d-none d-md-table-cell">La Phù</td>
										</tr>
										<tr>
											<td>Bánh chocopain</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Xong</span></td>
											<td class="d-none d-md-table-cell">La Phù</td>
										</tr>
										<tr>
											<td>Bánh chocopain</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-danger">Đã Hủy</span></td>
											<td class="d-none d-md-table-cell">La Phù</td>
										</tr>
										<tr>
											<td>Bánh chocopain</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Xong</span></td>
											<td class="d-none d-md-table-cell">La Phù</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>


						<%-- Calendar --%>
						<div class="col-12 col-md-6 col-xxl-3 d-flex order-1 order-xxl-1">
							<div class="card flex-fill">
								<div class="card-header">

									<h5 class="card-title mb-0">Lịch</h5>
								</div>
								<div class="card-body d-flex">
									<div class="align-self-center w-100">
										<div class="chart">
											<div id="datetimepicker-dashboard"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<form action="${base }/administrator/dashBoard" method="get">
						<!-- tìm kiếm sản phẩm trên danh sách -->
						<div class="d-flex flex-row justify-content-between mt-4">
							<div class="row" style="display: none;">

								<input id="page" name="page" class="form-control"
									value="${saleOrderSearch.currentPage }" style="display: none;">

								<!-- tìm kiếm theo tên sản phẩm -->
								<input type="text" id="keyword" name="keyword"
									class="form-control" placeholder="Search" autocomplete="off"
									style="margin-right: 5px;" value="${saleOrderSearch.keyword }">

								<!-- tìm kiếm theo danh mục sản phẩm -->
								<select class="form-control" name="id" id="id"
									style="margin-right: 5px;">
									<option value="0">Tất cả</option>
								</select>

								<button type="submit" id="btnSearch" name="btnSearch"
									value="Search" class="btn btn-primary">Tìm kiếm</button>
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-lg-8 col-xxl-9 d-flex">
								<div class="card flex-fill">
									<div class="card-header">

										<h5 class="card-title mb-0">Đơn Hàng Gần Nhất</h5>
									</div>
									<table class="table table-hover my-0">
										<thead>
											<tr>
												<th>Mã dơn hàng</th>
												<th class="d-none d-xl-table-cell">Khách hàng</th>
												<th class="d-none d-xl-table-cell">Điạ chỉ</th>
												<th class="d-none d-xl-table-cell">Ngày Đặt</th>
												<th class="d-none d-xl-table-cell">Ngày Giao</th>
												<th>Status</th>
												<th class="d-none d-md-table-cell">Giá tiền</th>
											</tr>
										</thead>
										<tbody id="table-body">
											<c:forEach items="${saleOrderList.data }" var="saleOrder"
												varStatus="loop">
												<tr>
													<td>${saleOrder.code }</td>
													<td>${saleOrder.customerName }</td>
													<td>${saleOrder.customerAddress }</td>
													<td>${saleOrder.createdDate }</td>
													<td>Unknown</td>
													<td><span class="badge bg-warning">Đang Đợi</span></td>
													<td>${saleOrder.total }</td>
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
							</div>


							<div class="col-12 col-lg-4 col-xxl-3 d-flex">
								<div class="card flex-fill w-100">
									<div class="card-header">

										<h5 class="card-title mb-0">Đơn Hàng Theo Tháng</h5>
									</div>
									<div class="card-body d-flex w-100">
										<div class="align-self-center chart chart-lg">
											<canvas id="chartjs-dashboard-bar"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>

			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a class="text-muted" href="" target="_blank"><strong>Trang
										Quản Lý Bepro</strong></a> - <a class="text-muted" href="" target="_blank"><strong>Quoc
										Tran Trung</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-end">
							<ul class="list-inline">
								<li class="list-inline-item"><a class="text-muted" href=""
									target="_blank">Hỗ trợ</a></li>
								<li class="list-inline-item"><a class="text-muted" href=""
									target="_blank">Trung tâm trợ giúp</a></li>
								<li class="list-inline-item"><a class="text-muted" href=""
									target="_blank">Điều khoản</a></li>
								<li class="list-inline-item"><a class="text-muted" href=""
									target="_blank">Dịch vụ</a></li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="${base}/js/adminJS/app.js"></script>

	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		var ctx = document.getElementById("chartjs-dashboard-line").getContext("2d");
		var gradient = ctx.createLinearGradient(0, 0, 0, 225);
		gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
		gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
		// Line chart
		new Chart(document.getElementById("chartjs-dashboard-line"), {
			type: "line",
			data: {
				labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
				datasets: [{
					label: "Doanh Thu ($)",
					fill: true,
					backgroundColor: gradient,
					borderColor: window.theme.primary,
					data: [
						3115,
						1562,
						1584,
						1892,
						1587,
						1923,
						2566,
						2448,
						2805,
						3438,
						2917,
						3327
					]
				}]
			},
			options: {
				maintainAspectRatio: false,
				legend: {
					display: false
				},
				tooltips: {
					intersect: false
				},
				hover: {
					intersect: true
				},
				plugins: {
					filler: {
						propagate: false
					}
				},
				scales: {
					xAxes: [{
						reverse: true,
						gridLines: {
							color: "rgba(0,0,0,0.10)"
						}
					}],
					yAxes: [{
						ticks: {
							stepSize: 1000
						},
						display: true,
						borderDash: [3, 3],
						gridLines: {
							color: "rgba(0,0,0,0.0)"
						}
					}]
				}
			}
		});
	});
	</script>


	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			// Pie chart
			new Chart(document.getElementById("chartjs-dashboard-pie"), {
				type: "pie",
				data: {
					labels: ["Chrome", "Firefox", "IE"],
					datasets: [{
						data: [4210, 3901, 1669],
						backgroundColor: [
							window.theme.success,
							window.theme.danger,
							window.theme.primary
						],
						borderWidth: 5
					}]
				},
				options: {
					responsive: !window.MSInputMethodContext,
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					cutoutPercentage: 75
				}
			});
		});
	</script>
	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			
			// Bar chart
			new Chart(document.getElementById("chartjs-dashboard-bar"), {
				type: "bar",
				data: {
					labels: ["T1", "T2", "T3", "T4", "T5", "T6", "T7", "T8", "T9", "T10", "T11", "T12"],
					datasets: [{
						label: "Bán được",
						backgroundColor: window.theme.primary,
						borderColor: window.theme.primary,
						hoverBackgroundColor: window.theme.primary,
						hoverBorderColor: window.theme.primary,
						data: [54, 47, 41, 55, 12, 45, 55, 73, 60, 76, 48, 49],
						barPercentage: .75,
						categoryPercentage: .5
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					scales: {
						yAxes: [{
							gridLines: {
								display: false
							},
							stacked: false,
							ticks: {
								stepSize: 20
							}
						}],
						xAxes: [{
							stacked: false,
							gridLines: {
								color: "transparent"
							}
						}]
					}
				}
			});
		});
	</script>
	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			var markers = [{
					coords: [31.230391, 121.473701],
					name: "Shanghai"
				},
				{
					coords: [28.704060, 77.102493],
					name: "Delhi"
				},
				{
					coords: [6.524379, 3.379206],
					name: "Lagos"
				},
				{
					coords: [35.689487, 139.691711],
					name: "Tokyo"
				},
				{
					coords: [23.129110, 113.264381],
					name: "Guangzhou"
				},
				{
					coords: [40.7127837, -74.0059413],
					name: "New York"
				},
				{
					coords: [34.052235, -118.243683],
					name: "Los Angeles"
				},
				{
					coords: [41.878113, -87.629799],
					name: "Chicago"
				},
				{
					coords: [51.507351, -0.127758],
					name: "London"
				},
				{
					coords: [40.416775, -3.703790],
					name: "Madrid "
				}
			];
			var map = new jsVectorMap({
				map: "world",
				selector: "#world_map",
				zoomButtons: true,
				markers: markers,
				markerStyle: {
					initial: {
						r: 9,
						strokeWidth: 7,
						stokeOpacity: .4,
						fill: window.theme.primary
					},
					hover: {
						fill: window.theme.primary,
						stroke: window.theme.primary
					}
				},
				zoomOnScroll: false
			});
			window.addEventListener("resize", () => {
				map.updateSize();
			});
		});
	</script>
	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			var date = new Date(Date.now());
			var defaultDate = date.getUTCFullYear() + "-" + (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
			document.getElementById("datetimepicker-dashboard").flatpickr({
				inline: true,
				prevArrow: "<span title=\"Previous month\">&laquo;</span>",
				nextArrow: "<span title=\"Next month\">&raquo;</span>",
				defaultDate: defaultDate
			});
		});
	</script>

	<script type="text/javascript">	
	$( document ).ready(function() {
		$("#paging").pagination({
	        currentPage: ${saleOrderList.currentPage},
	        items: ${saleOrderList.totalItems},
	        itemsOnPage: ${saleOrderList.sizeOfPage},
	        cssStyle: 'light-theme',
	        onPageClick: function(pageNumber, event) {
				$('#page').val(pageNumber);
				$('#btnSearch').trigger('click');
			}
	    });
	});
	</script>

	<script type="text/javascript">	
	$( document ).ready(function() {
		function formatPrice(total){
		    return total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
		};
			var x = ${tolPrice};
			
		$('#idTolPrice').text(formatPrice(x)+'\nvnđ');
		$("#paging").pagination({
	        currentPage: ${saleOrderList.currentPage},
	        items: ${saleOrderList.totalItems},
	        itemsOnPage: ${saleOrderList.sizeOfPage},
	        cssStyle: 'light-theme',
	        onPageClick: function(pageNumber, event) {
				$('#page').val(pageNumber);
				$('#btnSearch').trigger('click');
			}
	    });
	});
	</script>

	<script type="text/javascript"
		src="${base}/js/customerJS/scriptCart.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${base}/js/adminJS/jquery.simplePagination.js"></script>
</body>

</html>