<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Cart/Cart.css">
<link rel="stylesheet" href="Cart/Cart.css">
<meta name="viewport" content="width=device-width,initial-scale=1.0">

<body>
    <div class="container">
        <div class="Success-annouce">
            Your products are on the way, thank you for your choice !<br>
        </div>
        <div class = "shipping-car">     
        </div>
        <div class="bill-info">
            <div class = "shipping-place">
                <div class = "point"></div>
                <div class ="address-place">${cusaddress}</div>
            </div>
            <div class="line"></div>
            <h3>Your products: </h3>
            <div class="product-list">
                <c:forEach var="item" items="${cart.items}">
                <div class="product-item">
					<div class="product-item-name">${item.product.name}</div>
					<div class="product-item-amount">${item.quantity}</div>
					<div class="product-item-total">${item.quantity * item.product.price}</div>
				</div>
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
<footer>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/footer/footer.css">
 <div class="footer-end">
        <div class="Logo">

            <div class="Logo-image"></div>

            <h2> CODEFEE </h2>
            <h3> TEA & COFFEE </h3>
        </div>
        <div class="Copyright">
            <h1>&copy; CODEFE COFFEE & TEA. All rights reserved.
            </h1>

        </div>
        <div class="contact-info">
            <div class="Logos-all">
                <a href="#">
                    <div class="logo-fb"> </div>
                </a>
               <a href="#">
                <div class="logo-insta" "> </div>
               </a>
               
            </div>
        </div>

    </div>
</footer>