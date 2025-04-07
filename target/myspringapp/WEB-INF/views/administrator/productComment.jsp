<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Comment</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link rel='stylesheet' type='text/css' media='screen'
	href='${base}/css/customerCSS/stylePD.css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<!-- Web Icon -->
<link rel="shortcut icon" href="${base}/img/WebIcon.png" />

<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Import thư viện spring-form -->
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

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

	<div class="direction">
		<div class="title">
			<p>Phong cách thời trang</p>
		</div>

		<div class="director">
			<a href="">Trang chủ</a> > <a href="">Danh mục</a> > <a href="">Thời
				trang</a> > <a href="">Quần áo</a>
		</div>
	</div>
	<main>
		<div class="main-pro">
			<div class="desc">
				<h4>${product.category.name }</h4>
				<h2>${product.title }</h2>
				<div style="font-size: 30px">
					<div class="rate" data-rate-value=${tolStar }></div>

				</div>
				<p>${totalComment }đánh giá</p>
				<div class="cas">
					<div class="color">
						Màu:
						<div class="colors">
							<span id="W"></span> <span id="R"></span> <span id="Y"></span> <span
								id="G"></span>
						</div>
					</div>
				</div>
				<div class="action">
					<div class="price">
						<h5 class="new-price">${product.priceSale }</h5>
						<h5 class="old-price">${product.price }</h5>
					</div>
					<div class="pro-amount">
						<button class="btn-minus" data-type="minus">-</button>
						<input type="text" data-price=${product.price }
							class="input-amount" value="1"
							style="height: 40px; margin-top: 2px">
						<button class="btn-add" data-type="add">+</button>
					</div>
					<button class="addtocart"
						style="border: 0; background-color: #3853d8; color: white;">Thêm</button>
				</div>
			</div>
			<div class="image">
				<div class="pro-img">
					<img src="${base}/upload/${product.avatar }" alt="" width="250px">
				</div>
			</div>

		</div>

		<div class="comments">
			<div class="choose">
				<a href="${base }/productDetail/${product.id }" class="active">
					Đánh giá </a> <a
					href="${base }/productDetail/${product.id }/description"> Thông
					tin </a>
			</div>
			<div class="allreview">
				<h2>
					Tất cả đánh giá <span>(${totalComment })</span>
				</h2>
			</div>

			<div class="row">
				<div class="col-lg">
					<c:forEach var="cmt" items="${commentList }">
						<form>
							<div class="comment" style="border-bottom: 1px solid black;">

								<div class="cmt">
									<input type="text" name="cmt" id="idCmt" value="${cmt.id }"
										style="display: none">
								</div>

								<div class="author">
									<input type="text" name="author" id="idAuthor"
										style="display: none;" value="${userLogined.username }">
								</div>
								<div class="user">
									<input type="text" name="user" id="idUser"
										value="${userLogined.id }" style="display: none">
								</div>

								<div class="product">
									<input type="text" name="product" id="idpProduct"
										value="${product.id }" style="display: none">
								</div>
								<div id="nar">
									<img src="${base}/img/customerIMG/avatar-comment.png" alt="">
									<h4>${cmt.author }</h4>
									<span>${cmt.createdDate }</span>
								</div>
								<div style="font-size: 20px">
									<div class="rate" data-rate-value=${cmt.starRate }></div>
								</div>
								<p>${cmt.content }</p>
								<div id="">
									<i class="fa-solid fa-thumbs-up"><span>05</span></i> <i
										class="fa-solid fa-thumbs-down"><span>10</span></i>
								</div>
								<div class="submit" style="margin-bottom: 50px">
									<button type="button" class="dltCommentBtn"
										style="border: 0; color: white; font-size: 15px; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; background-color: rgb(20, 208, 250); width: 80px; height: 30px; border-radius: 5px; margin-top: 30px">
										Xóa</button>
								</div>
							</div>

						</form>
					</c:forEach>



				</div>
			</div>


		</div>

		<div class="brands">
			<i class="fa-solid fa-angle-left"></i>
			<div class="brand">
				<a href=""> <img src="${base}/img/customerIMG/bottom-logo-1.png"
					alt="">
				</a> <a href=""> <img
					src="${base}/img/customerIMG/bottom-logo-2.png" alt="">
				</a> <a href=""> <img
					src="${base}/img/customerIMG/bottom-logo-3.png" alt="">
				</a> <a href=""> <img
					src="${base}/img/customerIMG/bottom-logo-4.png" alt="">
				</a>
			</div>
			<i class="fa-solid fa-angle-right"></i>
		</div>
	</main>

	<footer>
		<div class="first-footer">
			<div>
				<a href=""> <i>ModeX</i>
				</a>
			</div>
			<div>
				<a href=""> <img
					src="${pageContext.servletContext.contextPath}/img/social-media-logo.png"
					alt="">
				</a>
			</div>
		</div>

		<div class="second-footer">
			<div class="other">
				<a href="">Nam</a> <a href="">Nữ</a> <a href="">Danh sách</a> <a
					href="">Hạ giá</a> <a href="">Blog</a>
			</div>
			<div class="subscribe">
				<h3>Subscribe to news</h3>
				<input type="email" name="" id="" placeholder="Email adress">
				<button type="submit">Nhập</button>
			</div>
		</div>

		<div class="third-footer">
			<div class="tit">Contact us</div>
			<div class="address">Hà Đông, Hà Nội</div>
			<div>121 Cầy Giấy</div>
			<div class="phone">(+84)686-868-9999</div>
			<img
				src="${pageContext.servletContext.contextPath}/img/customerIMG/visa.png"
				alt="">
		</div>

		<div>
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.8091968812764!2d105.81231251485464!3d21.040319185992125!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab11822392d9%3A0x35e9bf7fa41ae21f!2zQ3VuZyB0aOG7gyB0aGFvIFF14bqnbiBOZ-G7sWE!5e0!3m2!1svi!2s!4v1679581625752!5m2!1svi!2s"
				width="600" height="450"
				style="border: 0; width: 250px; height: 200px; margin-top: 30px; margin-left: 30px"
				allowfullscreen="" loading="lazy"
				referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>

	</footer>

	<script type="text/javascript">
    	$(document).ready(function(){
    		$(".addtocart").click(function() {
    			var quantity = $(".input-amount").val();
    			AddProductToCart('${base}', ${product.id }, quantity, ${product.priceSale});
			})
    	});
    	
    </script>

	<script type="text/javascript">
    	$(document).ready(function() {
$(".rate").rate();
    		
    		var options = {
                    max_value: 5,
                    step_size: 0.5,
                    selected_symbol_type: 'fontawesome_star',
                    update_input_field_name: $("#input2"),
                }
    		$(".rate2").rate(options);
    		$(".dltCommentBtn").click(function() {
				//Js object: key phải trùng với property của object 
	    		let data = {
						id: $( "#idCmt" ).val()
				};
	    	
	    	//$ == jquery
	    	//json == javascript object
	    	
	    	jQuery.ajax({
	    		url: "${base }/productDetail/deleteComment",
	    		type: "post",
	    		contentType: "application/json",
	    		data: JSON.stringify(data),
	    		
	    		dataType: "json",
	    		success: function(jsonResult) {
	    			location.reload();
	    		},
	    		error: function(jqXhr, textStatus, errorMessage) {
	    			
	    		}
	    	})
			})
    	});
    	
    </script>

	<script src='${base}/js/customerJS/scriptCart.js'></script>

	<!-- rater -->
	<script src="${base }/js/customerJS/rater.js" charset="utf-8"></script>
</body>
</html>