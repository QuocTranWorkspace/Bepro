<header>
        <div class="logo">
            <a href="${base}/home">
                <p>Be.pro</p>
            </a>
        </div>
        <div class="navi">
            <div class="home">
                <a href="${base}/home">
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
                <c:when test="${userLogined.username == null}">
                    <div class="register">
                        <div class="register1">
                            <a href="${base}/register">Đăng ký</a>
                        </div>
                        <div class="login">
                            <a href="${base}/login">Đăng nhập</a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="register">
                        <div class="register1">
                            <a href="${base}/logout">Đăng xuất</a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="cart-icon">
                <a href="${base}/cart/checkout">
                    <i class="fa-sharp fa-solid fa-bag-shopping">
                        <span id="iconShowTotalItemsInCart">${totalItems}</span>
                    </i>
                </a>
            </div>
            <div class="find-icon">
                <a href="">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </a>
            </div>
        </div>
    </header>