
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Payment Receipt</title>
	<link rel="stylesheet" href="css/receipt.css">
</head>
<body>
<div id="container">
	<h1 class="head-title">Payment Done. Thank you for purchasing our products</h1>
	<div id="receipt-details">
		<h2 class="sub-title">Receipt Details</h2>
		<table id="receipt-table">
			<tr>
				<td><b>Merchant:</b></td>
				<td>Company ABC Ltd.</td>
			</tr>
			<tr>
				<td><b>Payer:</b></td>
				<td>${payer.firstName} ${payer.lastName}</td>
			</tr>
			<tr>
				<td><b>Description:</b></td>
				<td>${transaction.description}</td>
			</tr>
			<tr>
				<td><b>Subtotal:</b></td>
				<td>${transaction.amount.details.subtotal} USD</td>
			</tr>
			<tr>
				<td><b>Shipping:</b></td>
				<td>${transaction.amount.details.shipping} USD</td>
			</tr>
			<tr>
				<td><b>Tax:</b></td>
				<td>${transaction.amount.details.tax} USD</td>
			</tr>
			<tr>
				<td><b>Total:</b></td>
				<td>${transaction.amount.total} USD</td>
			</tr>
		</table>
		<form action="HomeController" method="post">
			<input type="hidden" name="action" value="homepage">
			<div class="back-btn">
				<input class="button" type="submit"  value="HomePage">
			</div>
		</form><br>
	</div>
</div>
</body>
</html>