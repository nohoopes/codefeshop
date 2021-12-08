<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Cart/Cart.css">
<link rel="stylesheet" href="Cart/Cart.css">
<meta name="viewport" content="width=device-width,initial-scale=1.0">

<body>
	<div class="container">
		<div class="Success-annouce" style="color: #C1834E;">
			Oopps, There was something wrong! Please try again! <br>
		</div>
		<div class="error-img"></div>
		<div class="bill-info">
			<div class="shipping-place">
				<div class="address-place" style="color: #C1834E;">We can not
					process your bill right now !</div>
				<div class="product-img"></div>
			</div>
			<div class="line"></div>
			<h3>Your products:</h3>
			<div class="product-list">
				<c:forEach var="item" items="${cart.items}">
					<div class="product-item-name">${item.product.name}</div>
					<div class="product-item-amount">${item.quantity}</div>
					<div class="product-item-total">${item.quantity * item.product.price}</div>
				</c:forEach>
				<div class="line"></div>
				<div class="product-item">
					<div class="product-item-name" style="font-size: larger;">Total:</div>
					<div class="product-item-amount" style="font-size: larger;">${number}</div>
					<div class="product-item-total" style="font-size: larger;">${total}</div>
				</div>
			</div>
			<div class="acknowledgement">
				<h3>Your products will be there. Thank you for your choice !</h3>
			</div>
		</div>


	</div>



</body>

<div id="footer"></div>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="../footer/footer.js"></script>