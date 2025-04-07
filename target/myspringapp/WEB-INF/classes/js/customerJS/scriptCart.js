$('.btn-minus, .btn-add').on('click', function() {
	var type = $(this).attr('data-type');
	var parent = $(this).parent();
	var obj_amount = parent.find('.input-amount');
	var amount = obj_amount.val();
	if (type == 'add') {
		amount = parseInt(amount) + 1;
	}
	else {
		if (amount > 1) {
			amount = parseInt(amount) - 1;
		}
	}
	obj_amount.val(amount);

	var price = obj_amount.attr('data-price');
	var total = price * amount;

	var parents = $(this).parents('.action');
	parents.find('.total-pro-1').text(formatPrice(total) + 'vnd')

	$('#total-price').text(formatPrice(totalPrice()) + ' vnd')
});

$('.btn-delete').on('click', function() {
	var parents = $(this).parents('.row');
	parents.remove();
	var total = totalPrice();
	$('#total-price').text(formatPrice(total) + 'vnd');
});

function totalPrice() {
	var total = 0;
	$('.pro-amount').each(function() {
		var price = $(this).find('.input-amount').attr('data-price');
		var amount = $(this).find('.input-amount').val();
		tol = price * amount;
		total = total + tol;
	})
	return total;
}

function formatPrice(total) {
	return total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
}

/*!
* Start Bootstrap - Shop Homepage v5.0.2 (https://startbootstrap.com/template/shop-homepage)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-shop-homepage/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project

/**
thêm mới sản phẩm vào giỏ hàng với số lượng.
 */
function AddProductToCart(baseUrl, productId, quanlity, priceUnit) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, 	// Id sản phẩm
		quanlity: quanlity, 	// Số lượng cho vào giỏ hàng
		priceUnit: priceUnit
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			//alert("Tổng số lượng sản phẩm có trong giỏ hàng là: " + jsonResult.totalItems)

			//tăng số lượng sản phẩm trong giỏ hàng trong icon			
			$("#iconShowTotalItemsInCart").html(jsonResult.totalItems);

			/*$([document.documentElement, document.body]).animate({
				scrollTop: $("#iconShowTotalItemsInCart").offset().top
			}, 2000);*/

		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
}

function UpdateQuanlityCart(baseURL, productId, quantity) {

	let data = {
		productId: productId, 	// Id sản phẩm
		quanlity: quantity 	// Số lượng cho vào giỏ hàng
	};

	jQuery.ajax({
		url: baseURL + "/ajax/updateQuantity",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {

			var currentQuantity = 0;

			var cartItems = jsonResult.cartItems;
			var size = jsonResult.cartItems.length;
			for (var i = 0; i < size; i++) {
				if (productId == cartItems[i].productId) {
					if (quantity == -1) {
						currentQuantity = cartItems[i].quanlity + quantity + 1;
						$("#quanlity_" + productId).val(currentQuantity);

					}
					else {
						currentQuantity = cartItems[i].quanlity + quantity - 1;
						$("#quanlity_" + productId).val(currentQuantity);
					}

				}
			}
			location.reload();

		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	})
}
function DeleteItemsCart(baseURL, productId, quantity) {

	let data = {
		productId: productId, 	// Id sản phẩm
		quanlity: quantity 	// Số lượng cho vào giỏ hàng
	};

	jQuery.ajax({
		url: baseURL + "/ajax/deleteItems",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {

			$("#item_" + productId).remove();
			location.reload();

		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	})
}
