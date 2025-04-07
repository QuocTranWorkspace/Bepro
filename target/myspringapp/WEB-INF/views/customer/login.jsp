
<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign in</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' type='text/css' media='screen'
	href='${base}/css/customerCSS/style2.css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='main.js'></script>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Import thư viện spring-form -->
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

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

<!-- Web Icon -->
<link rel="shortcut icon" href="${base}/img/WebIcon.png" />
</head>
<body>

	<header>
		<div class="logo">
			<a href="">
				<p>Be.pro</p>
			</a>
		</div>
	</header>
	<main>

		<div class="container d-flex flex-column">
			<div class="row vh-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-start">

						<div class="text-center mt-4">
							<h1 class="h2">Đăng nhập</h1>
						</div>

						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<form method="POST" action="${base }/login_processing_url"
										class="form-signin">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />

										<!-- kiểm tra xem đã login thành công hay không, bằng cách kiểm tra request param login_error -->
										<c:if test="${not empty param.login_error}">
											<div class="alert alert-danger" role="alert">Đăng nhập
												không thành công, hãy thử lại!</div>
										</c:if>

										<div class="mb-3">
											<label class="form-label">Tên người dùng</label> <input
												class="form-control form-control-lg" type="text"
												name="username" id="idUserName"
												placeholder="Enter your name" />
										</div>

										<div class="mb-3">
											<label class="form-label">Mật khẩu</label> <input
												class="form-control form-control-lg" type="password"
												name="password" id="idPassword" placeholder="Enter password" />
										</div>

										<div class="mb-3">
											<div class="form-group">
												<input type="checkbox" name="remember-me" /> Ghi nhớ cho
												lần đăng nhập sau
											</div>
										</div>

										<div class="text-center mt-3">
											<button class="btn btn-lg btn-primary btn-block"
												type="submit">Đăng nhập</button>
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>

	<footer style="background-color: gray;">
		<p>
			Chưa có tài khoản? <a class="signIn" href="${base}/register">Tạo
				tài khoản ngay</a>
		</p>
	</footer>
</body>
</html>