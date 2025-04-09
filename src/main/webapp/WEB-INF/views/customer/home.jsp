<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>Be.pro - Trang chủ</title>

    <!-- Web Icon -->
    <link rel="shortcut icon" href="${base}/img/WebIcon.png" />

    <!-- Common variables -->
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Noto+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Custom CSS -->
    <link rel='stylesheet' type='text/css' media='screen' href='${base}/css/customerCSS/style.css'>

    <!-- Simple Pagination CSS -->
    <link type="text/css" rel="stylesheet" media='screen' href='${base}/css/adminCSS/simplePagination.css' />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">

    <!-- JSTL -->
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    <!-- Spring Form -->
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
            integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

    <!-- Summernote -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs5.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs5.min.js"></script>

</head>

<body>
    <!-- Header Section -->
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>

    <div class="head-img">
        <div>
            <a href=""><i class="fa-solid fa-chevron-left"></i></a>
            <img src="${base}/img/customerIMG/Heading.png" alt="Banner Image">
            <a href=""><i class="fa-solid fa-chevron-right"></i></a>
        </div>
    </div>

    <!-- Feature Boxes Section -->
    <nav class="feature-nav">
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

    <!-- Main Content Section -->
    <main>
        <section class="py-5">
            <div class="container">
                <!-- Search Form -->
                <form action="${base}/home" method="get">
                    <!-- Search Container -->
                    <div class="search-container">
                        <h4 class="text-center mb-4">Tìm kiếm sản phẩm</h4>
                        <div class="row g-3">
                            <input id="page" name="page" class="form-control" value="${productSearch.currentPage}" style="display: none;">

                            <div class="col-md-6">
                                <!-- Search by product name -->
                                <input type="text" id="keyword" name="keyword" class="form-control"
                                    placeholder="Tên sản phẩm" autocomplete="off" value="${productSearch.keyword}">
                            </div>

                            <div class="col-md-4">
                                <!-- Search by category -->
                                <select class="form-select" name="categoryId" id="categoryId">
                                    <option value="0">Tất cả danh mục</option>
                                    <c:forEach items="${categories}" var="category">
                                        <option value="${category.id}" ${productSearch.categoryId == category.id ? 'selected' : ''}>${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-2">
                                <button type="submit" id="btnSearch" name="btnSearch" value="Search"
                                    class="btn btn-primary w-100">
                                    <i class="fa-solid fa-search me-1"></i> Tìm
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Product Grid -->
                    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
                        <c:forEach var="product" items="${productList.data}">
                            <div class="col">
                                <div class="card product-card h-100">
                                    <!-- Sale badge -->
                                    <div class="badge bg-danger text-white position-absolute" style="top: 10px; right: 10px;">Sale</div>

                                    <!-- Product image -->
                                    <div class="product-img-container">
                                        <c:choose>
                                            <c:when test="${not empty product.avatar}">
                                                <img class="product-img"
                                                    src="<c:url value='/upload/${product.avatar}'/>"
                                                    alt="${product.title}"
                                                    onerror="this.src='<c:url value='/img/product-placeholder.png'/>';" />
                                            </c:when>
                                            <c:otherwise>
                                                <img class="product-img"
                                                    src="<c:url value='/img/product-placeholder.png'/>"
                                                    alt="${product.title}" />
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <!-- Product details -->
                                    <div class="card-body pb-0">
                                        <h5 class="card-title text-center fw-bold">${product.title}</h5>

                                        <!-- Product reviews -->
                                        <div class="d-flex justify-content-center text-warning mb-2">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div>

                                        <!-- Product price -->
                                        <div class="text-center mb-3">
                                            <fmt:setLocale value="vi_VN" />
                                            <span class="text-muted text-decoration-line-through me-2">
                                                <fmt:formatNumber value="${product.price}" type="currency" />
                                            </span>
                                            <span class="text-danger fw-bold">
                                                <fmt:formatNumber value="${product.priceSale}" type="currency" />
                                            </span>
                                        </div>
                                    </div>

                                    <!-- Product actions -->
                                    <div class="card-footer bg-transparent border-top-0 p-4">
                                        <div class="product-actions">
                                            <a class="btn btn-outline-primary" href="#"
                                                onclick="AddProductToCart('${base}', ${product.id}, 1, ${product.priceSale})">
                                                <i class="fa-solid fa-cart-plus me-1"></i> Mua ngay
                                            </a>
                                            <a class="btn btn-outline-dark" href="${base}/productDetail/${product.id}">
                                                <i class="fa-solid fa-eye me-1"></i> Chi tiết
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Pagination -->
                    <div class="row">
                        <div class="col-12 d-flex justify-content-center pagination-container">
                            <div id="paging"></div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>

    <!-- JavaScript Resources -->
    <script src="${base}/js/customerJS/scriptCart.js"></script>
    <script type="text/javascript" src="${base}/js/adminJS/jquery.simplePagination.js"></script>

    <!-- Pagination Script -->
    <script type="text/javascript">
        $(document).ready(function() {
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
</body>
</html>