<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Cart/Cart.css">
<link rel="stylesheet" href="Cart/Cart.css">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<header> </header>
<body>
	<div class="container">
		<div class="showcase">
			<div class="title-1">You are almost there</div>
			<div class="title-2">Please fill in the following information
				and you are good to go.</div>
		</div>
		<form action="${pageContext.request.contextPath}/DiscountController"
			method="post">
			<div class="discount">
				<div class="discount-title">
					<h4>Discount code</h4>
					<input class="input-text" type="text" name="discount"> <input
						type="hidden" name="total" value=${total}>
				</div>
				<input class="use-code" type="submit" value="USE">
			</div>
		</form>
		<form action="${pageContext.request.contextPath}/PaymentController" method="post">
			<div class="order">
				<div class="info">
					<div class="info-order">
						<div class="title-order">CUSTOMER INFOMATION</div>
						<div class="block-content">
							<h4>NAME *</h4>
							<input class="input-text" type="text" name="name" disable
								value="${cusname}">
							<h4>PHONE *</h4>
							<input class="input-text" type="text" name="phone" disable
								value=${cusphone}>
							<h4>ADDRESS *</h4>
							<input class="input-text" type="text" name="address">
							<h4>EMAIL</h4>
							<input class="input-text" type="text" name="email">
						</div>
					</div>
					<div class="Your-info-cart">
						<div class="title-order" style="margin-top: 2vw;">YOUR ITEMS</div>
						<c:forEach var="item" items="${cart.items}">
							<div class="one-item">
								<div class="img-item"
									style="background: url('./Product_img/${item.product.code}.png'); background-size: 100% 100%;"></div>
								<div class="info-item">
									<h4>${item.product.name }</h4>
									<h4>Quantity: ${item.quantity}</h4>
								</div>
								<div class="price-item">${item.quantity * item.product.price}</div>
							</div>>
            		</c:forEach>
						<br>

					</div>

				</div>
				<div class="order-summary">
					<div class="title-order">ORDER SUMMARY</div>
					<h4 style="color: red;">${Error}</h4>
					<div class="summary">
						<div class="summary-title">Subtotal</div>
						<div class="summary-value">${total}vnd</div>
						<div class="summary-title">Discount</div>
						<div class="summary-value">${discountNum}vnd</div>
						<div class="summary-title">Total</div>
						<div class="summary-value">${total - discountNum}vnd</div>
					</div>
					<div class="payment-method">
						<br> <label>PAYMENT METHOD</label><br> <input
							type="radio" value="Paypal" name="moreidea"> <span>Paypal</span><br>
						<input type="radio" value="Vnpay" name="moreidea"> <span>VnPay</span><br>
						<input type="radio" value="Ship" name="moreidea" checked> <span>Ship
							COD</span> <br> <br>
					</div>
					<button class="place-order">Place-order</button>
				</div>



			</div>
		</form>
	</div>
</body>
<div id="footer"></div>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="../footer/footer.js"></script>
<footer>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/footer/footer.css">
	<div class="footer-end">
		<div class="Logo">

			<div class="Logo-image"></div>

			<h2>CODEFEE</h2>
			<h3>TEA & COFFEE</h3>
		</div>
		<div class="Copyright">
			<h1>&copy; CODEFE COFFEE & TEA. All rights reserved.</h1>

		</div>
		<div class="contact-info">
			<div class="Logos-all">
				<a href="#">
					<div class="logo-fb"></div>
				</a> <a href="#">
					<div class="logo-insta""></div>
				</a>

			</div>
		</div>

	</div>
</footer>