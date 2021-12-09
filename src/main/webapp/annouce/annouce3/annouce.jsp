<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/annouce/annouce.css">

<header>
    <link rel="stylesheet" href="header.css">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/Hinh_anh/logo.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CodeFe SHOP</title>
    <input id="cart" hidden type="checkbox" <c:if test = "${check_cart=='checked'}"> checked </c:if>>
    <div class="nav-bar">
        <input id="check" hidden type="checkbox" value ="checked">

        <div class="branding">
            <h1><a href="/Home/Home.jsp">CODEFE COFFEE</a></h1>
        </div>
        <label for="cart" class="cart-img"> </label>
        <label for="check" class="menu-icon">
        </label>
        <div class="menu">
            <ul>
				<li><a href="${pageContext.request.contextPath}/HomeController">HOME</a></li>
                <li><a href="${pageContext.request.contextPath}/Story/ourstory.jsp">STORY</a></li>
                <li><a href="${pageContext.request.contextPath}/MenuController">MENU</a></li>
                <li><a href="${pageContext.request.contextPath}/New/News.jsp">NEWS</a></li>
                <li><a href="${pageContext.request.contextPath}/Contact/Contact.jsp">CONTACT</a></li>
                <li><a href="${pageContext.request.contextPath}/CusLoginController" method="post">LOGIN</a></li>
            </ul>
        </div>

    </div>
    

    <div class="your-cart">          
        <ul>   
            
            <c:forEach var="item" items="${cart.items}">
                <div class="item">  
                <img class="item-img" src="${pageContext.request.contextPath}/Product_img/${item.product.code}.png">
                <div class="item-info">
                    <div class="item-name"><c:out value='${item.product.name}'/></div>
                    <div class="item-price">${item.product.price} vnd</div>
                </div>
                Amount:
                <form id ="updateform_${item.product.id}" action="${pageContext.request.contextPath}/CartController" method="post">
                 <input type="hidden" name="viewid" value="annouce/annouce3/annouce.jsp">
                 <input type="hidden" name="productId" value="${item.product.id}">
                 <input class="amount" type="number" name="quantity" min="0" value = "<c:out value='${item.quantity}'/>" onchange ="update_quality(${item.product.id},this.value)"  >  
                </form>
                <script>
               		function update_quality(id,quatity){
            	   //window.open("${pageContext.request.contextPath}/CartController?productId="+id+"&quantity="+quatity+"&check_cart=" +document.getElementById("check").value,"_self");
            	   var form = document.getElementById("updateform_"+id);
            	   form.submit();
               }
            	</script>
                 </div>            
            </c:forEach>
             


            <div class = "Total">Total: ${total} vnd</div>
            <a href="${pageContext.request.contextPath}/CheckoutController">
                <button>Check out</button>
            </a>

        </ul>
    </div>

</header>

<body>
    <div class="date"> 17.10.2021 - 1.11.2001 </div>
    <div class="line"></div>
    <div class="title"> NEW COMBO FOR A NEW DAY </div>
    <div class="container">
        Starting a new day is very exciting with a delicious and flavorful cake - water duo with CODEFE.
        With the desire to bring customers an energetic breakfast at a preferential price, CODEFE offers customers a
        program.
        <img src="${pageContext.request.contextPath}/Hinh_anh/annouce/annouce3/wall.jpg">
        <br>
        From October 16, 2021 to January 31, 2022, Customers can buy combo "Beautiful Breakfast" including 1 Croissant
        cake & 1 cup of CODEFE coffee (Medium size) for 39,000 VND.
        <br>
        NOTE:
        <br>
        - Limited number of combos per day. The program may end early in the day.
        <img src="${pageContext.request.contextPath}/Hinh_anh/annouce/annouce3/paperbag.jpg">
        <br>
        GENERAL NOTES:
        <br>
        - The promotion applies to the following forms of payment: cash, ATM card, credit card and e-wallet.
        <br>
        - Not applicable in conjunction with other promotions (if any) including: membership card incentives (collect
        points and discounts), CODEFE Vouchers, CODEFE Gift Cards/ Cashless Cards, Esteem Gift Vouchers, Sodexo Vouchers
        Meal, Samsung Program, Got It... and other similar promotions.
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