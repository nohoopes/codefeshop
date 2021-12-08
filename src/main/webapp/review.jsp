<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="com.nhom2.model.*" %>
<%@page import="com.nhom2.model.Mail" %>
<%@page import="com.nhom2.data.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<link rel="stylesheet" href="css/review.css">
</head>
<body>
	<%
    //Begin process return from VNPAY
    System.out.print("Cusname: "+session.getAttribute("cusname").toString());
    System.out.print("Cusaddress: "+session.getAttribute("cusaddress").toString());
    System.out.print("Cusmail: "+session.getAttribute("cusmail").toString());
    System.out.print("Cusphone: "+session.getAttribute("cusphone").toString());
    System.out.print("Total: "+session.getAttribute("final").toString());

    Bill bil = new Bill();
    bil.setCusname(session.getAttribute("cusname").toString());
    bil.setAddress(session.getAttribute("cusaddress").toString());
    bil.setPhone(session.getAttribute("cusphone").toString());
    bil.setEmail(session.getAttribute("cusmail").toString());
    bil.setTotal( (int) session.getAttribute("final") );
    int discount =0;
    try {
        discount = (int) session.getAttribute("total") - (int) session.getAttribute("final");
    }
    catch (Exception a){
        discount =0;
    }
    bil.setdiscount(discount);
    bil.setStatus("On delivery");
    bil.setMethod("PayPal");

    BillDAO conBil = new BillDAO();
    conBil.addBill(bil);

    Mail mail= new Mail();
    mail.Send(bil.getEmail(), "Your purchase bill", "Thank you, "+bil.getCusname()+". Your purchase was successful, your total money is: "+bil.getTotal()+", your product will be devileried as soon as possible. Hope you have a greatful time when choosing your products!");


%>
	<div id="container">
		<h1 class="head-title">Please Review Before Paying</h1>
		<form action="execute_payment" method="post">
			<input type="hidden" name="paymentId" value="${param.paymentId}" />
			<input type="hidden" name="PayerID" value="${param.PayerID}" />

			<div class="review-item">
				<div class="title">
					<p>Transaction Details</p>
				</div>
				<ul class="review-detail">
					<li>
						<p class="message">Description:</p>
						<p class="content">${transaction.description}</p>
					</li>
					<li>
						<p class="message">Subtotal:</p>
						<p class="content">${transaction.amount.details.subtotal}USD</p>
					</li>
					<li>
						<p class="message">Shipping:</p>
						<p class="content">${transaction.amount.details.shipping}USD</p>
					</li>
					<li>
						<p class="message">Tax:</p>
						<p class="content">${transaction.amount.details.tax}USD</p>
					</li>
					<li>
						<p class="message">Total:</p>
						<p class="content">${transaction.amount.total}USD</p>
					</li>
				</ul>
			</div>
			<div class="review-item">
				<div class="title">
					<p>Payer Information</p>
				</div>
				<ul class="review-detail">
					<li>
						<p class="message">First Name:</p>
						<p class="content">${payer.firstName}</p>
					</li>
					<li>
						<p class="message">Last Name:</p>
						<p class="content">${payer.lastName}</p>
					</li>
					<li>
						<p class="message">Email:</p>
						<p class="content">${payer.email}</p>
					</li>
				</ul>
			</div>
			<div class="review-item">
				<div class="title">
					<p>Shipping Address</p>
				</div>
				<ul class="review-detail">
					<li>
						<p class="message">Recipient Name:</p>
						<p class="content">${shippingAddress.recipientName}</p>
					</li>
					<li>
						<p class="message">Line 1:</p>
						<p class="content">${shippingAddress.line1}</p>
					</li>
					<li>
						<p class="message">City:</p>
						<p class="content">${shippingAddress.city}</p>
					</li>
					<li>
						<p class="message">State:</p>
						<p class="content">${shippingAddress.state}</p>
					</li>
					<li>
						<p class="message">Country Code:</p>
						<p class="content">${shippingAddress.countryCode}</p>
					</li>
					<li>
						<p class="message">Postal Code:</p>
						<p class="content">${shippingAddress.postalCode}</p>
					</li>
				</ul>
			</div>
			<input type="submit" value="Pay Now" id="pay-btn">
		</form>
	</div>
</body>
</html>