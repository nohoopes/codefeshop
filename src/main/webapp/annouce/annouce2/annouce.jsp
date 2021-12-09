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
                 <input type="hidden" name="viewid" value="annouce/annouce2/annouce.jsp">
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
    <div class="date">  </div>
    <div class="line"></div>
    <div class="title"> NEW MEMBER CARD </div>
    <div class="container">
        Card definitions and rules:
        The CODEFE membership card is the property of the store. By using the card, you are deemed to have read, understood and accepted the CODEFE
         Terms & Conditions.
        <br>
        <br>
        Please present your card before the transaction to ensure maximum benefits. We will not process the invoice if the invoice was printed out 
        before presenting the membership card or you forgot to bring it with you.
        <img src="${pageContext.request.contextPath}/Hinh_anh/annouce/annouce2/member_card.jpg">
        <br>
        CODEFE membership card is only for the owner recognized when registering on the system, not transferable in any form. If we detect any 
        signs of violation, we will proceed to block the card for security purposes without prior notice.
        <br>
        <br>
        When your card is lost or stolen, you must immediately contact the hotline number (+84 28) 17112001 – 11172001 (ext. 604) during office 
        hours from 8:00 am to 5:00 pm Monday - Saturday (except Sunday and other special events). Tet holiday). Outside office hours, customers 
        can access the website for support in locking the card as soon as possible. We will not deal with any complaints about the card being 
        used until you notify the system.
        <br>
        <img src="${pageContext.request.contextPath}/Hinh_anh/annouce/annouce2/membercard.jpg">
        <br>
        Conditions to register for CODEFE membership card:<br><br>
        CODEFE membership card class:<br>
        With bills from 300,000 VND: customers receive CODEFE membership card immediately.
        <br>
        <br>
        VIP card class:<br>
        With bills from 4,000,000 VND: customers receive VIP card immediately.
        <br>
        <br>
        Customers who are CODEFE Members accumulate up to VND 4,000,000: upgrade to VIP level.
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