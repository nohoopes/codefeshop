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
                 <input type="hidden" name="viewid" value="annouce/annouce1/annouce.jsp">
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
            <a href="CheckoutController">
                <button>Check out</button>
            </a>

        </ul>
    </div>

</header>

<body>
    <div class="date"> 17.10.2021 - 1.11.2001 </div>
    <div class="line"></div>
    <div class="title"> NEW STYLE FOR A NEW LIFE </div>
    <div class="container">
        Experience the CVLife model with the fast - convenient - compact "3 in 1" utility service while enjoying tea - coffee
        Bold CODEFE, shop for fresh food at Vinmart+, experience card opening/banking transactions.
        
        <img src="${pageContext.request.contextPath}/Hinh_anh/annouce/annouce1/voucher.png">
        <br>

        In 14 days of opening, customers who visit CODEFE CVLife store will receive extremely attractive gifts: <br>
        <nav>
            <li> 30% promo code.</li>
            <li> Brand bag. </li>
            <li> Many other promotions.</li>

            
            <br>
            From November 8 to November 21, 2021, customers who visit CODEFE CVLife store participating in the opening program will receive the following gifts:
            <br>
            <nav>
                <li>Limited edition personalized tote bag for bills from 120,000 VND.</li>
                <li>CODEFE member card with bill from 65,000 VND.</li>
                <li>Convenient phone holder when buying a glass of any size.</li>
            </nav>
            <img src="${pageContext.request.contextPath}/Hinh_anh/annouce/annouce1/totebag.jpg">
            <br>
            Note:
            <br>
            <nav>
                <li>For all contributions related to Membership Card, please inbox CODEFE Coffee & Tea Fanpage or CODEFE Customer Service hotline: (028) 1711 2001 (Ext 604) from 08:00 - 17:00 Monday - Sunday to guided.</li>
                <li>Limited number of gifts.</li>
                <li>Promotions cannot be used in conjunction with other promotions.</li>
                <li>CODEFE CVLife Thanh Xuan store always strictly implements epidemic prevention and control measures according to the "5K" recommendation of the Ministry of Health. At the store, customers always comply with 
                    wearing masks, measuring body temperature, disinfecting when entering the store, keeping a distance and following the instructions of the staff to avoid gatherings and congestion at CODEFE CVLife & Vinmart+ stores.</li>
            </nav>
            <br>
            GENERAL NOTES:
            <nav>
                <li>
                    The program applies to the following forms of payment: cash, ATM card, credit card and e-wallet.
                </li>
                <li>Not applicable with other promotions including: VIP Membership card with 10% discount, Diamond 15% and accumulate points, Gift Card/Cashless, CODEFE Voucher, Esteem Gift Voucher, Sodexo Meal Voucher, Chapter Samsung program, 
                    Got It Voucher, Grab Program... and other similar promotions.</li>
            </nav>

        </nav>
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