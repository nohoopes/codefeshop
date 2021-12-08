<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="css/exercise.css" type="text/css"/>
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap"
      rel="stylesheet"
    />
</head>
<body class="backgr">

<h1 class="centered">Check Out</h1>

<table class="box">
    <tr>
        <th>Quantity</th>
        <th>Description</th>
        <th>Price</th>
        <th>Amount</th>
    </tr>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:forEach var="item" items="${cart.items}">
        <tr>
            <td><p>${item.quantity}</p></td>
            <td><p>${item.product.description}</p></td>
            <td><p>${item.product.priceCurrencyFormat}</p></td>
            <td><p>${item.totalCurrencyFormat}</p></td>
        </tr>
    </c:forEach>
    <tr>
        <td><h2>Total<h2></td>
        <td></td>
        <td></td>
        <td><p>${cart.total}</p></td>
    </tr>
</table>

<form action="" method="post">
    <input type="hidden" name="action" value="shop">
    <div class="centered"><input class="button" type="submit" value="Continue Shopping"></div>
</form>

<form action="index.jsp" method="post">
    <input type="hidden" name="action" value="checkout">
    <div class="centered"><input class="button" type="submit" value="Home Page"></div>
</form>

</body>
</html>