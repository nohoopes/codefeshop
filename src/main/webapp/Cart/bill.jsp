<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Cart/Cart.css">
<link rel="stylesheet" href="Cart/Cart.css">
<meta name="viewport" content="width=device-width,initial-scale=1.0">

<body>
	<div class="container">
		<div class="Success-annouce">
			You have sucessfully order your products. It will take us a few time
			to prepare and deliver your products<br>
		</div>
		<div class="Your-bill">
			<div class="bill">
				<br>
				<div class="bill-1">
					<h2>YOUR BILL</h2>
					<div class="bill-info">
						<div class="user-info">
							<h4>NAME</h4>
							<input class="input-text" type="text" placeholder="${cusname}"
								disabled>
							<h4>PHONE</h4>
							<input class="input-text" type="text" placeholder="${cusphone}"
								disabled>
							<h4>ADDRESS</h4>
							<input class="input-text" type="text"
								placeholder="${cusaddress}" disabled>
							<h4>EMAIL</h4>
							<input class="input-text" type="text"
								placeholder="${cusmail}" disabled>
						</div>
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
			</div>
		</div>
	</div>



</body>

<div id="footer"></div>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="../footer/footer.js"></script>